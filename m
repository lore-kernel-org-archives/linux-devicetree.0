Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F97C2D0E8
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8300020737
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="P62NBRtl";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="W6LOYfit"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbgDCGM3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:12:29 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:63890 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbgDCGM2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 02:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1585894347; x=1617430347;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Emo7d3R+B23zlGMnmJ2rQj1NNS1k6VBlsbRb2My/sVg=;
  b=P62NBRtlm53s8Kor4IbRvFhGbBFtMrr7FH5rM30Az8WgrTb5VysBCzNw
   9LqtK2KmGu+HzmO20dQ+HChu3N8AVFqjSE9Zm99GDM6FGekkyns0iCuwM
   813QIh45gQGi41NaRGa+aBYr1upYnY5jR30Q8IjcjiqIkaalFqXFFK9dK
   ybymxXNk7OiKDaxmKfHsiSpUBTkoX1WCGRfbvenLsfOL7iRLqOQlrGW2s
   LJ+uNM8LsvPrY9OIDyJuWccSB3R65CrkhptgaxjkiHnsvdGZaCUGuEd2n
   3fOS9v533hOU7qH8GYG9JG6CyTELaGJaioPlxBHuo5qczgKrqg3ACv2Wx
   Q==;
IronPort-SDR: Ush4M6ZyxWi66O65gViPaVpRjWKSc5Cr66FkXnWZOm8F4Lzuoo/+gcAp72o1juk7NY2QxeRHm2
 iP5CmKsykUHxLtFVyrzy8rwe4V0b1lKUfFAfkVTuAiujYlJLIBylCOmnjbd8q+yX0pATV7O8FM
 nbM+M3QLA29ik2g3AG+RAvEScChoIm+z4psXj37aFrDQAniv5SrVDjqyx9DVe8Fbwv3dL9QKET
 6lFccoXRvEdBuq8yy5b+C83jSpsEt1uhFIDdvcrMgbvlGpl7lY3VDvQIIIasmT55wEppDVLFmS
 7kU=
X-IronPort-AV: E=Sophos;i="5.72,338,1580799600"; 
   d="scan'208";a="7987663"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2020 23:12:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 2 Apr 2020 23:12:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 2 Apr 2020 23:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aelqPAGBlIP81p/YypccWaDN6fYsc1KbDoq0SQJLez+3eMnhN1xjovOUf5bMYKlqwNtCm+pMyo4z7ekrAbpFjynoOMgCUJQsY8yPpnFgCh6psYrTN4m9M5qvZqUbM2PzB4cp6583QbiLlB1vUqyKIbVjeGvcy/DQ03lu8KtVFr01XBX0+V3RFChFXDZCtU/AsTfAsNIB1IhZVHaLgihMxw8JsGiwVIOp+OMbwEjKPFsHLz2RPzD1InRWxHTCQ1WOtL+dsG6AkWIBfbFmdu1As0iqC5+eFIrpY0n9IyqYcK39Y9TR42Xkoh+vGbCqJqQqKLAEuLNypQ/rxBE3atmdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N/nWCZ/diO5VV8ulMbFXrfdrQR6tqIC0S7lnKimPUY=;
 b=Foog/yNLqBT93mXHxWgPdbJm4hl/GQhrawXq47LnixzZxmfN8VFUgYdCj5Imoe7fxEsvZZ6noPN7+bH5G2Me6o6G2+KE1Vc2wUcsP2F/AOabNkA2YFBcSyQxS3D08ccZwEF7qPA/0rlFU7fU/GP6l7WlJilPTfps/o10UB+3EeI3K143/BukMKNLotSsYqWJPlsjhjkGBuLbu5U/Tdj6+Moeoe/E9VFjmksjcer2QHhlW4ob8wYJb14wjvCMYKTuwn8lddy85KUK+6ie6AoS8EXy4OzUJOfqMyr+0uCoOvWv3iIsIWDn/rhM99/hZCHA8isHPu1rgICx7geWolua5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N/nWCZ/diO5VV8ulMbFXrfdrQR6tqIC0S7lnKimPUY=;
 b=W6LOYfitTJ94QRPv1F6EHdeS4+IwnnqSOUWrY9Ac4roLQgoqB2QE2z/fEuvKQxp5snf57QeX23K+361JImkkqXVukkaL9/NKWDvAkn2u9h2eV9GTG9TJteOkebQk7fYeMCvmS/n1P4qTgJcQsfxWeCErG2jc3cyDZpXednR7Irw=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 06:12:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 06:12:25 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <Claudiu.Beznea@microchip.com>,
        <Tudor.Ambarus@microchip.com>
