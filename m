Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22403C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEAA220787
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 06:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eROz3OEJ";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Vs2WYatC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732862AbgDCGM2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 02:12:28 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:43931 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730550AbgDCGM2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 02:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1585894347; x=1617430347;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Nxf9ou59CVrUjihCB/PyPCcOUFYz+n94wClGPJdgy0Q=;
  b=eROz3OEJ+dOGIGou6AJS9pLkZZ5s+YgudQjcJJ9o5dFx7eOzO3Ok8wjv
   Ab3OXq50ZoJyotgqDRaomLORWyIFpjpYk70Bo3+l8VwkEK3bGwj3w77ba
   n+GE7ZTFT9KdflmZ6Xtf5G4Al7+ypEn+15gR60zE2vyJ4T5II8lzRucl0
   uFfM4gR9hzR+83k2Qc/WVKXKAU/JtEdYooqt8u24JV31jxYidnBFYK1KD
   CHv0u5WCbz+WQADFWa9GP61tZ8Z53qyv/+dJ96DM08IyliO2/R9dpqeF5
   Hf/6Xl2T3XEWIJ3UNipwMQj4PIcMBaTD9GbvJIf1NJN5lmtkp4lQlaK8W
   A==;
IronPort-SDR: HOI3pVWNoy8kZjS5jLDkjCbH5c2a4XdI/+h/qlaNckaOPEIRYxxAkyoePyPjvdqtdp8p/hGLPQ
 CG02H2x8aKleBJsbF62RPDtJbgB7fzLfAdJU1uWDMN3+SiOSo40izE6itSMP1oSk/Vp0pXeLOF
 rbsrX/AYCR5zH3wSAIcnBEQEo3sRrUVoTuhkdPEt2VG8qPcpO10kZwuEMgi2swCuRjYrBbiiCg
 Ej3w4fZX1xAAQa+N7o5fcJiXCn/DKmuL67deCC3RA59fQqfxUYYyIUACTczogrBQJJXADbQwXR
 bFg=
X-IronPort-AV: E=Sophos;i="5.72,338,1580799600"; 
   d="scan'208";a="69286922"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Apr 2020 23:12:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 2 Apr 2020 23:12:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 2 Apr 2020 23:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMNiBisvRmF4HrRrypawLPxwiOai8jPbrWSoICKj7WtMQelqE67RsK4tcsZ1CrCU82kCkqT3wA9pF+jFbwkGZaOMAw5bZH6htXSj9Ds4j8j0b+cxxBYyvWRucI/9B8q3pvG8SH4sDXS/c45oY9oWuDFB7IhyB+IoAHWlGAQqdB6K+0LbJ8ezVTL4PdJndzTIqKlyZixvC6iihVtOFG2DBalOv+K+ibTqtgVUzTWjIePYeNjH9o60nCNN9Fm4qyFgriAHyCJ/e9j5M+IJ57Qwt/QhrCmLJt/qgTe7GcI6riJdNlVFlrTTDDBwvWeOXbbnwPU+FrTxjQwcSWCYBohTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWdTC6PymwkyS1Qb5cvOVoxNnkN6b9LG1Mfkg4mvVF4=;
 b=Z23RQ3E274EZj6Dd7Z1ES739Yzj2g2SmeFGZ8GK9fNVrJeC0Y7DiENZagL/ojJwgu/bYlS3VZLQlhOlXChaxE393Ocm2m2NAcqusGx+0/XA+cK1xbewUfZXyzqqxqKDs4+S5HqOjeOcpU3W6Z5jzCJaDAJzPwRA95QB0gSPP1bS63zGDm4qDaIAX7uZDXZcxiBZjZq+ZoTV+6JcxHOGidcn+kiZqu+OfciSF6nE48l5he5/P0XKJjQ4m4PtLnmDEl3xhwswde2ylr5Z8buxr9vtpRToKflI4lFRl9eRXNZKAbM0zfdLWd7G5nE++QN505VLcqaQrPMLQFVuZNulbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWdTC6PymwkyS1Qb5cvOVoxNnkN6b9LG1Mfkg4mvVF4=;
 b=Vs2WYatCEMe0uddSOWl/gMtJGgNBjXmfrOFWSaVzhpoX/rdfkoHUofQUNdlU+KM8rD89X2Vzo1j7NdikILGdnUw1KWafYMeCcUGRpSo7CuOCOnZarbzbEDMyFoaqA0tsg+Ch1lRAEnkF1doMC98Vb94K9bOJnJ+dU66EW42FO3A=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 06:12:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 06:12:24 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH 1/5] ARM: dts: at91: sam9x60ek: Use quad mode in the spi-nor
 flash
