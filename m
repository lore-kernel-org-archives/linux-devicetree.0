From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v4 09/17] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 3 Dec 2013 08:38:19 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649804140F64@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
 <1386056231-17258-10-git-send-email-peter.chen@freescale.com>
 <529D95F7.8060705@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529D95F7.8060705@pengutronix.de>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, Frank Li <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

IA0KPiANCj4gT24gMTIvMDMvMjAxMyAwODozNyBBTSwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPiBT
b21lIFBIWSBidWdzIGFyZSBmaXhlZCBieSBJQyBsb2dpYywgYnV0IHRoZXNlIGJpdHMgYXJlIG5v
dA0KPiA+IGVuYWJsZWQgYnkgZGVmYXVsdCwgc28gd2UgZW5hYmxlIHRoZW0gYXQgZHJpdmVyLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBmcmVlc2NhbGUu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9waHkvcGh5LW14cy11c2IuYyB8ICAgMjAg
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3Bo
eS9waHktbXhzLXVzYi5jIGIvZHJpdmVycy91c2IvcGh5L3BoeS1teHMtDQo+IHVzYi5jDQo+ID4g
aW5kZXggODczODg5MC4uMDkwOGQ3NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9waHkv
cGh5LW14cy11c2IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3BoeS9waHktbXhzLXVzYi5jDQo+
ID4gQEAgLTMxLDYgKzMxLDEwIEBADQo+ID4gICNkZWZpbmUgSFdfVVNCUEhZX0NUUkxfU0VUCQkJ
MHgzNA0KPiA+ICAjZGVmaW5lIEhXX1VTQlBIWV9DVFJMX0NMUgkJCTB4MzgNCj4gPg0KPiA+ICsj
ZGVmaW5lIEhXX1VTQlBIWV9JUAkJCQkweDkwDQo+ID4gKyNkZWZpbmUgSFdfVVNCUEhZX0lQX1NF
VAkJCTB4OTQNCj4gPiArI2RlZmluZSBIV19VU0JQSFlfSVBfQ0xSCQkJMHg5OA0KPiA+ICsNCj4g
PiAgI2RlZmluZSBCTV9VU0JQSFlfQ1RSTF9TRlRSU1QJCQlCSVQoMzEpDQo+ID4gICNkZWZpbmUg
Qk1fVVNCUEhZX0NUUkxfQ0xLR0FURQkJCUJJVCgzMCkNCj4gPiAgI2RlZmluZSBCTV9VU0JQSFlf
Q1RSTF9FTkFVVE9TRVRfVVNCQ0xLUwlCSVQoMjYpDQo+ID4gQEAgLTQyLDYgKzQ2LDggQEANCj4g
PiAgI2RlZmluZSBCTV9VU0JQSFlfQ1RSTF9FTlVUTUlMRVZFTDIJCUJJVCgxNCkNCj4gPiAgI2Rl
ZmluZSBCTV9VU0JQSFlfQ1RSTF9FTkhPU1RESVNDT05ERVRFQ1QJQklUKDEpDQo+ID4NCj4gPiAr
I2RlZmluZSBCTV9VU0JQSFlfSVBfRklYICAgICAgICAgICAgICAgICAgICAgICAoQklUKDE3KSB8
IEJJVCgxOCkpDQo+ID4gKw0KPiA+ICAjZGVmaW5lIHRvX214c19waHkocCkgY29udGFpbmVyX29m
KChwKSwgc3RydWN0IG14c19waHksIHBoeSkNCj4gPg0KPiA+ICAvKiBEbyBkaXNjb25uZWN0aW9u
IGJldHdlZW4gUEhZIGFuZCBjb250cm9sbGVyIHdpdGhvdXQgdmJ1cyAqLw0KPiA+IEBAIC05Nyw2
ICsxMDMsMTYgQEAgc3RydWN0IG14c19waHkgew0KPiA+ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFw
X2FuYXRvcDsNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfaW14NnFf
cGh5KHN0cnVjdCBteHNfcGh5ICpteHNfcGh5KQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gbXhzX3Bo
eS0+ZGF0YSA9PSAmaW14NnFfcGh5X2RhdGE7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBpc19pbXg2c2xfcGh5KHN0cnVjdCBteHNfcGh5ICpteHNfcGh5KQ0KPiA+ICt7
DQo+ID4gKwlyZXR1cm4gbXhzX3BoeS0+ZGF0YSA9PSAmaW14NnNsX3BoeV9kYXRhOw0KPiA+ICt9
DQo+IA0KPiBXaHkgZG9uJ3QgeW91IHVzZSBhIGEgQklUKCkgaGVyZSBhcyBpbiBQYXRjaCAyLzE3
LCB0b28/DQo+IA0KIA0KVGhhbmtzLCBJIHdpbGwgZGVmaW5lIHRoZSB0d28gUEhZIHByb2JsZW1z
IGFzIHRoZSByZWdpc3RlciBiaXQNCnBvc2l0aW9uIGF0IDIvMTcsIGFuZCB1c2UgdGhvc2UgdHdv
IE1BQ1JPcyBhdCB0aGlzIHBhdGNoLg0KSXMgaXQgeW91ciBwb2ludD8NCg0KUGV0ZXINCg0KDQoN
Cg==

