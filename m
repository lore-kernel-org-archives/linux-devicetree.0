Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF5C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E588206DB
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 08:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iLKiEE9E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfLEIGf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 03:06:35 -0500
Received: from mail-eopbgr10067.outbound.protection.outlook.com ([40.107.1.67]:16054
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728419AbfLEIGe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 5 Dec 2019 03:06:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMQ18Fx7962GpCZZgm9oPuCkEU0JijoCaIe22mBYGHQz2YLAFOkjxlKlbJJdVvK8dlH+OQCbiW1A0YUYAcy6K/baIaUPPugZLq+X9dYGTjIWoD+VXNfZ5S/SuSEVfKA+HAOLAlcDBpp5LR8wA96htlhj+9Jiwa78jPNEL4hcBeJ5tCEI6OUmcKPHoJN9nK9hff3yXMAMaWuL803HT0Qcb1OhyHEAiv6yl6Vx+hL4PcQ5TTrrPQDbfC3Vzen0ajCnU6QX/3rIxtgXPNgqlGFkE8Rk5mw89lRV6JmTYUaKHYg2cNDfsFWwhbizUpR+4AuqfNITypd7rTFShOd6X/IG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAxxAPhDHJsXuy9J5wF2DMzGS8MhlBBh/Nb4LJhFPgk=;
 b=cdMjrm+RgyXsM+KgmSMMSq4kSALE5QpDXeVs0Etz76040oaROcLFtgmu5RiQcFGsGs5yoVcGA8NvJTFiBGUoWu6u8vTFAnRXhsiKeULkz1gfcJJ1SM+mRhnxITPVxKcMJ/E1xIdy04LpkRu6mBilS3/wzbE6RjleO1YzwArkHUlhxNYtAOLDAVAuTTwAFyQfj815UQukA3vjpnvrLHV2ViX/9sOVhaS2/EWbLbLrXf+XHXeQBxrBNhgR5ReJ+7VPwo6JlvvZ+zkSpu4pMqPX4joLT4CwEmuZ/jEPBRLi6YUOCXNWbjD83jAHm/rSdogXcvOGlcHNQ30Y23t+iXHaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAxxAPhDHJsXuy9J5wF2DMzGS8MhlBBh/Nb4LJhFPgk=;
 b=iLKiEE9E5xy7Lx3m17vyqthdud/0AwZ8wxtAaiERRLdsL9LdLSHRhSAvckjHhSIqz4m2b4/nJ+Xx/8hKkC/xRH550LxaKmxryNYsDtsewY9h/fbrEfbykXj6LAb2dItgwDVkmxJ0v7JXmisKuCfZDu5u/vT0INP+zksnQjPTlPo=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6526.eurprd04.prod.outlook.com (20.179.233.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 5 Dec 2019 08:06:28 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::bd10:c4cb:c1ed:97df%3]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:06:28 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Jun Li <jun.li@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: imx8mn-evk: enable usb1 and typec support
Thread-Topic: [PATCH 3/3] arm64: dts: imx8mn-evk: enable usb1 and typec
 support
Thread-Index: AQHVq0Llfh22AuNNeUK2q/2BWGfQhw==
Date:   Thu, 5 Dec 2019 08:06:28 +0000
Message-ID: <1575533029-13049-3-git-send-email-jun.li@nxp.com>
References: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c76a1300-ee16-4e8b-9c32-08d7795a07e4
x-ms-traffictypediagnostic: VE1PR04MB6526:|VE1PR04MB6526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB65266344F9EB3FD460BC50C5895C0@VE1PR04MB6526.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(189003)(199004)(6506007)(186003)(25786009)(26005)(71200400001)(71190400001)(4326008)(86362001)(6486002)(6116002)(7416002)(102836004)(36756003)(76176011)(305945005)(52116002)(66476007)(99286004)(2201001)(66946007)(66556008)(64756008)(66446008)(7736002)(44832011)(11346002)(81166006)(8676002)(81156014)(14454004)(316002)(2616005)(478600001)(3846002)(5660300002)(8936002)(50226002)(54906003)(2906002)(6436002)(6512007)(2501003)(110136005)(32563001)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6526;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sK6ONeIUPH8NbMX4p+OsK742QsNdKGrfncdHMm/d4p1KW8Z/nos7dZiqNxF6Kj7LtjgeY1a4l1jYhumgIz75l8GU54O/Y/CfQT2YPB/q6WGhoRRLZ4hT9eKV8i+qFHHLIVR+LvNeoCJyPFy0+z1BWbK+3f3FIhtCJkJOjN5v5ccVoraYkZCQFY7ZDzO5kFO5/GbIQDbZ06AvjrrYUsR9A2uu1ZLLHL31VY5ZpTUPGpspINZfxIybpF6Deuuazz2RPxhbfvDbZWZgiw7SVtMSrZtvCocqY6ur58jZCq8eIUHGjD40ZtarMxNGShbOG3nhKNf37TdCs5QS06uujSJdCsYOvU/WVPGWA0/duTX4e5u2YtiwkHGC/FNAgKwmFDwvI0DoVtqG+334aW0HkFAxTdTbqFP7s9z7TaJozycMeo9MtSt+MHqyBK10m5DZJwgSLjsAVA9rnbR8ukxhhk4f2LuGFPE4q7Zt8G/8okQilgsWv0ykSZeK+S9pAL33Aww2AyXMjAfTPK1TqAgDcf2BaA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76a1300-ee16-4e8b-9c32-08d7795a07e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:06:28.6292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFdKoY/RNRwmCfk8py7Puf/ZnNVmRcjuwtAgDBxqQw4xI0KQSobQGwMLg/6PYiR3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6526
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

USB1 port has typec connector with power delivery support:
- Dual data role: host and device.
- Dual power role: source and sink, prefer power sink.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 65 +++++++++++++++++++++++=
++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mn-evk.dtsi
index 2a74330..61511e9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2019 NXP
  */
=20
+#include <dt-bindings/usb/pd.h>
 #include "imx8mn.dtsi"
=20
 / {
@@ -60,6 +61,42 @@
 	status =3D "okay";
 };
=20
+&i2c2 {
+	clock-frequency =3D <400000>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c2>;
+	status =3D "okay";
+
+	ptn5110: tcpc@50 {
+		compatible =3D "nxp,ptn5110";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_typec1>;
+		reg =3D <0x50>;
+		interrupt-parent =3D <&gpio2>;
+		interrupts =3D <11 8>;
+		status =3D "okay";
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint =3D <&usb1_drd_sw>;
+			};
+		};
+
+		typec1_con: connector {
+			compatible =3D "usb-c-connector";
+			label =3D "USB-C";
+			power-role =3D "dual";
+			data-role =3D "dual";
+			try-power-role =3D "sink";
+			source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt =3D <15000000>;
+			self-powered;
+		};
+	};
+};
+
 &snvs_pwrkey {
 	status =3D "okay";
 };
@@ -70,6 +107,21 @@
 	status =3D "okay";
 };
=20
+&usbotg1 {
+	dr_mode =3D "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	status =3D "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint =3D <&typec1_dr_sw>;
+		};
+	};
+};
+
 &usdhc2 {
 	assigned-clocks =3D <&clk IMX8MN_CLK_USDHC2>;
 	assigned-clock-rates =3D <200000000>;
@@ -138,12 +190,25 @@
 		>;
 	};
=20
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins =3D <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
 		fsl,pins =3D <
 			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 		>;
 	};
=20
+	pinctrl_typec1: typec1grp {
+		fsl,pins =3D <
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins =3D <
 			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
--=20
2.7.4

