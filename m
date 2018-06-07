Return-Path: <SRS0=13PW=IZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0049.outbound.protection.outlook.com ([104.47.2.49]:14784
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752213AbeFGArN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 Jun 2018 20:47:13 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v6 00/15] staging: typec: tcpci: move out of staging
Date: Thu, 7 Jun 2018 00:47:09 +0000
Message-ID: <AM0PR0402MB39088CDEAFE190D3E41251E589640@AM0PR0402MB3908.eurprd04.prod.outlook.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1ce9509d-8b41-0b66-40d8-2d7badc972eb@gmail.com>
In-Reply-To: <1ce9509d-8b41-0b66-40d8-2d7badc972eb@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Mats Karrman <mats.dev.list@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGkgTWF0cywNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0cyBLYXJy
bWFuIFttYWlsdG86bWF0cy5kZXYubGlzdEBnbWFpbC5jb21dDQo+IFNlbnQ6IDIwMTjlubQ25pyI
N+aXpSA1OjQ1DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsgcm9iaCtkdEBrZXJuZWwu
b3JnOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gaGVpa2tpLmtyb2dlcnVzQGxpbnV4
LmludGVsLmNvbTsgbGludXhAcm9lY2stdXMubmV0DQo+IENjOiBjdzAwLmNob2lAc2Ftc3VuZy5j
b207IGEuaGFqZGFAc2Ftc3VuZy5jb207IHNodWZhbl9sZWVAcmljaHRlay5jb207DQo+IFBldGVy
IENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT47IGdhcnNpbHZhQGVtYmVkZGVkb3IuY29tOw0KPiBn
c29tbG9AZ21haWwuY29tOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsNCj4gZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NiAwMC8xNV0gc3RhZ2luZzogdHlwZWM6IHRjcGNpOiBtb3ZlIG91
dCBvZiBzdGFnaW5nDQo+IA0KPiBIZWxsbyBMaSBKdW4sDQo+IA0KPiBJIGhhdmUgYmVlbiB0ZXN0
aW5nIHRoZXNlIHBhdGNoZXMgb24gdG9wIG9mIHVzYi1uZXh0IHVzaW5nIGFuIGkuTVg2LCBhIG54
cA0KPiBwdG41MTEwIGV2YWx1YXRpb24gYm9hcmQgYW5kIGEgYnVuY2ggb2YgdXNiYyBkZXZpY2Vz
LiBTbyBmYXIgZXZlcnl0aGluZyBzZWVtIHRvDQo+IHdvcmsgZmluZSEgOi0pIEhvd2V2ZXIsIEkg
aGF2ZSBvbmx5IHRlc3RlZCBob3N0IG1vZGUgYW5kIEkgaGF2ZSBzb21lIHRlc3QgY2FzZXMNCj4g
bGVmdCBJIHdhbnQgdG8gY292ZXIuDQo+IA0KPiBKdXN0IHRvIGxldCB5b3Uga25vdyB5b3VyIHBh
dGNoZXMgYXJlIG5vdCBmb3Jnb3R0ZW4gOi0pDQoNCkdvb2QgdG8ga25vdyB0aGF0LCB0aGFua3Ms
IE1hdHMsIHRob3NlIHBhdGNoZXMgd2FzIHRlc3RlZCBvbiBteSBpLk1YOE0NCkhXIHdpdGggUFRO
NTExMCBmb3IgYm90aCBzb3VyY2UgYW5kIHNpbmsgbW9kZSwgaG9wZSB5b3UgY2FuIHRlc3QgeW91
cg0KZGV2aWNlIG1vZGUgYXMgd2VsbCBzb29uLg0KDQpMaSBKdW4NCg==
