/* * * * * * * * * * * * * * * * * * * * * * *
 *
 * Migration:		LikesOnDeleteCascade
 *
 * Date and time:	6/21/2015 1:53:31 PM
 *
 * * * * * * * * * * * * * * * * * * * * * * */

DROP INDEX "public"."IX_public.Likes_Calendar_Id";
DROP INDEX "public"."IX_public.Likes_User_Id";
ALTER TABLE "public"."Likes" ALTER COLUMN "Calendar_Id" TYPE integer;
ALTER TABLE "public"."Likes" ALTER COLUMN "Calendar_Id" SET NOT NULL;
ALTER TABLE "public"."Likes" ALTER COLUMN "User_Id" TYPE integer;
ALTER TABLE "public"."Likes" ALTER COLUMN "User_Id" SET NOT NULL;
CREATE INDEX "IX_public.Likes_Calendar_Id" ON "public"."Likes"("Calendar_Id");
CREATE INDEX "IX_public.Likes_User_Id" ON "public"."Likes"("User_Id");
ALTER TABLE "public"."Likes" ADD CONSTRAINT "FK_public.Likes_public.Calendars_Calendar_Id" 
 FOREIGN KEY ("Calendar_Id") REFERENCES "public"."Calendars" ("Id") ON DELETE CASCADE;
ALTER TABLE "public"."Likes" ADD CONSTRAINT "FK_public.Likes_public.Users_User_Id" 
 FOREIGN KEY ("User_Id") REFERENCES "public"."Users" ("Id") ON DELETE CASCADE;
