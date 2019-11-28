Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE29FC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 11:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92AC221774
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 11:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CaBJEmSB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfK1LLA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 06:11:00 -0500
Received: from mail-eopbgr130044.outbound.protection.outlook.com ([40.107.13.44]:25098
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726734AbfK1LLA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 06:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYlukMgdZpVQZbLGc8U3g/BtrskaXUE0qXfD9ZiQXR5XQbRmMcKt0LeWi0NK0o9hXhI7ObBJ2W/4gmx2OV8KdD5Cx9qQAnu5+g/ftz+vhGzI8pUzTyXnbU5+Vu4Wdt5MJ/+kaC0HW/DebiLJ04TEQsBBUAWkqGgNG7Tv81BnBFXDxAe9QBLJBdcOtgSeT8gEtaon+InuK/+LYgQM9yT1Dvg2Fp+89fQZUqZpHYnm66NL4HUdPIpnUIHtF0gHHuwxYnch6fDJRNr3zfPQLpkr1144ch4PSY1dXJKnrUDS5HduszH5zz4gdakK43ZNXne/QdECPUyYL3RSPvegtorxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwyWQbpI4j0AgndHTNmuMBsjJGjACE1kNxOO3dSVdFs=;
 b=jwSfkQPcHZ6qXFDW0EANuLw2mHXWxY47kiQuuiI+T+6C30pdfdog7v5CRH+tp4EPmjDbJguyDnjjiLqMGXhS5icdRat/HBLgmPTD9do4MKscj5XTHtEYtKikXlE2XL3Btw4dXH143V3t9mHtv0kP/pLtF1v7chRjjyos/MOpVcuASNUN8GcHIcUMc7NyVECbRJHuG6gmlLTjhaP+CqY1Xu16sfvXD1zEcj3PjJVJhxNCCXBy9BTsELNPVyq4yJgn5+HBG71QUww7iXLKwI3fJlFS2ngIEbfXHkbP7gvMduRyGeuqo0cAciDMObXZx78ai0ylqBMjy7vPrNW+BR/FlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwyWQbpI4j0AgndHTNmuMBsjJGjACE1kNxOO3dSVdFs=;
 b=CaBJEmSBqmzxm1lxDvg9/8ysuQ1rDVjfPypgIQQG2F0T+sD6aB1gWcdblm1nrLQYpFwqYO6EuuXoQ2DCOyxmy1A7JzKVLUN/qLNwcEzlQKg4T1xuh/dEbRyXgrq5hCuMuP7cmnVrNKdV54h5x0ZzJu0dlYywhZBe7OoGV/vT/DU=
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (52.134.65.158) by
 DB3PR0402MB3914.eurprd04.prod.outlook.com (52.134.71.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 28 Nov 2019 11:10:51 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::3846:d70b:d3ae:8e8]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::3846:d70b:d3ae:8e8%4]) with mapi id 15.20.2474.023; Thu, 28 Nov 2019
 11:10:51 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH 2/2] arm64: dts: zii-ultra: add sound support
Thread-Topic: [PATCH 2/2] arm64: dts: zii-ultra: add sound support
Thread-Index: AQHVpU+AwS6/kOt5c0enxAaMeVWawaegblwA
Date:   Thu, 28 Nov 2019 11:10:50 +0000
Message-ID: <0909b60cb5943007e1c3db31e3f6c91f289c85f9.camel@nxp.com>
References: <20191127182127.1204-1-l.stach@pengutronix.de>
         <20191127182127.1204-2-l.stach@pengutronix.de>
