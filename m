From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v4 0/6] PCI: imx: Initial imx7d suspend/resume support
Date: Mon, 17 Sep 2018 17:15:14 +0000
Message-ID: <e367a04f3b5652aa9ed3baefbb7d0b12eb5eb8dd.camel@nxp.com>
References: <cover.1534264292.git.leonard.crestez@nxp.com>
         <20180917150941.GH7239@e107981-ln.cambridge.arm.com>
         <16d68541fd499dfda88e79d4386be7ad6d0919d9.camel@nxp.com>
         <20180917165257.GJ7239@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917165257.GJ7239@e107981-ln.cambridge.arm.com>
Content-Language: en-US
Content-ID: <2E58251B00C34D4C858BA7BB5E7F3A7A@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Anson Huang <anson.huang@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE4LTA5LTE3IGF0IDE3OjUyICswMTAwLCBMb3JlbnpvIFBpZXJhbGlzaSB3cm90
ZToNCj4gT24gTW9uLCBTZXAgMTcsIDIwMTggYXQgMDQ6MDE6MjFQTSArMDAwMCwgTGVvbmFyZCBD
cmVzdGV6IHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAxOC0wOS0xNyBhdCAxNjowOSArMDEwMCwgTG9y
ZW56byBQaWVyYWxpc2kgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEF1ZyAxNCwgMjAxOCBhdCAwNzo1
MDoxNFBNICswMzAwLCBMZW9uYXJkIENyZXN0ZXogd3JvdGU6DQo+ID4gPiA+IFY0IGFkZHMgNCBt
b3JlIHBhdGNoZXMgd2l0aCBQTUVfVHVybl9PZmYgc3VwcG9ydCBvbiB0b3AsIHVzaW5nIGEgbmV3
DQo+ID4gPiA+IHJlc2V0IGJpdC4gSSBnZW5lcmFsbHkgdHJ5IHRvIGtlZXAgc2VyaWVzIHNob3J0
IGJ1dCBpbiB0aGlzIGNhc2Ugc29tZQ0KPiA+ID4gPiBwbGFubmluZyBtaWdodCBiZSBuZWVkZWQg
dG8gZ2V0IHBhdGNoZXMgaW50byA0LjIwLg0KPiA+ID4gPiANCj4gPiA+ID4gU2luY2UgdGhlIG5l
dyByZXNldCBpcyB0cmVhdGVkIGFzIG9wdGlvbmFsIHdpdGggb2xkIERUQiB0aGVyZSBzaG91bGQg
YmUNCj4gPiA+ID4gYWdhaW4gbm8gcHJvYmxlbSBpZiByZXNldCBhbmQgcGNpIGFyZSBtZXJnZWQg
b3V0IG9mIG9yZGVyLg0KPiA+ID4gPiANCj4gPiA+ID4gU2hhd24vUGhpbGlwcC9Mb3JlbnpvOiBX
b3VsZCBpdCBtYWtlIHNlbnNlIHRvIG1lcmdlIHRoaXMgc2VyaWVzIHRocm91Z2ggYQ0KPiA+ID4g
PiBzaW5nbGUgc3BlY2lmaWMgdHJlZSwgc3VjaCBhcyB0aGUgb25lIGZvciBpbXg/DQo+ID4gPiAN
Cj4gPiA+IFRoaXMgc2VyaWVzIGlzIGEgYml0IG9mIGEgbWl4dHVyZSBvZiBtdWx0aXBsZSB0aGlu
Z3MgaGFyZCB0byBkaXNjZXJuDQo+ID4gPiAoYWN0dWFsbHkgSSBhbHJlYWR5IG1lcmdlZCBwYXRj
aCAyIGFuZCBwYXRjaCAxIHNlZW1zIGNvbXBsZXRlbHkNCj4gPiA+IHVucmVsYXRlZCkuDQo+ID4g
PiANCj4gPiA+IEkgd291bGQgdGFrZSB0aGUgc2VyaWVzIHRocm91Z2ggdGhlIFBDSSB0cmVlIGJ1
dCBJIG5lZWQgYW4gQUNLIGZvcg0KPiA+ID4gcGF0Y2hlcyA1IGFuZCA2LCBwbGVhc2UgbGV0IG1l
IGtub3cgaG93IHlvdSB3YW50IHRvIGhhbmRsZSBpdC4NCj4gPiANCj4gPiBQYXRjaGVzIDEgYW5k
IDIgYXJlIGFscmVhZHkgaW4sIHRoZSByZXN0IG5lZWQgcmV2aWV3LiBJIGNhbiBub3cganVzdA0K
PiA+IHJlc2VuZCBwYXRjaGVzIDMtNiBhcyBhIHNlcGFyYXRlIHNlcmllcywgdW5sZXNzIHNvbWVi
b2R5IGNvbXBsYWlucw0KPiA+IGFib3V0IHNwYW0uDQo+IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5
ICJhcmUgYWxyZWFkeSBpbiIgPyBQYXRjaCAyIEkgcXVldWVkIHZpYSB0aGUgUENJDQo+IHRyZWUs
IHBhdGNoIDEgPyBDYW4gSSBkcm9wIGl0IGZyb20gdGhlIFBDSSBwYXRjaCBxdWV1ZSA/DQoNClNv
cnJ5LCB3aGF0IEkgbWVhbnQgaGVyZSBpcyAiYWNjZXB0ZWQgYnkgYSBtYWludGFpbmVyIi4gU28g
a2VlcCBwYXRjaCAyDQpwbGVhc2U7IHBhdGNoIDEgd2FzIGFjY2VwdGVkIGJ5IFNoYXduIGZldyB3
ZWVrcyBhZ28uDQoNCj4gSSBkbyBub3QgdGhpbmsgdGhlcmUgaXMgYW55IG5lZWQgdG8gcmVzZW5k
LCBJIGNhbiBtZXJnZSBwYXRjaGVzIDMtNA0KPiBzaW5jZSB0aGV5IGhhdmUgYmVlbiByZXZpZXdl
ZCBidXQgcGF0Y2hlcyA1IGFuZCA2IG5lZWQgcmV2aWV3Lg0KDQpQYXRjaGVzIDMtNCB3ZXJlIGFj
a2VkIGJ5IFJvYiBIZXJyaW5nIG1vc3RseSBmcm9tIHRoZSBkZXZpY2V0cmVlDQpwZXJzcGVjdGl2
ZS4gU2luY2UgcGF0Y2hlcyAzLTYgYXJlIG5vdCB1c2VmdWwgaW5kZXBlbmRlbnRseSBzb21lYm9k
eQ0KbGlrZSBMdWNhcyBzaG91bGQgcmV2aWV3IHRoZSB3aG9sZSBzZXJpZXMgYW5kIHRoZW4gaXQg
Y2FuIGJlIG1lcmdlZC4NCg0KLS0NClJlZ2FyZHMsDQpMZW9uYXJk
