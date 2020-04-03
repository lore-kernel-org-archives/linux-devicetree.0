Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E56C2BA15
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89414208E4
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rNgMXT8U";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="EvVpRUmi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbgDCGMa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:12:30 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:55093 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbgDCGM3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 02:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1585894349; x=1617430349;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SfQ9YesmicZNOeYKGPEZI8U4s+yp/yb+G05QhDU5kH4=;
  b=rNgMXT8UqDZYosvVns0wyx0+kFMsDMIAbfOPCaMtbkQP6lLr2SrYhNnP
   dL14rkrrehuT9RR7pvgGsYy/8xO9HFvWIZFU0uvYVhuZuE180ZzaMlclr
   1pWZYf7BiDLIl1clrwM4as5+FGXdf/ag6Z94IZ7VIDYSSs99NKrHi3EAi
   2SgP32FK36OUUQyDOFBOIpgGLD0sBfnfJrEHym/rRUpZ3AAMSYVT4Usbl
   ydzeIJ6gpWfEimvZn0qDyGoS3UPTkUvgqKeY/MDpnzfoUUGhf8ND0VQ7i
   ltnu7VHtggR99vlkQrqEDqu8+Kah7/Fo5C7/1XJbZa5baIfnwnP/XPiAn
   w==;
IronPort-SDR: 4OLut00bgXT+baw2B8lKSDxqYeSsXxRRDTRjcxoOVUSY2oYmxyZ2YMZilJGIjrRhj0I69alYjc
 lFA/ERfutKpnABRjZBMjTwPIJbz0GTGSKuITsdZbRxaa3WH3SOV77nfd978H7VW7JgtxSE53Jl
 9pXcYfsXIuX/waxZWlJ+62eAoYaCzLApqnVWF+3GVGDPQ/46EcH4P8KDth2wBMYz6HJT66r+g8
 EcCNtskVWk+OsuSklM0GJAf6FxPz51kBqzghxKPzJqSWwrgrbB9ddsWZxJq02R3wqfWmU1tQWP
 Kl8=
X-IronPort-AV: E=Sophos;i="5.72,338,1580799600"; 
   d="scan'208";a="72178030"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2020 23:12:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 2 Apr 2020 23:12:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 2 Apr 2020 23:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjaMOW4T4VSh0PjaqXcCw3gU2QgE2CpP3w+hgwWgSIvRAZdnlVWsmlJ8tKQEfOPjMlpCJHOtZTa9I1yuZ1JzZeuYHr3NeXpO6vJ9DiA+vAg6nY+la5mWQe9T5hxgggeAlPHB1vjDjLTNlf6xULDnYmNXxGLjnoGNkpr9sBDu7we1vJkerdV6RTkoWDJx8pg+/hrHtgWuV93YsUc8IRTC1ZAuEmP9Fyo1cmjBwA0qpUpi0U2+TS69/fr7nT9J6egm1NSBYix8yepTMwEup2J7f+bf/Swwa84tYZzkm7+SwIamo0xUZHC3eE8ZDnk5gZKJGSjADTofCmmBjT9tneRmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ehwDFekAFmVp7g0RGtwsrLczGO4tcsUFy/TNHzdDg=;
 b=U9vW3FU/aFad5SksjhWx87R593/eKfcTSMM3vIhY2ac4VDCO6XPCQAHA7+CzPfyz2Txah7XEJtigsDAZ/WyeVHEGbaK+P7FiiDooa29dacK+QZBrjazFBU7eAZ5TlzlgZ13//mD9niyXHvQECL8JVXMzT3rDSoKZaYg9Mc+d+k3cZRyQOqBsAMmRiKbl8BlUlTEjS3Y5YiL1bpliXFTsmYnng2fx7/Jf9wNFfGK6eeGbqsuQJYFLFzWvgPN4XDNm1C+FPYV/3Jg4j+nKnR6mBEWaCrZqyDLEnkWSjhfLB+jYY+9s7m2uMcogyeczyUMflb4I4A7U9BXdUUSmwFGYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ehwDFekAFmVp7g0RGtwsrLczGO4tcsUFy/TNHzdDg=;
 b=EvVpRUmibQwM8HCNlz0n7xVaQfFHSB+jdxuiC9qRRKBHC6Of5cssUfZgpHdJIanACy81crnEA6yMSneq6ytl1/UDvYz4uVfTHD3af5GLPXAPlbyvdiMF9tW6Uav4jHXbdl89+0jN3dAnc0ErTXSacaMHklVJqwVD0MKKdfQ9ur4=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 06:12:26 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 06:12:26 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <Cyrille.Pitchen@microchip.com>,
        <Tudor.Ambarus@microchip.com>
Subject: [PATCH 3/5] ARM: dts: at91: sama5d2_xplained: Add QSPI0 + SPI NOR
 memory nodes
Thread-Topic: [PATCH 3/5] ARM: dts: at91: sama5d2_xplained: Add QSPI0 + SPI
 NOR memory nodes
