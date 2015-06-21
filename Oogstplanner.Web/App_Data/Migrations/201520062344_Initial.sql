/* * * * * * * * * * * * * * * * * * * * * * *
 *
 * Migration:		Initial
 *
 * Date and time:	6/20/2015 11:43:40 PM
 *
 * * * * * * * * * * * * * * * * * * * * * * */

CREATE SCHEMA IF NOT EXISTS "public";
CREATE TABLE "public"."Calendars" (
    "Id" serial NOT NULL,
    "Name" text,
    "User_Id" integer NOT NULL,
    CONSTRAINT "PK_public.Calendars" PRIMARY KEY ("Id")
);
CREATE INDEX "IX_public.Calendars_User_Id" ON "public"."Calendars"("User_Id");
CREATE TABLE "public"."FarmingActions" (
    "Id" serial NOT NULL,
    "Month" integer NOT NULL,
    "Action" integer NOT NULL,
    "CropCount" integer NOT NULL,
    "Calendar_Id" integer NOT NULL,
    "Crop_Id" integer,
    CONSTRAINT "PK_public.FarmingActions" PRIMARY KEY ("Id")
);
CREATE INDEX "IX_public.FarmingActions_Calendar_Id" ON "public"."FarmingActions"("Calendar_Id");
CREATE INDEX "IX_public.FarmingActions_Crop_Id" ON "public"."FarmingActions"("Crop_Id");
CREATE TABLE "public"."Crops" (
    "Id" serial NOT NULL,
    "Name" text,
    "Race" text,
    "Category" text,
    "GrowingTime" integer NOT NULL,
    "AreaPerCrop" float8,
    "AreaPerBag" float8,
    "PricePerBag" decimal,
    "SowingMonths" integer NOT NULL,
    "HarvestingMonths" integer NOT NULL,
    CONSTRAINT "PK_public.Crops" PRIMARY KEY ("Id")
);
CREATE TABLE "public"."Likes" (
    "Id" serial NOT NULL,
    "Calendar_Id" integer,
    "User_Id" integer,
    CONSTRAINT "PK_public.Likes" PRIMARY KEY ("Id")
);
CREATE INDEX "IX_public.Likes_Calendar_Id" ON "public"."Likes"("Calendar_Id");
CREATE INDEX "IX_public.Likes_User_Id" ON "public"."Likes"("User_Id");
CREATE TABLE "public"."Users" (
    "Id" serial NOT NULL,
    "Name" text,
    "FullName" text,
    "Email" text,
    "AuthenticationStatus" integer NOT NULL,
    "LastActive" timestamp NOT NULL,
    CONSTRAINT "PK_public.Users" PRIMARY KEY ("Id")
);
CREATE TABLE "public"."PasswordResetTokens" (
    "Id" serial NOT NULL,
    "Email" text,
    "Token" text,
    "TimeStamp" timestamp NOT NULL,
    CONSTRAINT "PK_public.PasswordResetTokens" PRIMARY KEY ("Id")
);
ALTER TABLE "public"."Calendars" ADD CONSTRAINT "FK_public.Calendars_public.Users_User_Id" 
    FOREIGN KEY ("User_Id") REFERENCES "public"."Users" ("Id") ON DELETE CASCADE;
ALTER TABLE "public"."FarmingActions" ADD CONSTRAINT "FK_public.FarmingActions_public.Calendars_Calendar_Id" 
    FOREIGN KEY ("Calendar_Id") REFERENCES "public"."Calendars" ("Id") ON DELETE CASCADE;
ALTER TABLE "public"."FarmingActions" ADD CONSTRAINT "FK_public.FarmingActions_public.Crops_Crop_Id" 
    FOREIGN KEY ("Crop_Id") REFERENCES "public"."Crops" ("Id");
ALTER TABLE "public"."Likes" ADD CONSTRAINT "FK_public.Likes_public.Calendars_Calendar_Id" 
    FOREIGN KEY ("Calendar_Id") REFERENCES "public"."Calendars" ("Id");
ALTER TABLE "public"."Likes" ADD CONSTRAINT "FK_public.Likes_public.Users_User_Id" 
    FOREIGN KEY ("User_Id") REFERENCES "public"."Users" ("Id");
