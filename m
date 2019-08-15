From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v4 02/21] ARM: dts: imx7-colibri: disable HS400
Date: Thu, 15 Aug 2019 13:52:39 +0000
Message-ID: <CAGgjyvFXYeGJrhT8zKoM8ACuniZUQBNqyuwimSB2UoRGo3Cj4A@mail.gmail.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-3-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812142105.1995-3-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <BDE53BC54221E04BACBC650A9843DA77@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?utf-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan.agner@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNToyMyBQTSBQaGlsaXBwZSBTY2hlbmtlcg0KPHBoaWxp
cHBlLnNjaGVua2VyQHRvcmFkZXguY29tPiB3cm90ZToNCj4NCj4gRnJvbTogU3RlZmFuIEFnbmVy
IDxzdGVmYW4uYWduZXJAdG9yYWRleC5jb20+DQo+DQo+IEZvcmNlIEhTMjAwIGJ5IG1hc2tpbmcg
Yml0IDYzIG9mIHRoZSBTREhDSSBjYXBhYmlsaXR5IHJlZ2lzdGVyLg0KPiBUaGUgaS5NWCBFU0RI
QyBkcml2ZXIgdXNlcyBTREhDSV9RVUlSSzJfQ0FQU19CSVQ2M19GT1JfSFM0MDAuIFdpdGgNCj4g
dGhhdCB0aGUgc3RhY2sgY2hlY2tzIGJpdCA2MyB0byBkZXNjaWRlIHdoZXRoZXIgSFM0MDAgaXMg
YXZhaWxhYmxlLg0KPiBVc2luZyBzZGhjaS1jYXBzLW1hc2sgYWxsb3dzIHRvIG1hc2sgYml0IDYz
LiBUaGUgc3RhY2sgdGhlbiBzZWxlY3RzDQo+IEhTMjAwIGFzIG9wZXJhdGluZyBtb2RlLg0KPg0K
PiBUaGlzIHByZXZlbnRzIHJhcmUgY29tbXVuaWNhdGlvbiBlcnJvcnMgd2l0aCBtaW5pbWFsIGVm
ZmVjdCBvbg0KPiBwZXJmb3JtYW5jZToNCj4gICAgICAgICBzZGhjaS1lc2RoYy1pbXggMzBiNjAw
MDAudXNkaGM6IHdhcm5pbmchIEhTNDAwIHN0cm9iZSBETEwNCj4gICAgICAgICAgICAgICAgIHN0
YXR1cyBSRUYgbm90IGxvY2shDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuLmFnbmVyQHRvcmFkZXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBTY2hlbmtl
ciA8cGhpbGlwcGUuc2NoZW5rZXJAdG9yYWRleC5jb20+DQoNClJldmlld2VkLWJ5OiBPbGVrc2Fu
ZHIgU3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+DQoNCj4gLS0tDQo+DQo+
IENoYW5nZXMgaW4gdjQ6IE5vbmUNCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQ0KPiBDaGFuZ2VzIGlu
IHYyOiBOb25lDQo+DQo+ICBhcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmkuZHRzaSB8IDEg
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+DQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmkuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDctY29saWJyaS5kdHNpDQo+IGluZGV4IGYxYzE5NzFmMjE2MC4uZjdjOWNlNWJlZDQ3IDEwMDY0
NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmkuZHRzaQ0KPiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmkuZHRzaQ0KPiBAQCAtMzI1LDYgKzMyNSw3IEBA
DQo+ICAgICAgICAgdm1tYy1zdXBwbHkgPSA8JnJlZ19tb2R1bGVfM3YzPjsNCj4gICAgICAgICB2
cW1tYy1zdXBwbHkgPSA8JnJlZ19EQ0RDMz47DQo+ICAgICAgICAgbm9uLXJlbW92YWJsZTsNCj4g
KyAgICAgICBzZGhjaS1jYXBzLW1hc2sgPSA8MHg4MDAwMDAwMCAweDA+Ow0KPiAgfTsNCj4NCj4g
ICZpb211eGMgew0KPiAtLQ0KPiAyLjIyLjANCj4NCg0KDQotLSANCkJlc3QgcmVnYXJkcw0KT2xl
a3NhbmRyIFN1dm9yb3YNCg0KVG9yYWRleCBBRw0KQWx0c2FnZW5zdHJhc3NlIDUgfCA2MDQ4IEhv
cncvTHV6ZXJuIHwgU3dpdHplcmxhbmQgfCBUOiArNDEgNDEgNTAwDQo0ODAwIChtYWluIGxpbmUp
DQo=