Thread-Topic: [PATCH 1/5] ARM: dts: at91: sam9x60ek: Use quad mode in the
 spi-nor flash
Thread-Index: AQHWCX7XRQickBY2QEaJIS548D2E2Q==
Date:   Fri, 3 Apr 2020 06:12:24 +0000
Message-ID: <20200403061222.1277147-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21ecccee-91bd-44b6-e871-08d7d795fa71
x-ms-traffictypediagnostic: BY5PR11MB4183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4183B8B648AD0F1769D56FA8F0C70@BY5PR11MB4183.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39860400002)(396003)(136003)(376002)(346002)(366004)(6512007)(6506007)(478600001)(2906002)(6636002)(2616005)(186003)(6486002)(71200400001)(1076003)(26005)(36756003)(316002)(66946007)(8936002)(4744005)(86362001)(54906003)(110136005)(66556008)(64756008)(66446008)(8676002)(81166006)(81156014)(4326008)(107886003)(5660300002)(91956017)(76116006)(66476007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0buRVzxXZO4yWqjvW0NJCBlZvXoF7pj+Oq5tsZFKmoVvxK1kVR+cU9afXjs55DkC5xBUWMUyZTehboOaIDGqCmHSoevBwJPvv+67WlPPmPC1m/g+T+/CPAEuKBg6eh1w8T7kPajnIlVTHUYWFZ+75/UfREikjzMqro8GIQTNd5g+odZ73JlqhU89qHdIBMQcR83ZJZp/ViPazcQT24tt5MUHksayvsJvLmeVlrSwVrho3Scwi5UlBP1Zllza9bG1n8qfuJNKG3wXwK/X0Yyf382Zq8/0OslF3tLaWM6ZdVhAOUkQh5NT+Muo0NooG4GplZDDvgiFV8mXdAEmIFfIQtHedjHEg+61heTJP9VsorvBP3A/k3+iHjp+H5/yDqKkFgvtGyOtM875pgKDPjlJovr1zYPRT5CBX1q8WdxmJp2ND6+kNnHYKY/KDVXTjsLT
x-ms-exchange-antispam-messagedata: quiwcC2uyRGgMjaeCKEFwWt54h7SGlpvtugNIVNt6l/QLI3kN5WipxgCftaKBDkTE7VlmFu8nCVYSrUmgSuNF/X/AvVLkEwTvALsz8/6WisnENfCPtGrBXdkCy3nQ+lDkB5djb+6I3VK5L/6i4kVDA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ecccee-91bd-44b6-e871-08d7d795fa71
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 06:12:24.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCKXyTxCz2PNsyXeXrbadgpJjgh6EsTg84ZD2BdspXbba/IdnBAtMMZDi2F1OYVP22bgk9wzxGTBdErMLiddwRw6oPu33XiQl+fd3Ab04jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Both the QSPI controller and the sst26vf064b flash support
quad mode, enable it.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-=
sam9x60ek.dts
index b484745bf2d4..8c3f621efc4b 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -579,6 +579,8 @@
 		compatible =3D "jedec,spi-nor";
 		reg =3D <0>;
 		spi-max-frequency =3D <80000000>;
+		spi-tx-bus-width =3D <4>;
+		spi-rx-bus-width =3D <4>;
 		m25p,fast-read;
=20
 		at91bootstrap@0 {
--=20
2.23.0