Subject: [PATCH 2/5] ARM: dts: at91: sama5d27_som1: Add SPI NOR flash mapping
Thread-Topic: [PATCH 2/5] ARM: dts: at91: sama5d27_som1: Add SPI NOR flash
 mapping
Thread-Index: AQHWCX7YjlRGoQ8Ew0moTICne6FpUg==
Date:   Fri, 3 Apr 2020 06:12:25 +0000
Message-ID: <20200403061222.1277147-2-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 285f12c6-4457-48a9-e715-08d7d795fafd
x-ms-traffictypediagnostic: BY5PR11MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB418353D74D3D1CF4EC1F3BFBF0C70@BY5PR11MB4183.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(6512007)(6506007)(478600001)(2906002)(6636002)(2616005)(186003)(6486002)(71200400001)(1076003)(26005)(36756003)(316002)(66946007)(8936002)(86362001)(54906003)(110136005)(66556008)(64756008)(66446008)(8676002)(81166006)(81156014)(4326008)(107886003)(5660300002)(91956017)(76116006)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjWVzsEl8WsouGGMcVUMQ2n1z15wLqLbMGW/FUejieiNdkJ6DeW0wdHqLVx5xRpUtxLuOcR+PowpaqA5hYHO4ZSMOBV2qedqLg0xJI0dQetpR6nTQ6rjM6LheTCfkd7N3xM6ufteEugnrVLFYfxjQIbyXr2icQi3fwnW2JoKnOGXntFZM+bOXU6RkWbRFIArEMuSQ9XOCxEPXOdowIzRzTgcWAehiTFyuLTv87Ih15ScODHnRBZtBqJwEu8KCjWeUnwweIt0CxS5xoXYFEqxFQfQpVxP/wckK8KCs0Wg9SLTlDXvURrohj+2aG6rNQH5ItcPZHC76QPCydwfKd5Exb2GC61wWKjVlYri3M/HWYOCOlAb08Kla9ycdZUTdkoa3VUvU+ASa4KkOzxoWPvVmCBZ1YuRrZX/rQ5ZLsamIODVk0MSpCgp66yh8x6SbJ9W
x-ms-exchange-antispam-messagedata: Kq+R7hROOaOtRKeLCKFhojRuQnzEZstMT0gQRr04BNORugekrzU07oUJ69yLbaPF/8WLuSX5t2JH6esMOCSG761m7BJNRHtBIQgw/G80pvjiZPIhjKRf2tENumKMGMDYri3pnGQU1e4nkuuWBegv/Q==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 285f12c6-4457-48a9-e715-08d7d795fafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 06:12:25.2280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zfRKP6UAn2s5nlZrNYzoUIWpqkd3Ld0+T4jzaJj1uYJsF9yrdn1Vp8yMhSzwt3wMBtzu53PQoBj+OA5seXZoo1n5UQtBZiFGyXRtNdK98A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add SoM1 flash mapping, identical with the other SPI NOR flash
mappings found on the other at91 boards.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/=
at91-sama5d27_som1.dtsi
index 6281590150c8..919000f467e6 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/at91-sama5d27_som1.dtsi
@@ -34,12 +34,44 @@
 				pinctrl-0 =3D <&pinctrl_qspi1_default>;
=20
 				flash@0 {
+					#address-cells =3D <1>;
+					#size-cells =3D <1>;
 					compatible =3D "jedec,spi-nor";
 					reg =3D <0>;
 					spi-max-frequency =3D <80000000>;
 					spi-tx-bus-width =3D <4>;
 					spi-rx-bus-width =3D <4>;
 					m25p,fast-read;
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
 				};
 			};
=20
--=20
2.23.0