CREATE TABLE "public"."__MigrationHistory" (
    "MigrationId" varchar(150) NOT NULL,
    "ContextKey" varchar(300) NOT NULL,
    "Model" bytea NOT NULL,
    "ProductVersion" varchar(32) NOT NULL,
    CONSTRAINT "PK_public.__MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey")
);
insert into "public"."__MigrationHistory" ("MigrationId", "ContextKey", "Model", "ProductVersion")
 values ('201506202143125_Initial', 'Oogstplanner.Migrations.Configuration',  decode('1F8B0800000000000003EC5D596FE436127E5F60FF83A0C785D3ED63C6F018DD099CF638EB647CC0ED04FB36A025BA2D44D752946363B1BF6C1FF627ED5F5852D4C14B122975B77B02BF0CDC3C3E5615ABC86291A5F9DF7FFE3BFBE1250A9D6788B22089E7EEC164DF7560EC257E10AFE66E8E1FBF3B717FF8FEAF7F997DF6A317E7B7AADD116D477AC6D9DC7DC2383D9D4E33EF0946209B448187922C79C4132F89A6C04FA687FBFB9FA607075348205C82E538B3BB3CC641048B1FE4E722893D98E21C8457890FC3AC2C2735CB02D5B90611CC52E0C1B97B93AC329C86208E219A9C030C5CE72C0C00216409C347D721150906989079FA6B06971825F16A99920210DEBFA690B47B0461064BF24F9BE6A69CEC1F524EA64DC70ACACB339C4496800747A568A672F74102766BD111E17D2642C6AF94EB42807377014218FB00B98E3CD8E92244B4A1245F361D93AADF9EA3A9DDABD58268CFE4E3F1874F93A3C3E34F077BCE220F718EE03C86394620DC736EF38730F07E81AFF7C9EF309EC77918F2041392499D50408A6E519242845FEFE063C9C6A5EF3A53B1DF54EE5877E3FA30062F637C74E83AD76470F010C25A1F38612C7182E04F90F00830F46F01C610C514031612554697C6A2FF56A3110524A6E43A57E0E50B8C57F869EE923F5DE72278817E555252F06B1C10CB239D30CAA132C835780E56057DD270170045648C338FD665AE7307C3A259F614A4CC2A264293AF8D1A5CA024BA4B4219A46EF1F51EA015C48499A4B3D932C9916741F297E077A8A794D66809142A14BAC45A5B72C84281B4D4D488AC45438D50518F575123D656B4F2D4CCA68D71769AAC20705BBB153ABF1BAF91F15E25317EAAAD972A4159A28CD98D53CD1807C48A688135DA82FC5C2464D7EC1384A9CA3726B6CEE54236849E55C59858F2D384D0A2592B91A4B68F40DA6494B932122C7757D2E7DD38DF70679506B903DEE6075910FE57097ADDF8403FA1E40F827C1F3492335C3BE4050D41700B11D37006749E10B533EDF82358D9F5BB458107A58ED00B2210BACE2D227F95679613D7597A80F271D807B92C64512CE8D91AD6F8BF03F40C333C1CD2785DA1FE8DEDBA42FBBCAF2BFA7565D8BE68E89CCA9B8CDE751DED9C16B0B2635A17EAA918EF90B201ED3491F679D7C4DDD9E12E08FD5B19E873048270E3A39CE5F8894AD72B6660492622179762AE01F4AB7ACBB5FE0BC83075139F6BA99D1334B6AD8EF6C2F56761C3D3A77C16D69F4D0719FB2DC8B23F12E4DFC10CE2C2F06C4D5F45785F088C1682ED984E39A79B1E85580931BB28B5349D763DCD234E4B4B4FEB32BB08C12AAB48B2D3D3026313AA4924E54314BE521F9C531D515E57307A80A8DA0212BCA4F6FC1B0873F2735F91AED0FA6710E7809E23CAE607DDCD2FE00312DAAB3EB3D0FE0A20EFA96EFCA1BBF1598AA8CE968D4FFA9039A28F7B98CC6358373EEA21F9E73C6C908FFB48CE57444F1A420E7BA85EC21417BF1B017EEC21FEC6C309DFE1E3410F03D7C9B338C4C1FE610F1BE4602451B5FFE144352666361DA6C487A86A7B2A2DD3CEA01AA4DDB02A76F433B5AAE664D7665866E2D4391E23E5AA42EE8680CFE2247E8D12CAA1998C054EECC47C9665891714D2D2C5C99B339A38FCE7D877CCE2978DEF2805E0AF88F08294888B6C4B73F76F0A87BD43D4DE5A334473A214D10F44F209FA4D7C0E4388A1C350A9AF9779C057376022355F902227312B41D2688F2187427C75FD02E463B3BCF08A789488BA3F99286A642C00F190DF465CCB89BFA18B456CCCB96DB9DFEAD792F1CC16C78B4EBAC480C24826C5434B03C64E396B644E3C3FB5D1D47295D72FF82E465B4E68DDCC6EC1DE993FBD20CE2E08E2C643E1B60F5A075FB0665B2224973B53E563CBDC536CE2BAAA87DBC68D5764AA885004912FB715246979E981A3AB85969E6215E9E95CDE5A2B9D9915F474A613AEEBCC14A1A7B37A8AD641E94EEB1230A7162D32E6E29B5CE3EE8B41596D8DF7D99A4F75A2A7D6A0959571A09C0ACA06234AC25E4A85C2F44A48D93E4D37D0B54886DF3279A93023182D11291CAE0AA3632B35D84C398A4BCBEBE05CBF7D6E4815B8C87B0BD3EA8ED3B3A9DA332BEC2C5CF772A119CDA4147D5419EDD85E0D365893A931D85247305E4597EADDB0AE9B4DD9BBC3B260366D79A038BB02694AEC8D7BB05896384BF65A71F1DDD2FE1D5FC430A65EA679CE57535B8F8413045650AA2543134A2F029461FA48F201D093E6C28F9466BABDBF6533AA4694B77775CEAA8DA9EA41FF565D8DE2F9E6A46D7D68847941F88BC849B160156A1447EDEAD0A7A320044813C15D24611EC56D51E0AEDEECCE84EFCF4A5484D954A25D96D1541192E2D08952379A1369AB183731A267653F3B3DFD373345652C9807288BCC312A5F9207D1FB975D28DC932D1E882BDE19B5610EC14833D6B83A2626ACEDF6D6E6DB86C09E06F108ACC4422BEA773F8252D4A5E648C2C31E1E4CA8B0D07AFE7D8FA0FA7C85355EF17A470357949BA3098F817838A1C21C4F7C09C4038A35E688EA63201E55ADDD19EB67FEE638EB2F8EC0F6D6AFEF36CEFADF488ACCFB1C27459D236D20457DB75D5D439BC7273C4A536A8E545E91F3306591C52AA57D3B22AC57DA16E623F00F47785CBE7C67B45817681AA7D39AA094BD869B806C46DFD7A16365288EC7D046E73A319A2714024E53BC7D1D124FD61D27112E48647CE0E0FA581D2C68C4A02B414A0912A9623352A31A46A74F453CBE02184C60192A1948A01D5D729C64EC84D7AFC40D27BB68BFE689E6C29F43279942AC7F82B940EF5626D729526CFDA0B81BBBCCE89BABFAF58101BBA375430A14F739921DA6AF731835F2D6468377C0D0B581EEDD5281766ED7A3062C9ADCAB02ACD998E9E7C3C403455C40AC6BDAF9E8F74E4D790B97A3A75BBA40308901B74C7BD71552CB8BEA5D9A7EED05C88EECEACA2588DCA47622EBCB10E9D263565E40F47FBA41B991604D683657F21CF8F436E23A5D65FF0C9B922B10078F30633EFFDCFD34399A1C4B1F7CD89D8F2F4CB3CC17DEA2777C81419CA62DBC580F62FCA1B4ACAE47E9965911ECC8CE4660CF461A009397E1B589F1442A2F4F2E631FBECCDD7F159D4E9DCB7F7C2DFBED39378868C9A9B3EFFC7B5DA9761D4EE7B73B4F42563B1B62543EFB200825897D180AEFA158AA0DD7D74275F49C0C1A9FF56B1B5BB518BBC4F33F89B28E5D54F804EE21FDE5DCEC21189AB4EB6166A7665D3F8609C027B604A959D8C3703459D9711E4152DA91956D37842E4B7B90F0DAF2B30DC0EC32B3FF2486B7E1A5F50D1D82112BABE6F1F0373BC1635756397178088690D83804A02BDD77D032A1A6F6D28FD3652CACBE9E55A2EF02E3DB55A9D1D329A4A00E0290B34BC7CEDEE8EC2231D4B9B52C1F8106E95DFCF0841CA27E1051E500E12289338C40A0DE2411AF20F6821484B204D43087895A53DE6A48B9E61CA6049B5E13EA383519B027A45B0F2049BB4F129BC9B2E25D3F8B8CA75D5206FDD3B05D5084F6FB9D2D288159A699D562D2A3072C53C53A816BE7978096E747BB68F9FD19774DB8DC2A31EECD26BAE5D5D2DB4D7247DC7E0B136C96756834C91B720DAC56946F4C49AC569D6D2A8A3EF3524DD290274D9F53D99952C9AE55E66E5AE4F59359661E707B065467D2657FCE65CB78DD796BDAD4CCD6CCCC3696902E934D97B7D99AB6D982AC4DC2D22675B6E674B620EBD394FA333E0D133E5B46D56690BE7172A8ACCCE25DAF719E637BB2E46E667DF28ADEE440EC06BB6B4BE91C3EB7BCB5368F3E7620699337F6E6DDF55BB0B2B6D44C7B96ACE6753DC997EAFB02B20D73FF8104F101B260D540D0572F31F4840DB86E73193F2695232051543591AF4E21063ED99DCF100E1E818749B507B38CFF34D0E7E801FA97F14D8ED31C139661F4100AB93CD49FE81ABFC83015699EDDA4C5BEB90E160899016101DEC43FE641D87C6BE74213136B81A08E4A19352C82AE347AB86A3EB3759DC48640A5F86AFFEA1E466948C0B29B78099EE110DA88D27E812BE0BD56AF46DA41FA274214FBEC3C002B04A2ACC468FA939F4487FDE8E5FBFF0B300005B62BEB47650000', 'hex') , '6.1.1-30610');