insert into "public"."__MigrationHistory" ("MigrationId", "ContextKey", "Model", "ProductVersion")
 values ('201506211153078_LikesOnDeleteCascade', 'Oogstplanner.Migrations.Configuration',  decode('1F8B0800000000000003EC5D5B4FE438167E5F69FF4394C71553057437A251D58C98A29965A6B9886246FBD6328929A2C96D1D8701ADF697EDC3FEA4FD0B6BC7B9F896C44E0A08235E5A942F9F8F8FCFB18F8FCF49FFEF3FFF5DFCF01885CE03445990C44B776FB6EB3A30F6123F88374B37C777DF1DBA3F7CFFD7BF2CBEF8D1A3F35BD5EE036D477AC6D9D2BDC7383D9ACF33EF1E46209B458187922CB9C3332F89E6C04FE6FBBBBB9FE77B7B7348205C82E5388BEB3CC641048B1FE4E72A893D98E21C84E7890FC3AC2C2735EB02D5B90011CC52E0C1A57B996C329C86208E219A9D000C5CE7380C0021640DC33BD721150906989079F46B06D71825F1669D920210DE3CA590B4BB0361064BF28F9AE6A633D9DDA73399371D2B282FCF70125902EE7D28593397BB0F62B05BB38E30EF0B61327EA2B32E18B874572084B10F90EBC8831DAD42441B4AFC65CB31ABFAED389ADA9D5A2C88F4CC3E1D7CDA9DED7FFC7C78B0E3ACF210E7082E63986304C21DE72ABF0D03EF17F87493FC0EE3659C87214F302199D40905A4E80A252944F8E91ADE95D338F35D672EF69BCB1DEB6E5C1F36C1B3187FD8779D0B3238B80D612D0F1C33D63841F02748E60830F4AF00C610C51403161C554697C6A2FF56A3110124AAE43AE7E0F12B8C37F87EE9923F5DE73478847E555252F06B1C10CD239D30CAA132C805780836057DD270A70045648C638FD665AE730DC3A259761FA44C2B6642936F8D189CA224BA4E4219A46EF1ED06A00DC464324967B3759223CF82E4AFC1EF504F29ADD1122854287489B5B6E4908D0269A9A911598B861AA1A21EAFA246ACAD68E5A959CC1BE5EC545981E1B67A2B747E575E23E53D4F627C5F6B2F1582A224D30CDA0D542D1987C48A688135DA8AFC5C25E4D8ECE384A9CC373AB6CDFD42D6849E6DC59858F2D384D0A2592B91A4B68F40DA6494BE32122C8F57D2E75D3B5FF1689506B906DEF30FB222F3DF24E8E9D907FA09257F10E49BA0E19CE1DE216F6808822B88988433A09384889D69C71FC1C6AEDF150A3C2875845E1081D075AE10F9ABBCB41CBACEDA03741EFB7D90EB8217D58E3E7E93FF3B400F30C323308D77166AE2D8EE2CB4CFFBCEA2DF59869D8C86F6A97CCCE8ADD7D1F669012BDBA675A19E8AF136291BD04E12699F77499CCE19774AE87F9181BE4420089F7D94E31CDF53EE7AC50AACC942E4E25ECC35807E556FB9D97F0519A686E243CDB51382C60ED6D176B8FE3A6C780195AFC3FAEBE92065BF0259F64782FC6B98415C289EADEAAB08EF1B81D146F032AA53AEE9738F42B484A85D945AAA4EBB9CE61127A595A975969D8660935534D9092A03790EE124BCF2210A9FA81DCE098FC8B17318DD42541D02095E538DFE0D8439F9B9ABF05768FD33887340EF1265F3BDEEE6A7F01609ED55BB59687F0E90775F37FED8DDF83845546ACBC6877DC81CD1073D93CC635837FED043F2CF79D8201FF4919C6F88A03484ECF750BD86292E7E370CFCD443FCA58713BEC3A7BD9E095C240FE2107BBBFB3DD320972389AADD8F87AA3A31C5E95026DE4D552B54A99B761AD5204D43ABD8F5CF54AB9ACB5D9B6299B153677A8CE4AB0A390D061FC749FC14257486663C166662C7E6E32C4BBCA0E096CE59DEDCD2C4E1BFC4BE63E6C36CAC47C90B7F4E9817A4845DE4605ABA7F5366D83B446DAF354334774A117D4F249FA05FC6273084183A0C955A7B99077CF508265CF3052E721CB36224F5F818CE50F0B16E9F81BC7F96675EE1931251776733458C8C19205EF3DB886BB9F33774319F8DF96C5B1EB9262A258DF7A1733EA22B622473C4EB4E03C6EE4713608A78636B9B4BCBFB61FF427731A8E54EF8EA4C6216FC8A58D720881B8B883BAE681D7CC49A6390905C9E8495512FCF9E62135359BD4E37170785A70A0B4510F9455D4192B6B31E38BA3B69E92976AD9ECEE553B9D299694F4F67BAE0BACE4C107A3AABF7761D94CE3F20017362D1C263CEA3CA35EE7E8C94C5D6F85CAFE7A92EF4DC1AB4D2320E9413415961444ED873A910985E0E29C7B5E981BD15CEF04734CF15A604A3392239E05566741CDD0687374771A9791D33D71FD7CF240A9CAFBF65D2EA89D37318DB4F563859B8EEE546337A9292BF539D68C7F16A70C09A2C8DC1913A62E2953FAB3E0DEBBAC59C053B96058B794B54E4E21CA429D1372E4AB22C71D62C4472F5DDDA3E78306218732FD3C410D6D4D623E104810D946AC9D084D2D30065984666DE027AB35DF991D24C77F6B71C46D588F2F1AEAE597530553DE8DFAAA951C48CCEDAF6878699A7647E11B9991653851AC151BB3A345E158400697CC6AB24CCA3B8CDEFDCD59BBDD2F0FD59898AB0984BB4CB3C9A2B4C520C3A91EB466B221D15E31646B4ACEC57A7A7FFF32C511933C6039445E618952DC983E8EDCB2E142E4C8C07E28A272336CC2018A9C61A53C74485B5DD5E5B7DDB105838128FC04A2CA4A28E351284A22E35471282897830A1C242EAF9982241F4F90A6BBC2262480357949BA30901483C9C50618E27461FF180628D39A21A7FC4A3AAB593D17E666F8ED3FEE20A6CAFFDFA6EE3B4FF95B8C8ACCF715CD419D2065CD4779BEA1EDA84BBF0284DA93952F928CFC3944516BB94365A45D8AFB42DCC47E04355785CBE7C3252AC73348D93698D53CA5EC24D409E47DEB72163A52B8EC7D07AE73A319AA00D01A7297E7919126FD61D3711CE49647CE1E0FA585D2CA8C7A02B2B4B7112A96C3312A31A46274F853FBE02184C60E92A1948A01D5DB29F64EC82D791E9868B5DB4DFF24273EECFA18B4C21B6BFC09CA3F74516D729F27AFDA0781B3BCB6894571DED6030DDD1B221398AFB0CC90ED5D7198C1A7E6BBDC1135074ADA3FB6DE837E7F3EE5D3FD66CCCDAF13EDE81FC2920B6B566BCEBFA6DAC97E4BE37F1C0B6AC5BD7034E4B04F594D64FFBFC309135549E20E426B509573F45484F0E8BD2FDDFFFB506E53D8035A1F95BC943E0D3B7808B7493FD336C4ACE411CDCC18C59DC4BF7F3ECC3EC40FAC6C374BEB730CF325F883DEFF8E882B84C2F10A11EC4F863A9595D41E8965910ECC2CC4660411B0D80492478AD623C914ADCC759ECC3C7A5FBAFA2D39173F68F6F65BF1DE71211293972769D7F6F2BB5AEC3E47BBBEB2424B2B3214665B00F8250D2D687A1F0D690A5D8707D2D44473F9341E3B37E6D63AB1A63976AFE2711D6B19B0A9FB23DA4BF9C8D3D044393683D4CEDD43CEBBB3001F8D0962035EF7A188E260F3BCE23484A3BF2B0ED86D0E5650F625E5B42B601985D26F69F44F1A6B0B54ED022D004EFBED9251EBBB7CAA9C243308454C621005D09BE83360A3599977E912E636EEDED0851DF03C2DB15A9D1CB29249D0E0290F349C7AEDEE86C22D1D5F862F91A020D525CFAF0041C227E1051E100E12A89338C40A0BEE410BB20F682148432075447878958D3B9D59072CD094C09367DA6D3CDD464C01E976A3D80C4ED3E4E3C4F56156FFC5964384D4918F4A159531084F6F795171002B3CCB2296C262CC3C43A616BF25B474BD8D014778CFE0CBBC6D1FE22395EAF26202D514AAF271C1D2F052F2018665986AF291C563BD81B1312ABDDEA2505459F69A92665C88BA6CFA1EC4CA1640F394B372DBE1B40569959DCED194F9D4996FD39962DE375E7A96953315B3331DBA68474996BBA3CCDD634CD16646DD2953689B33587B305599F96D49FE16998E0D932AA3663F49593416561165F978DF31ADB9323A799E5C90B7A93F3308DE96E2D8573F8DAF2DADAC4894C20499357F626CEFA35A6B2B5544CFB2959ADEB76922DD58806720C73FF4B05B101B260D340D0D8B6187AC2015CB7398BEF92CA109028AA9AC88FB510039F9CCEC7080777C0C3A4DA8359C67F7AE84B740BFDB3F832C7698EC99461741B0AB93BD49EE81ABFC82815695E5CA6C5B9B98D2910320332057819FF980761F32D9F538D0FAE05821A2AA597B270F2526FE5A6F98CD745121B0295ECABEDAB1B18A52101CB2EE335788043682342FB156E80F754C5A9B483F42F84C8F6C549003608445989D1F4273F890CFBD1E3F7FF17600081A15E81AC650000', 'hex') , '6.1.1-30610');