In-Reply-To: <20191127182127.1204-2-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e80a599-41b3-490e-37e3-08d773f3a0ea
x-ms-traffictypediagnostic: DB3PR0402MB3914:|DB3PR0402MB3914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3914820182052D781B41913FF9470@DB3PR0402MB3914.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(199004)(189003)(76094002)(71200400001)(86362001)(54906003)(316002)(44832011)(110136005)(25786009)(2501003)(118296001)(478600001)(4001150100001)(6246003)(14454004)(8676002)(8936002)(6512007)(4326008)(81166006)(81156014)(50226002)(66946007)(91956017)(76116006)(76176011)(66556008)(66066001)(66476007)(64756008)(66446008)(2906002)(446003)(11346002)(256004)(5660300002)(26005)(7736002)(186003)(102836004)(6116002)(3846002)(2616005)(36756003)(305945005)(6486002)(99286004)(6436002)(229853002)(6506007)(71190400001)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3914;H:DB3PR0402MB3835.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTgkUgNn9sC8pV+LArUxINBWf6mB0bPYB9xeAQe/9//A/t2R8QJzQtlUGhc77LwRJO2jB2VRBn8HJyPD+VdB4C/8O/rKUJHCFDXy9SWYg1ct6To/LVHV8Z1JVt6jWrl2rYMBBF9HIrpA3PSG7UcuyyMhELzrbCP5klrF/VB0rlMXy2C8fG/E611p2qIiasylTu4Js3/g5PUyvPIzj8gQC4q2HsUlExwJjn7OtopXpAF73YaLI+WXzP7nK1WxMFM0x63lup9bxd974oSNGOy2zjBB4Z6lqXNmzSMda0vI2r7CdS7YY8/0HdNgHwQuqU5hi48YOiyY/l+NuJ3gL7/ieq+6I5CXwzeBECwUTbLYfRR5s9oz5g56JHxNwhBNT1dvP8zJL8L9Q8QEJrhAnL82xFnv2r0nob2tvnDRy1+J5tbYDCrBMxqMbzPxyWjrsdMm
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CD36DEA4EAC6A4D8C54F58632A3512E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e80a599-41b3-490e-37e3-08d773f3a0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 11:10:50.9446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1Hy85IZ6l8sNrsFKYeconG+sFjAKcsZymMTJbXnNjbgMkSVxFyG9dZ6GID8Yf/0sVZatFoBhMqN1ZSTyNs7xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3914
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

