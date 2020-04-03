Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF839C2BA18
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88DD020737
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FrWjlBnd";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Cs05agOm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387784AbgDCGMb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:12:31 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:35385 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbgDCGMa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 02:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1585894351; x=1617430351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fNnQvjyw1TE1h8Lsg4ys6eq8cOcNnmmkGQuk25MT1Xk=;
  b=FrWjlBndmk8CrGByJHk0sAaarQbf2bxV5+jxM1OYgdt7ikhOxm9jAyDA
   82X0sLh+sFGPztTJq019rpBICo+14HznpKknjYoa1RGXkRiiEjKzVuzQe
   a5lik+HNzAvwfUBEbyNjPGGi/50KqFCItnRcI79d7YLsmb9g/4grdtzo/
   am5soyfAGkpWgYM4pRUNPoCSxolx5ss5B9KLDHijGXKA5HPXeRnnu94ZV
   m4bdpRhitEGvatp4rehlrABvzYGOnykBiu/+r+YVYNDeEexsJCJNDMGFK
   biZ25+MiS0hYVtXTz3WFPZkfF0GFysHOY1jsccIkOCHa303Waa2EEEoTZ
   Q==;
IronPort-SDR: qFfHUNChj6kl6JlzGb7RrRD8mbIPAdzErcIuCCI4WuLvMFw3TRiCpwt+hp4JQv+wTaT3IH+7sy
 u2HmGQ8QgpuSZURrHxrN7Q/6V7K9FPeR8CYOKkv40FEu5swB6x2k2Aiqc3H2fn5Zq55/fjwgXR
 meM5pxBugLR5Lm86gL3SrhwV1B5Dj8YJynsIaO4PR4LVOteVC1hturwxyG1P7vgOzxJNAux6Af
 bXRW2JnlzVcXgurkhWhZKL5rBbkmbHRn4DcRqnuhZPvEgQaBW55wI1+dNqemqisSKormVf46Ox
 ikQ=
X-IronPort-AV: E=Sophos;i="5.72,338,1580799600"; 
   d="scan'208";a="71316160"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2020 23:12:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 2 Apr 2020 23:12:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 2 Apr 2020 23:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/XjjRDbprXkd7l5QRg09VgdGFCYi8sBiDC0rri8w7dJl/Gg/mKMYyusdHbEB+D/TFS4nT/5mwBOWv3LSZK6IteoH7feDM6m72/KwFKJ3CTfWHoYHy/qf9x6HRK1QyfllT+STN+LUWh5ugkJUbv7ltbQtg2Qfn3XF7NUfxTiMfvLtU9j0wui0otaLz94TsGLGgcDpeEJFs/vSsL5PnUo0EHFISlIrU9Ic5AeXLyfVQj9dEUGds/9KSGhwtLCViGDLB7yABZxZADOUmSqt3oVXQQubzTpniOhtCWsA/GLTw1MGjMcCEBEkKgLROnc3iq4fyFX2V+i0altSt7SyDCZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erPspkDGNUBAlW8s3Mn+FTmXPWYPkAZq8tR7QgIssII=;
 b=inuzxaMxopUg8FMelTvNgwD+2yaj5Xj3PtAz31YUwtaNbGz4wSD3VbeVIp/4bP6jKQ0rnAk7516HkAmN9vlao++u7e8QoadC6ziSNXPJLU/rIA84yY4Jam2vZajINWuqTl5Dl3OkSmBTRf0kqand8X4t0/st58g4YUhz7KknhKoXeN3n8CzsLYeF7NdoiYCwty5FB/+3tn1GIWQWC1Ay6JEMvVeKFlPTWvYXDKY1EQuEW2YQvEIDLhaCAnrXiKeAjvE/evOgEmoUaqaAOduRYdF8NPF0c/xbZwp2noe2srT6AYU5CvtF2CF9PBS4LxC+wJNinChUAlOfo++rMyIuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erPspkDGNUBAlW8s3Mn+FTmXPWYPkAZq8tR7QgIssII=;
 b=Cs05agOmohnLh6b4gD3adbKM3AaDuITY/lUzp6DPkrevxUDyLh/oSlmFli9YD5qz5GUhJ7M0e1Kpn9l7QLZ0yMWbSsDUle+faRAspgcruJDGBo+sGhvbnEM94oY/94j7mLtOShMOTTC4paxLFRulY7wornDbV9RE+DT3tImnSX0=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 06:12:28 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 06:12:28 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH 5/5] ARM: dts: at91: at91-sama5d27_som1: Enable eeprom device
Thread-Topic: [PATCH 5/5] ARM: dts: at91: at91-sama5d27_som1: Enable eeprom
 device
