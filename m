Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D682DC2BA19
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 14:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADAFD206DA
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 14:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YxvMsK8Q";
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="T2ZbURgC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgDMOJb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 10:09:31 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:23954 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgDMOJa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Apr 2020 10:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586786968; x=1618322968;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=JnXSZ379qRkkfEv87vw5+JmNSNxkHGW1u7TU/vPKT00=;
  b=YxvMsK8QiNPkZBSe5BbHhrUuDS7zvatLC4ovfrRXAoO8XYmajlK5g71h
   jevQeL6GFAzvfQiCbltreh5CZz2E5GA9PXZA2vd1qjzdniaoqIA+Y15XJ
   WuCqRbIDPK7Xv5OHTsOh7o2rMf40F7IjuYEQYNMTWdzBga/mkcB9fBUSi
   hvnyyaJWWXZFulxdifIjxUlHHZ5pOJW1yK8uqGFSMnFGmny+TP7jI9Cvw
   fGqiYjMiBVXdUieETGm052AkpG5LBsxLezNm1kXW5g4zE2mB8r2/F2S/v
   f8+wjsgAX+zFkAnAhoIEIEXzWzdzkrLgGpEdlHda57oLRRfzA6ZWcEFZa
   w==;
IronPort-SDR: 5UPko/UFTbXU/P3441GfgJHvwVtYh6A+hThTAB+n4VxGiDtZhHLY4CTMJpu3Oba5DyEg2VKFlZ
 ckFhEtnZkA1HvB1gF8szyZ9t47OTqaKJg7N28pumiW4oP54Non58iPEH+mP6hJ029DHX79XQis
 aXc7ER5iJ//gNVmg/0p+kaaZv8DU4/qJOtRcvg+6nt62vVgbOx+FYzYRVBBZvxhr1OHzsZtgrX
 X8jbx1Xjfy7cO5TgLDBN6AqxqMLb2OFrrSVYRXtxVvkYMjOcsRUaBm6rJEmdVwXio1rodgNYzX
 N9s=
X-IronPort-AV: E=Sophos;i="5.72,378,1580799600"; 
   d="scan'208";a="70150515"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2020 07:09:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Apr 2020 07:09:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Apr 2020 07:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPd75aWcU3kOuxRnBP87QYfAxgzHxHDMnSnnmuvH09qz7fLt0KOEGroPAXRSy5mZPv9Imj0CzrfrnRHRvjpvLYwLvFBwoy5hTTBGzkhiUgcq3InZuQgcl1MCYAJdypS2nSdyr1arAlf9T6QDsJZmkit3xerJXUOu3yKzUnpDLXHqxH3PNSWTNAPxLnUDmyteHLvs53uDlAHQcSLNQY7HREiMLI5mN90/dl5XxWr8zFwfrEp3XY5eSloyFMwZ9yJ4QKXkdmMnCgybeUKEpTW+H9lYJc7ELx/sxd/6gAZx7g/ZnIUULcADv7QAt/HeSr9zkDNUCl6IdF+MMx5CrjZiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtzS1hxVqt++OLXjX2IYHlYrx39ZzfFXS29eRWbmRa4=;
 b=AIpQ70wyNYFXu4rsv/Wu0rPWuKXmmIaykKC1e70S0Bh1/KBcN5XpUK48xzipmyZEkds4GQmslWhCs1rwKRLAeWCoJJ6k2e0gC9eiDVKm8bWeLWNOV8pydmrtZmpcNhup0wfzhCC9Ii+UfAO+3pss9v0JlsgsUlsCliLk4lRacBFyW6os69XArOoMmMRMOOa9Yg7S5ocBpP9UFUa/utSYK73mLUMOWgPzZhz8NNTeitvaC9gc2TLSHMUxIPV9aCtuUGckGs0rFYTuySv/SbHkzwQp9VeO8WqXKUN4wdwpXJMApcpEQ5dvmVnjysdmgyCEW1qYc1Es+LY5TBWUO5XP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtzS1hxVqt++OLXjX2IYHlYrx39ZzfFXS29eRWbmRa4=;
 b=T2ZbURgCSWW/QLh+AVAqexQFiBvP+A211g5NzODlvkJ0+8qAUug9TVnl0KAxCETXZaCwkwwG1hrTCPG73m787NdEXfpcCvyK/7WDA8x4jIf2E5I9qijX8r/G2/4bX67jKCebIQd7+cPQWRWm15S8EozRRePU/wI9QhLB5sNd/+k=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 14:09:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 14:09:25 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>
