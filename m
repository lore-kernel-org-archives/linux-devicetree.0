Return-Path: <SRS0=ZPg/=RD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30072.outbound.protection.outlook.com ([40.107.3.72]:52144
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731013AbfB1JGA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Feb 2019 04:06:00 -0500
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 2/2] usb: typec: add typec switch via GPIO control
Date: Thu, 28 Feb 2019 09:05:16 +0000
Message-ID: <VI1PR04MB455881E0E3F3A978C1697CB489750@VI1PR04MB4558.eurprd04.prod.outlook.com>
References: <1551078369-1654-1-git-send-email-jun.li@nxp.com>
 <1551078369-1654-2-git-send-email-jun.li@nxp.com>
 <CAHp75VcOt0L_RgrSDsn_ybbmd0-bk4TABT+MtYFRFOXcnGNTOA@mail.gmail.com>
In-Reply-To: <CAHp75VcOt0L_RgrSDsn_ybbmd0-bk4TABT+MtYFRFOXcnGNTOA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVu
a28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IFNlbnQ6IDIwMTnlubQy5pyIMjbml6Ug
MTU6MjUNCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IENjOiByb2JoK2R0QGtlcm5l
bC5vcmc7IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb207DQo+IGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnOyBoZGVnb2VkZUByZWRoYXQuY29tOyBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1p
bXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIHVzYjogdHlwZWM6IGFkZCB0
eXBlYyBzd2l0Y2ggdmlhIEdQSU8gY29udHJvbA0KPiANCj4gT24gTW9uLCBGZWIgMjUsIDIwMTkg
YXQgOToyNyBBTSBKdW4gTGkgPGp1bi5saUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMg
cGF0Y2ggYWRkcyBhIHNpbXBsZSB0eXBlYyBzd2l0Y2ggZHJpdmVyIHdoaWNoIG9ubHkgbmVlZHMg
YSBHUElPDQo+ID4gdG8gc3dpdGNoIHRoZSBzdXBlciBzcGVlZCBhY3RpdmUgY2hhbm5lbCBhY2Nv
cmRpbmcgdG8gdHlwZWMNCj4gPiBvcmllbnRhdGlvbi4NCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
Pg0KPiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9v
Zl9ncGlvLmg+DQo+IA0KPiBJIGRvbid0IHNlZSBob3cgdGhlc2UgYXJlIGluIHVzZS4NCg0KSSB3
aWxsIHVzZSBiZWxvdyAyIGhlYWQgZmlsZXMgaW5zdGVhZCBmb3IgdjIuDQojaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPg0KI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPg0K
DQpUaGFua3MNCkxpIEp1bg0KDQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5k
eSBTaGV2Y2hlbmtvDQo=