RmV3IGNvbW1lbnRzIGlubGluZSBhYm91dCB0aGUgbmFtaW5nOg0KDQpPbiBXZWQsIDIwMTktMTEt
MjcgYXQgMTk6MjEgKzAxMDAsIEx1Y2FzIFN0YWNoIHdyb3RlOg0KPiBUaGlzIGFkZHMgYWxsIHRo
ZSBuZWNlc3NhcnkgZGV2aWNlIG5vZGVzIHRvIGdldCBhdWRpbyBzdXBwb3J0IG9uIGJvdGgNCj4g
dGhlDQo+IFJNQjMgYW5kIFplc3QgYm9hcmRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMg
U3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgLi4uL2R0cy9mcmVlc2Nh
bGUvaW14OG1xLXppaS11bHRyYS1ybWIzLmR0cyAgIHwgODcgKysrKysrKysrKysrKysrKw0KPiAg
Li4uL2R0cy9mcmVlc2NhbGUvaW14OG1xLXppaS11bHRyYS16ZXN0LmR0cyAgIHwgMzAgKysrKysr
DQo+ICAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS16aWktdWx0cmEuZHRzaSAgfCA5OA0K
PiArKysrKysrKysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIxNSBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1xLXppaS11bHRyYS1ybWIzLmR0cw0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhtcS16aWktdWx0cmEtcm1iMy5kdHMNCj4gaW5kZXggNmIzNTgxMzY2ZDY3Li5kNWUwNjg4
NWM2ODMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
cS16aWktdWx0cmEtcm1iMy5kdHMNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OG1xLXppaS11bHRyYS1ybWIzLmR0cw0KPiBAQCAtMTAsNiArMTAsNTYgQEANCj4gIC8g
ew0KPiAgCW1vZGVsID0gIlpJSSBVbHRyYSBSTUIzIEJvYXJkIjsNCj4gIAljb21wYXRpYmxlID0g
InppaSxpbXg4bXEtdWx0cmEtcm1iMyIsICJ6aWksaW14OG1xLXVsdHJhIiwNCj4gImZzbCxpbXg4
bXEiOw0KPiArDQo+ICsJc291bmQxIHsNCg0KSSBmaW5kIHNvdW5kMSAvIHNvdW5kMiBwcmV0dHkg
Z2VuZXJpYy4gUGVyaGFwcyB3ZSBjYW4gZ28gd2l0aCBzb21ldGhpbmcNCmxpa2Ugc291bmQtPGNv
ZGVjX25hbWU+DQoNCg0KPiArCQljb21wYXRpYmxlID0gInNpbXBsZS1hdWRpby1jYXJkIjsNCj4g
KwkJc2ltcGxlLWF1ZGlvLWNhcmQsbmFtZSA9ICJSTUIzIGF1ZGlvIGZyb250IjsNCj4gKwkJc2lt
cGxlLWF1ZGlvLWNhcmQsZm9ybWF0ID0gImkycyI7DQo+ICsJCXNpbXBsZS1hdWRpby1jYXJkLGJp
dGNsb2NrLW1hc3RlciA9IDwmc291bmQxX2NvZGVjPjsNCj4gKwkJc2ltcGxlLWF1ZGlvLWNhcmQs
ZnJhbWUtbWFzdGVyID0gPCZzb3VuZDFfY29kZWM+Ow0KPiArCQlzaW1wbGUtYXVkaW8tY2FyZCx3
aWRnZXRzID0NCj4gKwkJCSJIZWFkcGhvbmUiLCAiSGVhZHBob25lIEphY2sgRnJvbnQiOw0KPiAr
CQlzaW1wbGUtYXVkaW8tY2FyZCxyb3V0aW5nID0NCj4gKwkJCSJIZWFkcGhvbmUgSmFjayBGcm9u
dCIsICJIUEExIEhQTEVGVCIsDQo+ICsJCQkiSGVhZHBob25lIEphY2sgRnJvbnQiLCAiSFBBMSBI
UFJJR0hUIiwNCj4gKwkJCSJIUEExIExFRlRJTiIsICJIUEwiLA0KPiArCQkJIkhQQTEgUklHSFRJ
TiIsICJIUFIiOw0KPiArCQlzaW1wbGUtYXVkaW8tY2FyZCxhdXgtZGV2cyA9IDwmaHBhMT47DQo+
ICsNCj4gKwkJc291bmQxX2NwdTogc2ltcGxlLWF1ZGlvLWNhcmQsY3B1IHsNCj4gKwkJCXNvdW5k
LWRhaSA9IDwmc2FpMj47DQo+ICsJCX07DQo+ICsNCj4gKwkJc291bmQxX2NvZGVjOiBzaW1wbGUt
YXVkaW8tY2FyZCxjb2RlYyB7DQo+ICsJCQlzb3VuZC1kYWkgPSA8JmNvZGVjMT47DQoNCkNvZGVj
MSBoZXJlIGlzIHRvbyBnZW5lcmljLiBQZXJwYWhzIHdlIGNhbiBhZGQgcmVhbCBjb2RlIG5hbWUu
DQoNCj4gKwkJCWNsb2NrcyA9IDwmY3MyMDAwPjsNCj4gKwkJfTsNCj4gKwl9Ow0KPiArDQo+ICsJ
c291bmQyIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYXVkaW8tY2FyZCI7DQo+ICsJCXNp
bXBsZS1hdWRpby1jYXJkLG5hbWUgPSAiUk1CMyBhdWRpbyBiYWNrIjsNCj4gKwkJc2ltcGxlLWF1
ZGlvLWNhcmQsZm9ybWF0ID0gImkycyI7DQo+ICsJCXNpbXBsZS1hdWRpby1jYXJkLGJpdGNsb2Nr
LW1hc3RlciA9IDwmc291bmQyX2NvZGVjPjsNCj4gKwkJc2ltcGxlLWF1ZGlvLWNhcmQsZnJhbWUt
bWFzdGVyID0gPCZzb3VuZDJfY29kZWM+Ow0KPiArCQlzaW1wbGUtYXVkaW8tY2FyZCx3aWRnZXRz
ID0NCj4gKwkJCSJIZWFkcGhvbmUiLCAiSGVhZHBob25lIEphY2sgQmFjayI7DQo+ICsJCXNpbXBs
ZS1hdWRpby1jYXJkLHJvdXRpbmcgPQ0KPiArCQkJIkhlYWRwaG9uZSBKYWNrIEJhY2siLCAiSFBB
MiBIUExFRlQiLA0KPiArCQkJIkhlYWRwaG9uZSBKYWNrIEJhY2siLCAiSFBBMiBIUFJJR0hUIiwN
Cj4gKwkJCSJIUEEyIExFRlRJTiIsICJIUEwiLA0KPiArCQkJIkhQQTIgUklHSFRJTiIsICJIUFIi
Ow0KPiArCQlzaW1wbGUtYXVkaW8tY2FyZCxhdXgtZGV2cyA9IDwmaHBhMj47DQo+ICsNCj4gKwkJ
c291bmQyX2NwdTogc2ltcGxlLWF1ZGlvLWNhcmQsY3B1IHsNCj4gKwkJCXNvdW5kLWRhaSA9IDwm
c2FpMz47DQo+ICsJCX07DQo+ICsNCj4gKwkJc291bmQyX2NvZGVjOiBzaW1wbGUtYXVkaW8tY2Fy
ZCxjb2RlYyB7DQo+ICsJCQlzb3VuZC1kYWkgPSA8JmNvZGVjMj47DQpEaXR0by4NCg0KPiArCQkJ
Y2xvY2tzID0gPCZjczIwMDA+Ow0KPiArCQl9Ow0KPiArCX07DQo+ICB9Ow0KPiAgDQo+ICAmZWNz
cGkxIHsNCj4gQEAgLTI3LDYgKzc3LDIzIEBADQo+ICAJfTsNCj4gIH07DQo+ICANCj4gKyZpMmMx
IHsNCj4gKwljb2RlYzI6IGNvZGVjQDE4IHsNCg0KSGVyZSB3ZSBtaWdodCBnbyB3aXRoIHNvbWV0
aGluZyBsaWtlOiANCg0KdGx2MzIwZGFjMzEwMDogY29kZWNAMTgNCg0KDQo+ICsJCWNvbXBhdGli
bGUgPSAidGksdGx2MzIwZGFjMzEwMCI7DQo+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+ICsJCXBpbmN0cmwtMCA9IDwmcGluY3RybF9jb2RlYzI+Ow0KPiArCQlyZWcgPSA8MHgxOD47
DQo+ICsJCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQo+ICsJCUhQVkRELXN1cHBseSA9IDwmcmVn
XzNwM3Y+Ow0KPiArCQlTUFJWREQtc3VwcGx5ID0gPCZyZWdfM3Azdj47DQo+ICsJCVNQTFZERC1z
dXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4gKwkJQVZERC1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4g
KwkJSU9WREQtc3VwcGx5ID0gPCZyZWdfM3Azdj47DQo+ICsJCURWREQtc3VwcGx5ID0gPCZ2Z2Vu
NF9yZWc+Ow0KPiArCQlncGlvLXJlc2V0ID0gPCZncGlvMyA0IEdQSU9fQUNUSVZFX0hJR0g+Ow0K
PiArCX07DQo+ICt9Ow0KPiANCg0KVGhpcyBpcyBqdXN0IGEgdGhvdWdodCwgbmFtaW5nIGlzIGhh
cmQuIEJ1dCBpdCBzaG91bGQgaGVscCB3aXRoDQpyZWFkYWJpbGl0eS4NCg0KDQo=
