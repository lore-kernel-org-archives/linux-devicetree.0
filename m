From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v4 09/17] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 3 Dec 2013 08:49:35 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649804140FC9@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
 <1386056231-17258-10-git-send-email-peter.chen@freescale.com>
 <529D95F7.8060705@pengutronix.de>
 <F281D0F91ED19E4D8E63A7504E8A649804140F64@039-SN2MPN1-021.039d.mgd.msft.net>
 <529D99AD.3010304@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529D99AD.3010304@pengutronix.de>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, Frank Li <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCiANCj4gT24gMTIvMDMvMjAxMyAwOTozOCBBTSwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPg0K
PiA+Pg0KPiA+PiBPbiAxMi8wMy8yMDEzIDA4OjM3IEFNLCBQZXRlciBDaGVuIHdyb3RlOg0KPiA+
Pj4gU29tZSBQSFkgYnVncyBhcmUgZml4ZWQgYnkgSUMgbG9naWMsIGJ1dCB0aGVzZSBiaXRzIGFy
ZSBub3QNCj4gPj4+IGVuYWJsZWQgYnkgZGVmYXVsdCwgc28gd2UgZW5hYmxlIHRoZW0gYXQgZHJp
dmVyLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIENoZW4gPHBldGVyLmNoZW5A
ZnJlZXNjYWxlLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGRyaXZlcnMvdXNiL3BoeS9waHktbXhz
LXVzYi5jIHwgICAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gIDEgZmlsZXMgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvcGh5L3BoeS1teHMtdXNiLmMgYi9kcml2ZXJzL3VzYi9waHkvcGh5
LW14cy0NCj4gPj4gdXNiLmMNCj4gPj4+IGluZGV4IDg3Mzg4OTAuLjA5MDhkNzQgMTAwNjQ0DQo+
ID4+PiAtLS0gYS9kcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYw0KPiA+Pj4gKysrIGIvZHJp
dmVycy91c2IvcGh5L3BoeS1teHMtdXNiLmMNCj4gPj4+IEBAIC0zMSw2ICszMSwxMCBAQA0KPiA+
Pj4gICNkZWZpbmUgSFdfVVNCUEhZX0NUUkxfU0VUCQkJMHgzNA0KPiA+Pj4gICNkZWZpbmUgSFdf
VVNCUEhZX0NUUkxfQ0xSCQkJMHgzOA0KPiA+Pj4NCj4gPj4+ICsjZGVmaW5lIEhXX1VTQlBIWV9J
UAkJCQkweDkwDQo+ID4+PiArI2RlZmluZSBIV19VU0JQSFlfSVBfU0VUCQkJMHg5NA0KPiA+Pj4g
KyNkZWZpbmUgSFdfVVNCUEhZX0lQX0NMUgkJCTB4OTgNCj4gPj4+ICsNCj4gPj4+ICAjZGVmaW5l
IEJNX1VTQlBIWV9DVFJMX1NGVFJTVAkJCUJJVCgzMSkNCj4gPj4+ICAjZGVmaW5lIEJNX1VTQlBI
WV9DVFJMX0NMS0dBVEUJCQlCSVQoMzApDQo+ID4+PiAgI2RlZmluZSBCTV9VU0JQSFlfQ1RSTF9F
TkFVVE9TRVRfVVNCQ0xLUwlCSVQoMjYpDQo+ID4+PiBAQCAtNDIsNiArNDYsOCBAQA0KPiA+Pj4g
ICNkZWZpbmUgQk1fVVNCUEhZX0NUUkxfRU5VVE1JTEVWRUwyCQlCSVQoMTQpDQo+ID4+PiAgI2Rl
ZmluZSBCTV9VU0JQSFlfQ1RSTF9FTkhPU1RESVNDT05ERVRFQ1QJQklUKDEpDQo+ID4+Pg0KPiA+
Pj4gKyNkZWZpbmUgQk1fVVNCUEhZX0lQX0ZJWCAgICAgICAgICAgICAgICAgICAgICAgKEJJVCgx
NykgfCBCSVQoMTgpKQ0KPiA+Pj4gKw0KPiA+Pj4gICNkZWZpbmUgdG9fbXhzX3BoeShwKSBjb250
YWluZXJfb2YoKHApLCBzdHJ1Y3QgbXhzX3BoeSwgcGh5KQ0KPiA+Pj4NCj4gPj4+ICAvKiBEbyBk
aXNjb25uZWN0aW9uIGJldHdlZW4gUEhZIGFuZCBjb250cm9sbGVyIHdpdGhvdXQgdmJ1cyAqLw0K
PiA+Pj4gQEAgLTk3LDYgKzEwMywxNiBAQCBzdHJ1Y3QgbXhzX3BoeSB7DQo+ID4+PiAgCXN0cnVj
dCByZWdtYXAgKnJlZ21hcF9hbmF0b3A7DQo+ID4+PiAgfTsNCj4gPj4+DQo+ID4+PiArc3RhdGlj
IGlubGluZSBib29sIGlzX2lteDZxX3BoeShzdHJ1Y3QgbXhzX3BoeSAqbXhzX3BoeSkNCj4gPj4+
ICt7DQo+ID4+PiArCXJldHVybiBteHNfcGh5LT5kYXRhID09ICZpbXg2cV9waHlfZGF0YTsNCj4g
Pj4+ICt9DQo+ID4+PiArDQo+ID4+PiArc3RhdGljIGlubGluZSBib29sIGlzX2lteDZzbF9waHko
c3RydWN0IG14c19waHkgKm14c19waHkpDQo+ID4+PiArew0KPiA+Pj4gKwlyZXR1cm4gbXhzX3Bo
eS0+ZGF0YSA9PSAmaW14NnNsX3BoeV9kYXRhOw0KPiA+Pj4gK30NCj4gPj4NCj4gPj4gV2h5IGRv
bid0IHlvdSB1c2UgYSBhIEJJVCgpIGhlcmUgYXMgaW4gUGF0Y2ggMi8xNywgdG9vPw0KPiA+Pg0K
PiA+DQo+ID4gVGhhbmtzLCBJIHdpbGwgZGVmaW5lIHRoZSB0d28gUEhZIHByb2JsZW1zIGFzIHRo
ZSByZWdpc3RlciBiaXQNCj4gPiBwb3NpdGlvbiBhdCAyLzE3LCBhbmQgdXNlIHRob3NlIHR3byBN
QUNST3MgYXQgdGhpcyBwYXRjaC4NCj4gPiBJcyBpdCB5b3VyIHBvaW50Pw0KPiANCj4gSSB3YXMg
d29uZGVyaW5nIGlmIHRoZSBkcml2ZXIgbG9va3MgbW9yZSB1bmlmb3JtIGlmIHlvdSB1c2Ugc29t
ZXRoaW5nDQo+IGxpa2UgdGhpczoNCj4gDQo+ICNkZWZpbmUgTVhTX1BIWV9ORUVEX0lQX0ZJWAkJ
QklUKDMpDQo+IA0KDQpPSywgd2lsbCBjaGFuZ2UgbGlrZSBiZWxvdzoNCg0KaWYgKG14c19waHkt
PmRhdGEtPmZsYWdzICYgTVhTX1BIWV9ORUVEX0lQX0ZJWCkNCgl3cml0ZWwoQk1fVVNCUEhZX0lQ
X0ZJWCwgYmFzZSArIEhXX1VTQlBIWV9JUF9TRVQpOw0KDQpQZXRlcg0KDQo=

