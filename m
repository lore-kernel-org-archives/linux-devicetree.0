Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F141C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 472F12082D
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 12:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UN7ARo85"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgC0Mmb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:42:31 -0400
Received: from mail-eopbgr130053.outbound.protection.outlook.com ([40.107.13.53]:8672
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727125AbgC0Mma (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 08:42:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuVAWgyaWr3RZO9mKbO//nzHmwYllK0h+QMsDzsSsEegkMje61tXBscM6py/KCGJh54f6Nx6kbF68JaAGrbWEcUJCC+iOU+x+GuYq/Rf21B1lMSRG/3AAiJjc3QMJjIDEgTNlRqf7zCbEuwEgJflh1Jv9BniEnKzEdz/0HhTL/cpL5GMD2CIkBqCb5fKY8KkRhoyYa2D6xTA3/RAmZTiQAWuVgto37UAiFBvtIUvqir7uLK7CcXq7xpsP5B05qklXDhbuwmlEVzFMbznHAOXFMFJCouHfN4LP2ZvT8dvBY88KsJlvxRay2QXX7LVgl8uacpat45nAcJrFok0H6n+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAnzobjsmNeRj0OyBzYbwQTCOVWXUzOO97iBTsqzQng=;
 b=Lo4H3A8eT39K8Q97la0AEdZ9PFzRoJsROAxuofJQbjBYwOey4hvaN6n4ImwRbxL4nifgLYleqvEzeL0eGi5t5AkYByGe2SlF1YhaFs1sJuS9W01huCyOEMkZzdVeYZofbi1BVFerJLOZvKlH2H5AQQTRgIBs/Y3RQWiKI2g/0Z36r3ZKPGCztJppNy5sXWhq09Iv9gruxCyt05d5B+8D4S9y9xqZYlMkcPY76vcO5xPFMWc2jHMgyFDnjvPuVlmlrJDpbC8jvAGi7D/TBO9pn/TrA/RIIxwwFmMsk6AN6fSJSKeiILPUQL6kUNRFL2Ns0MHaeH3wz79eKKq0RKI9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAnzobjsmNeRj0OyBzYbwQTCOVWXUzOO97iBTsqzQng=;
 b=UN7ARo85RvKCyonjvSSa5UHDpvSLYoxoYJjTNhPytcMhOUrZ8KzKu+oLO3k2jpG2BNXkooMLe/YYEFoSrQO12qUOW53KWApbhluX2C4QAkq89p5XiSxlzwbvWErLzSGRMU9Zf7zStX9E4hLGrIYuo0D6onRcia/tWeHENRnfy1s=
Received: from AM0PR04MB6980.eurprd04.prod.outlook.com (52.132.212.87) by
 AM0PR04MB6401.eurprd04.prod.outlook.com (20.179.254.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Fri, 27 Mar 2020 12:42:26 +0000
Received: from AM0PR04MB6980.eurprd04.prod.outlook.com
 ([fe80::182f:6b6f:c5de:a768]) by AM0PR04MB6980.eurprd04.prod.outlook.com
 ([fe80::182f:6b6f:c5de:a768%7]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 12:42:26 +0000
From:   "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>
CC:     "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface
 types
Thread-Topic: [PATCH] arm64: dts: update SolidRun Armada 8040 phy interface
 types
Thread-Index: AQHWBDTyUzEK8LImG02YfxFpCaWEmqhcYb9A
Date:   Fri, 27 Mar 2020 12:42:26 +0000
Message-ID: <AM0PR04MB6980057E53639ACFA656F498ECCC0@AM0PR04MB6980.eurprd04.prod.outlook.com>
References: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1jHoHy-0002Ep-IY@rmk-PC.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=madalin.bucur@oss.nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [79.115.171.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f8aa931-b3d5-4868-b67b-08d7d24c4e27
x-ms-traffictypediagnostic: AM0PR04MB6401:|AM0PR04MB6401:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6401F6A9EC3C1D289DAE48D4ADCC0@AM0PR04MB6401.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6980.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(53546011)(76116006)(66946007)(478600001)(316002)(15650500001)(71200400001)(33656002)(8936002)(6506007)(7696005)(81166006)(81156014)(8676002)(5660300002)(66476007)(52536014)(186003)(26005)(64756008)(66556008)(2906002)(86362001)(54906003)(110136005)(4326008)(9686003)(66446008)(55016002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +57ud0brKkrOpCejptbGK9QjXvB5nUtppO5gNyAenyfeJxMT8Wn+iWpBvqizbdu2eBUx+UXFoXAIlIOdE85347b1CWCUXifZ2s6zM1bozkHQLOJZiQPKoPyZ/kpCzq5+V8Q4Q9dgRlrwiNXo7ZEh5JqLGWJQINtfdsKq1cmVKrrZKZbRso4ym5J2Z0eALZe37NuAxblP3zTtPQWP+RAK0Qg0vLrw4eiljViznyF/fIWLV64MPzj2yprabWTB6C4P5qBiHDP9X949tcxR9RI7ppADM2xuIV2ZCY7lk6WMBd70+jdOVE2sUcXEESOvc4o+ahBIcljwoFGIYwmN86e6191qdOzFFJ91SJTNtnHrXRXUPULYGfY1q2/6NUOQxPmkuwLMGwGPrmLcCUb9hZTdDIgutwU7s0GlIBTXV8TPTiweslHNnlpW9XERuduYkQML
x-ms-exchange-antispam-messagedata: z5tNcDdKvp4TS+0oauMgnLpqbLC8L1+wARTuRNkTrqIrjKgvk8Dm4SqX/Jxb2zehXhwKeTKhr6Fk7dAEJztyMkZoTgBqD5UuFrfhYSgDnrEA2lsUbW5SHqWYMwkmUSUctgj1kidh+gr4tC4GDZJYZg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8aa931-b3d5-4868-b67b-08d7d24c4e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 12:42:26.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFowLfCHidV4OA8ZFiFmlkrPN2P0KrFDKuZ7ji7HyhwQLYvDjKdQ817XsqiE+VbtH5A0whhR+LRlhe/k8ShULw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6401
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSdXNzZWxsIEtpbmcsLCwgPHJt
a0Bhcm1saW51eC5vcmcudWs+IE9uIEJlaGFsZiBPZiBSdXNzZWxsIEtpbmcNCj4gU2VudDogRnJp
ZGF5LCBNYXJjaCAyNywgMjAyMCAyOjQxIFBNDQo+IFRvOiBHcmVnb3J5IENsZW1lbnQgPGdyZWdv
cnkuY2xlbWVudEBib290bGluLmNvbT4NCj4gQ2M6IE1hZGFsaW4gQnVjdXIgKE9TUykgPG1hZGFs
aW4uYnVjdXJAb3NzLm54cC5jb20+OyBKYXNvbiBDb29wZXINCj4gPGphc29uQGxha2VkYWVtb24u
bmV0PjsgQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPjsgU2ViYXN0aWFuDQo+IEhlc3NlbGJh
cnRoIDxzZWJhc3RpYW4uaGVzc2VsYmFydGhAZ21haWwuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJv
YmgrZHRAa2VybmVsLm9yZz47IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+OyBs
aW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hdIGFybTY0OiBkdHM6IHVwZGF0ZSBTb2xpZFJ1
biBBcm1hZGEgODA0MCBwaHkgaW50ZXJmYWNlDQo+IHR5cGVzDQo+IA0KPiBVcGRhdGUgdGhlIFNv
bGlkUnVuIEFybWFkYSA4MDQwIHBsYXRmb3JtcyBwaHkgaW50ZXJmYWNlIHR5cGVzIGZyb20gdGhl
DQo+IG9sZCAxMGdiYXNlLWtyIHRvIHRoZSBuZXdlciBhbmQgbW9yZSBjb3JyZWN0IDEwZ2Jhc2Ut
ci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51
eC5vcmcudWs+DQoNClJldmlld2VkLWJ5OiBNYWRhbGluIEJ1Y3VyIDxtYWRhbGluLmJ1Y3VyQG9z
cy5ueHAuY29tPg0KDQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFk
YS04MDQwLWNsZWFyZm9nLWd0LThrLmR0cyAgIHwgMiArLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0
cy9tYXJ2ZWxsL2FybWFkYS04MDQwLW1jYmluLXNpbmdsZXNob3QuZHRzIHwgNCArKy0tDQo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTgwNDAtbWNiaW4uZHRzICAgICAgICAg
ICAgfCA0ICsrLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9h
cm1hZGEtODA0MC1jbGVhcmZvZy1ndC04ay5kdHMNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21h
cnZlbGwvYXJtYWRhLTgwNDAtY2xlYXJmb2ctZ3QtOGsuZHRzDQo+IGluZGV4IDFlN2I0N2FmZmUy
Ni4uMDA2NjY2MjcyNDg5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZl
bGwvYXJtYWRhLTgwNDAtY2xlYXJmb2ctZ3QtOGsuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1jbGVhcmZvZy1ndC04ay5kdHMNCj4gQEAgLTQwMSw3
ICs0MDEsNyBAQA0KPiAgLyogU0ZQICovDQo+ICAmY3AwX2V0aDAgew0KPiAgCXN0YXR1cyA9ICJv
a2F5IjsNCj4gLQlwaHktbW9kZSA9ICIxMGdiYXNlLWtyIjsNCj4gKwlwaHktbW9kZSA9ICIxMGdi
YXNlLXIiOw0KPiAgCW1hbmFnZWQgPSAiaW4tYmFuZC1zdGF0dXMiOw0KPiAgCXBoeXMgPSA8JmNw
MF9jb21waHkyIDA+Ow0KPiAgCXNmcCA9IDwmc2ZwX2NwMF9ldGgwPjsNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1tY2Jpbi1zaW5nbGVzaG90
LmR0cw0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1tY2Jpbi1z
aW5nbGVzaG90LmR0cw0KPiBpbmRleCAyNjExNGQ5NmQ2MzcuLmI0NGY0YzAyOWI3OCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS04MDQwLW1jYmluLXNp
bmdsZXNob3QuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEt
ODA0MC1tY2Jpbi1zaW5nbGVzaG90LmR0cw0KPiBAQCAtMTYsMTQgKzE2LDE0IEBADQo+IA0KPiAg
JmNwMF9ldGgwIHsNCj4gIAlzdGF0dXMgPSAib2theSI7DQo+IC0JcGh5LW1vZGUgPSAiMTBnYmFz
ZS1rciI7DQo+ICsJcGh5LW1vZGUgPSAiMTBnYmFzZS1yIjsNCj4gIAltYW5hZ2VkID0gImluLWJh
bmQtc3RhdHVzIjsNCj4gIAlzZnAgPSA8JnNmcF9ldGgwPjsNCj4gIH07DQo+IA0KPiAgJmNwMV9l
dGgwIHsNCj4gIAlzdGF0dXMgPSAib2theSI7DQo+IC0JcGh5LW1vZGUgPSAiMTBnYmFzZS1rciI7
DQo+ICsJcGh5LW1vZGUgPSAiMTBnYmFzZS1yIjsNCj4gIAltYW5hZ2VkID0gImluLWJhbmQtc3Rh
dHVzIjsNCj4gIAlzZnAgPSA8JnNmcF9ldGgxPjsNCj4gIH07DQo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYXJtYWRhLTgwNDAtbWNiaW4uZHRzDQo+IGIvYXJjaC9h
cm02NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS04MDQwLW1jYmluLmR0cw0KPiBpbmRleCAwODdh
NTUwMjYzMWUuLjQyNzQxYWRmODY3YiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9tYXJ2ZWxsL2FybWFkYS04MDQwLW1jYmluLmR0cw0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21hcnZlbGwvYXJtYWRhLTgwNDAtbWNiaW4uZHRzDQo+IEBAIC02MywxNCArNjMsMTQgQEAN
Cj4gIAlzdGF0dXMgPSAib2theSI7DQo+ICAJLyogTmV0d29yayBQSFkgKi8NCj4gIAlwaHkgPSA8
JnBoeTA+Ow0KPiAtCXBoeS1tb2RlID0gIjEwZ2Jhc2Uta3IiOw0KPiArCXBoeS1tb2RlID0gIjEw
Z2Jhc2UtciI7DQo+ICB9Ow0KPiANCj4gICZjcDFfZXRoMCB7DQo+ICAJc3RhdHVzID0gIm9rYXki
Ow0KPiAgCS8qIE5ldHdvcmsgUEhZICovDQo+ICAJcGh5ID0gPCZwaHk4PjsNCj4gLQlwaHktbW9k
ZSA9ICIxMGdiYXNlLWtyIjsNCj4gKwlwaHktbW9kZSA9ICIxMGdiYXNlLXIiOw0KPiAgfTsNCj4g
DQo+ICAmY3AxX3BpbmN0cmwgew0KPiAtLQ0KPiAyLjIwLjENCg0K