Thread-Index: AQHWCX7Y4zwUIV8V60yUq/Xkexo5pg==
Date:   Fri, 3 Apr 2020 06:12:26 +0000
Message-ID: <20200403061222.1277147-3-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 4c20a8b4-778c-4d18-b706-08d7d795fb7b
x-ms-traffictypediagnostic: BY5PR11MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41836D62D997EEC03183A5C3F0C70@BY5PR11MB4183.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(6512007)(6506007)(478600001)(2906002)(6636002)(2616005)(186003)(6486002)(71200400001)(1076003)(26005)(36756003)(316002)(66946007)(8936002)(86362001)(54906003)(110136005)(66556008)(64756008)(66446008)(8676002)(81166006)(81156014)(4326008)(107886003)(5660300002)(91956017)(76116006)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tlzQk8c5gZGOAiCI2bOsNw5wZ0TMS/Ztdb+naxKLQyoTrLogF3xNAkLU0SOBgCo8I/FnGw3NLdhsr9VypEaeaIuqzCsUZNdKb7ewsQOmfU2Y/7V5/zHTXtCBCdnboi4IB6gCCFF0L60vQ/ATMDbRP8p95B16SAJbofWOr0i8ZeYLj3c1DJDGbZHUGURHMYwFqn8UHZiN5J2S0iy6C9S+hU/QET+3Y3UpQ/DfABEfkOVi6MQU0Eiph71s6IVjanduJYBZo6GJdtvSby+l7PMiuwP8oMJOj0FiYd8sG6qbYzx1CwNMSM+f6IFzvZbjYHiYO6AR1kV+21MQZax4Vp7P6RX9IWosyXrM3gSh9rZ1QfGchbybDtrBV95JVv3eTAqjVTbInzrpl4Jj+Tquh/OW8sEQruVo0GWxQTJhvPSJQZkyQUC92RCUWnAa/xk5rqnP
x-ms-exchange-antispam-messagedata: zNfX3eiANRlQD+niqIH/3frgejILM75OsgZcuVJFR37cCf/gYArFadL8/E004djR5K3QhC+f9feXma/9Fzj8+EgAoSXdPyN5JRAOP96BcuMvFyL+X+515OlBZfXP/lehZVXSdKKru8ZzGX0UedHcEA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20a8b4-778c-4d18-b706-08d7d795fb7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 06:12:26.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nxWvCaePNKQUOgZEHyI1o7N/BnyVqe4aP1gsstXLAJAMU9+H2N2J27FSpDQP2HURsGvbVg37YGS3+artDAzNEUa3d3w9AOqZ4MAmemwwZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Cyrille Pitchen <cyrille.pitchen@microchip.com>

This patch enables the QSPI0 controller, configures its pin muxing and
declares a jedec,spi-nor memory.

sama5d2 Xplained RevB and RevC use the Macronix MX25L25673G flash
memory which advertises a maximum frequency of 80MHz for Quad IO
Fast Read. Set the spi-max-frequency to 80MHz knowing that actually
the QSPI drver will set the SPI bus clock to 166MHz / 3 =3D 55.3MHz.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 68 +++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dt=
s/at91-sama5d2_xplained.dts
index 055ee53e4773..e0c6cff1a312 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -72,6 +72,58 @@
 		};
=20
 		apb {
+			qspi0: spi@f0020000 {
+				pinctrl-names =3D "default";
+				pinctrl-0 =3D <&pinctrl_qspi0_default>;
+				status =3D "disabled"; /* conflict with sdmmc1 */
+
+				flash@0 {
+					#address-cells =3D <1>;
+					#size-cells =3D <1>;
+					compatible =3D "jedec,spi-nor";
+					reg =3D <0>;
+					spi-max-frequency =3D <80000000>;
+					spi-tx-bus-width =3D <4>;
+					spi-rx-bus-width =3D <4>;
+					m25p,fast-read;
+
+					at91bootstrap@00000000 {
+						label =3D "at91bootstrap";
+						reg =3D <0x00000000 0x00040000>;
+					};
+
+					bootloader@00040000 {
+						label =3D "bootloader";
+						reg =3D <0x00040000 0x000c0000>;
+					};
+
+					bootloaderenvred@00100000 {
+						label =3D "bootloader env redundant";
+						reg =3D <0x00100000 0x00040000>;
+					};
+
+					bootloaderenv@00140000 {
+						label =3D "bootloader env";
+						reg =3D <0x00140000 0x00040000>;
+					};
+
+					dtb@00180000 {
+						label =3D "device tree";
+						reg =3D <0x00180000 0x00080000>;
+					};
+
+					kernel@00200000 {
+						label =3D "kernel";
+						reg =3D <0x00200000 0x00600000>;
+					};
+
+					misc@00800000 {
+						label =3D "misc";
+						reg =3D <0x00800000 0x00000000>;
+					};
+				};
+			};
+
 			spi0: spi@f8000000 {
 				pinctrl-names =3D "default";
 				pinctrl-0 =3D <&pinctrl_spi0_default>;
@@ -535,6 +587,22 @@
 					bias-disable;
 				};
=20
+				pinctrl_qspi0_default: qspi0_default {
+					sck_cs {
+						pinmux =3D <PIN_PA22__QSPI0_SCK>,
+							 <PIN_PA23__QSPI0_CS>;
+						bias-disable;
+					};
+
+					data {
+						pinmux =3D <PIN_PA24__QSPI0_IO0>,
+							 <PIN_PA25__QSPI0_IO1>,
+							 <PIN_PA26__QSPI0_IO2>,
+							 <PIN_PA27__QSPI0_IO3>;
+						bias-pull-up;
+					};
+				};
+
 				pinctrl_sdmmc0_default: sdmmc0_default {
 					cmd_data {
 						pinmux =3D <PIN_PA1__SDMMC0_CMD>,
--=20
2.23.0