CC:     <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <Tudor.Ambarus@microchip.com>
Subject: [PATCH] ARM: dts: at91: sama5d27_wlsom1: Add alias for i2c0
Thread-Topic: [PATCH] ARM: dts: at91: sama5d27_wlsom1: Add alias for i2c0
Thread-Index: AQHWEZ0jFkAKqwF//E++5sIL47bPHA==
Date:   Mon, 13 Apr 2020 14:09:25 +0000
Message-ID: <20200413140922.154886-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef1cba8a-baf9-49f1-d389-08d7dfb445ed
x-ms-traffictypediagnostic: BY5PR11MB4500:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB450045F30E2CABA9FEBC4BFEF0DD0@BY5PR11MB4500.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(136003)(396003)(39860400002)(376002)(346002)(8936002)(86362001)(478600001)(2616005)(8676002)(81156014)(6486002)(186003)(2906002)(71200400001)(26005)(6636002)(54906003)(64756008)(107886003)(6512007)(5660300002)(66446008)(66556008)(66476007)(91956017)(6506007)(1076003)(316002)(76116006)(4744005)(4326008)(36756003)(110136005)(66946007)(138113003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQZq0w92Xv5qV0MFW+AKGkQoznlDa3kY6tf0r1FFz3nWREXKJxx2XyY/GRp4eKM87Wv8MHSeUVFRr1IgCT6b3SFxPgr56hVDxR0QVnVotVDtRbtwOeGtX4MYcBjqm80KNUTdJgxWrz91EBvZDeh2IB4Kfp1mfwie43w27AqidIaa65aMNx0nFC4xHSIEY+dco0YW2EHVwfop+2NxFxMKnvo+gdTKwX8bUmDclbZd95Eak9UvR8I+a7yoieZWAnFIbjAHFTomoRjbSn9dWR4G9mpU+tdPi9ZWxL3g58OlaZKNNyVSbfJJcNHZ8JyoJlJlHIsxjnaTfQmKUt5eYpsOZzCDKbMwHEE97dg1JOKFZPGpUOnxBoQh33EvwZ18reNRJeVhcFYy4Hk8+aftzOMi7gi6Vdj67MrPpaFOiBdlqW4HpJm5R1q8o2lge+ifIWIsOl0VnaTkYjDDwgHKFf78zYK6KP68anHrFb0mu1cblGY2qYXjq31PC9NvD9OKraoc
x-ms-exchange-antispam-messagedata: Df7gYqBh9zPmjegLBTaO+dEii8cFYKLP3rVIwsqkRfvO8sQn8WiW7e3x3uVCJMzJAtP1Rs5CKJYJTf9QOZUfa6rNeyHBHnIPp4mKB/kyOL0sF9cVYDhj/RLwoST0mcSmNeyrXSau7Xc6WA9IyutUXA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1cba8a-baf9-49f1-d389-08d7dfb445ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 14:09:25.4497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUSAweF2EcEN4eZNK5yojLumsSljo1z79u27LpJADe33Y6fmOnAV2H/UWnyXhi8GHSDkAuxakagyZBron9yogA8wlOzitCcN4dEn1K2O880=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4500
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

wlsom1 has an ATECC608A-TNGTLS Secure Element connected on the i2c0
bus. Add alias for the i2c device to not rely on probe order for the
i2c device numbering.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dt=
s/at91-sama5d27_wlsom1.dtsi
index db3e2239eee8..bea3d60b9722 100644
--- a/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi
@@ -17,6 +17,10 @@
 	model =3D "Microchip SAMA5D27 WLSOM1";
 	compatible =3D "microchip,sama5d27-wlsom1", "atmel,sama5d27", "atmel,sama=
5d2", "atmel,sama5";
=20
+	aliases {
+		i2c0 =3D &i2c0;
+	};
+
 	clocks {
 		slow_xtal {
 			clock-frequency =3D <32768>;
--=20
2.23.0
