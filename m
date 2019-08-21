From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/4] watchdog: Add i.MX7ULP watchdog support
Date: Wed, 21 Aug 2019 02:27:36 +0000
Message-ID: <DB3PR0402MB391612986F147D70D1486F34F5AA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190812085321.13823-1-Anson.Huang@nxp.com>
 <20190812085321.13823-2-Anson.Huang@nxp.com>
 <20190820153155.GA19394@roeck-us.net> <20190820154815.GA20033@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820154815.GA20033@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "otavio@ossystems.com.br" <otavio@ossystems.com.br>, Leonard Crestez <leonard.crestez@nxp.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>, "jan.tuerk@emtrion.com" <jan.tuerk@emtrion.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>linux-
List-Id: devicetree@vger.kernel.org

SGksIEd1ZW50ZXINCg0KPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwODozMTo1NUFNIC0wNzAw
LCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDA0OjUz
OjE5UE0gKzA4MDAsIEFuc29uLkh1YW5nQG54cC5jb20NCj4gd3JvdGU6DQo+ID4gPiBGcm9tOiBB
bnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGUgaS5NWDdV
TFAgV2F0Y2hkb2cgVGltZXIgKFdET0cpIG1vZHVsZSBpcyBhbiBpbmRlcGVuZGVudCB0aW1lcg0K
PiA+ID4gdGhhdCBpcyBhdmFpbGFibGUgZm9yIHN5c3RlbSB1c2UuDQo+ID4gPiBJdCBwcm92aWRl
cyBhIHNhZmV0eSBmZWF0dXJlIHRvIGVuc3VyZSB0aGF0IHNvZnR3YXJlIGlzIGV4ZWN1dGluZyBh
cw0KPiA+ID4gcGxhbm5lZCBhbmQgdGhhdCB0aGUgQ1BVIGlzIG5vdCBzdHVjayBpbiBhbiBpbmZp
bml0ZSBsb29wIG9yDQo+ID4gPiBleGVjdXRpbmcgdW5pbnRlbmRlZCBjb2RlLiBJZiB0aGUgV0RP
RyBtb2R1bGUgaXMgbm90IHNlcnZpY2VkDQo+ID4gPiAocmVmcmVzaGVkKSB3aXRoaW4gYSBjZXJ0
YWluIHBlcmlvZCwgaXQgcmVzZXRzIHRoZSBNQ1UuDQo+ID4gPg0KPiA+ID4gQWRkIGRyaXZlciBz
dXBwb3J0IGZvciBpLk1YN1VMUCB3YXRjaGRvZy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IFJldmlld2VkLWJ5
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4NCj4gDQo+IFdhaXQsIEkg
aGF2ZSB0byB3aXRoZHJhdyB0aGF0Lg0KPiANCj4gV2l0aCBjbGtfcHJlcGFyZV9lbmFibGUoKSwg
eW91J2xsIGFsc28gbmVlZCB0byBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpDQo+IG9uIHJl
bW92ZS4gQW4gZWFzeSB3YXkgdG8gZG8gdGhpcyBhbmQga2VlcCB0aGUgY29kZSBzaW1wbGUgd291
bGQgYmU6DQo+IA0KPiBzdGF0aWMgdm9pZCBpbXg3dWxwX3dkdF9jbGtfZGlzYWJsZV91bnByZXBh
cmUodm9pZCAqZGF0YSkgew0KPiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEpOw0KPiB9DQo+
IA0KPiBzdGF0aWMgaW50IGlteDd1bHBfd2R0X3Byb2JlKC4uLikNCj4gew0KPiAJLi4uDQo+IAly
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaW14N3VscF93ZHQtPmNsayk7DQo+IAlpZiAocmV0KQ0K
PiAJCXJldHVybiByZXQ7DQo+IAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LA0K
PiBpbXg3dWxwX3dkdF9jbGtfZGlzYWJsZV91bnByZXBhcmUpOw0KPiAJaWYgKHJldCkNCj4gCQly
ZXR1cm4gcmV0Ow0KPiAJLi4uDQo+IA0KDQpBaCwgeWVzLCBJIGFkZGVkIHRoZSBlcnJvciBoYW5k
bGUgYnV0IG1pc3NlZCB0aGUgcmVtb3ZlIGNhc2UsIHRoYW5rcyBmb3IgeW91ciBraW5kbHkNCnN1
Z2dlc3Rpb24sIHBsZWFzZSBoZWxwIHJldmlldyBWMy4NCg0KVGhhbmtzLA0KQW5zb24uDQo=