Thread-Index: AQHWCX7ZEkLCBK86+EmFjdsQPC+j9w==
Date:   Fri, 3 Apr 2020 06:12:27 +0000
Message-ID: <20200403061222.1277147-5-tudor.ambarus@microchip.com>
References: <20200403061222.1277147-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200403061222.1277147-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c65513a2-78fa-4cb6-b63f-08d7d795fc78
x-ms-traffictypediagnostic: BY5PR11MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB418357035D7FF44CE29D3D8DF0C70@BY5PR11MB4183.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(6512007)(6506007)(478600001)(2906002)(6636002)(2616005)(186003)(6486002)(71200400001)(1076003)(26005)(36756003)(316002)(66946007)(8936002)(86362001)(54906003)(110136005)(66556008)(64756008)(66446008)(8676002)(81166006)(81156014)(4326008)(107886003)(5660300002)(91956017)(76116006)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2nS1i3Ce2cyjtiTAONomtjQrQKv0TOgOhiNhD+UEU05GJM4JtttkOm27TtjJZgwiRD2FhCrHQC4G4gBRYCk6hUdmIu7E+sLLC8IzZjksDHEPnfiij0aNtS7E1mkWSm7KZOEUneFRs6ixuczFHdJ8+4yQViW9sQTVw9RFE4YaIrlLI1HL1NLZXG628LxpWhjnD5v5K0CE3M52r891F/gKq7AyoduNkTcxuJfL/dLd7o2ywhz2X4BptWEQv+6VnnWl/CWF2ptgBKFby0XWnipu/zBIz3krcg8f6f8kkCcWMSLkvw/Bjxsom5oqpZ+ki9JgJ5L+wex8zyWitPVN3Zc5Mtq+WVCJF1ggo+MR+0MVNmosPvGccC3GTMcJXTt/ySFbaX2f4voOg4hIsaUEFUGnCbPeO1Z2HF7lRZsnE7ZgWPdXimi1u4owACjiVKgqMe3G
x-ms-exchange-antispam-messagedata: mR8HssJwAWf33jCi/CL1IVzuh5fTH26mWSz4/y3VU4Ss6nhQQJ74KkYxcXwOl5S4ryQLMhtEl1HNXRPLZWvBoLsDothXfMnWrDxFiAXxKqxUACbAZ8V5YkvvPTzXENoPVse97tVx8uWv5p6K7fQLRg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c65513a2-78fa-4cb6-b63f-08d7d795fc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 06:12:27.4487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvEnQbKXYuqa6pXVdPW+QBF1ZZSA+dBHObN3qdOjZGuxyF5GY/o8HI4rrNQ75udOg4vd/f/r56dwJHE3syO2y6zWViOTpsnTuqaLuAXfHEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ludovic Desroches <ludovic.desroches@microchip.com>

There is an EEPROM on at91-sama5d27_som1 connected to i2c0. i2c0 node
has to be moved from at91-sama5d27_som1_ek to at91-sama5d27_som1.

Enable the i2c EEPROM found on at91-sama5d27_som1. Add an alias for the
i2c node.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi   | 22 +++++++++++++++++++++
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 14 -------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/=
at91-sama5d27_som1.dtsi
index 919000f467e6..b1f994c0ae79 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
@@ -13,6 +13,10 @@
 	model =3D "Atmel SAMA5D27 SoM1";
 	compatible =3D "atmel,sama5d27-som1", "atmel,sama5d27", "atmel,sama5d2", =
"atmel,sama5";
=20
+	aliases {
+		i2c0	=3D &i2c0;
+	};
+
 	clocks {
 		slow_xtal {
 			clock-frequency =3D <32768>;
@@ -89,7 +93,25 @@
 				};
 			};
=20
+			i2c0: i2c@f8028000 {
+				dmas =3D <0>, <0>;
+				pinctrl-names =3D "default";
+				pinctrl-0 =3D <&pinctrl_i2c0_default>;
+				status =3D "okay";
+
+				at24@50 {
+					compatible =3D "24c02";
+					reg =3D <0x50>;
+					pagesize =3D <8>;
+				};
+			};
+
 			pinctrl@fc038000 {
+				pinctrl_i2c0_default: i2c0_default {
+					pinmux =3D <PIN_PD21__TWD0>,
+						 <PIN_PD22__TWCK0>;
+					bias-disable;
+				};
=20
 				pinctrl_qspi1_default: qspi1_default {
 					sck_cs {
diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dt=
s/at91-sama5d27_som1_ek.dts
index 535627c6045b..b0853bf7901c 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -20,7 +20,6 @@
 		serial0 =3D &uart1;	/* DBGU */
 		serial1 =3D &uart4;	/* mikro BUS 1 */
 		serial2 =3D &uart2;	/* mikro BUS 2 */
-		i2c0	=3D &i2c0;
 		i2c1	=3D &i2c1;
 		i2c2	=3D &i2c2;
 	};
@@ -116,13 +115,6 @@
 				status =3D "okay";
 			};
=20
-			i2c0: i2c@f8028000 {
-				dmas =3D <0>, <0>;
-				pinctrl-names =3D "default";
-				pinctrl-0 =3D <&pinctrl_i2c0_default>;
-				status =3D "okay";
-			};
-
 			pwm0: pwm@f802c000 {
 				pinctrl-names =3D "default";
 				pinctrl-0 =3D <&pinctrl_mikrobus1_pwm &pinctrl_mikrobus2_pwm>;
@@ -289,12 +281,6 @@
 					bias-disable;
 				};
=20
-				pinctrl_i2c0_default: i2c0_default {
-					pinmux =3D <PIN_PD21__TWD0>,
-						 <PIN_PD22__TWCK0>;
-					bias-disable;
-				};
-
 				pinctrl_i2c1_default: i2c1_default {
 					pinmux =3D <PIN_PD4__TWD1>,
 						 <PIN_PD5__TWCK1>;
--=20
2.23.0
