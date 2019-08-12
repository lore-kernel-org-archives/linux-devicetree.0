From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH] ARM: dts: imx7d: sbc-iot-imx7: add recovery for i2c3/4
Date: Mon, 12 Aug 2019 08:50:17 +0000
Message-ID: <5b59f3c2b78eaf717885fa005158a0e8a6c51591.camel@toradex.com>
References: <20190807082556.5013-6-philippe.schenker@toradex.com>
 <20190810215817.5118-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190810215817.5118-1-git@andred.net>
Content-Language: en-US
Content-ID: <C4650A38930A7543B5311F4BB78928C8@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "git@andred.net" <git@andred.net>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gU2F0LCAyMDE5LTA4LTEwIGF0IDIyOjU4ICswMTAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToN
Cj4gT24gV2VkLCAwNyBBdWcgMjAxOSAwODoyNjoxNSArMDAwMCwgUGhpbGlwcGUgU2NoZW5rZXIg
d3JvdGU6DQo+ID4gRnJvbTogT2xla3NhbmRyIFN1dm9yb3YgPG9sZWtzYW5kci5zdXZvcm92QHRv
cmFkZXguY29tPg0KPiA+IA0KPiA+IC0gYWRkIHJlY292ZXJ5IG1vZGUgZm9yIGFwcGxpY2FibGUg
aTJjIGJ1c2VzIGZvcg0KPiA+ICAgQ29saWJyaSBpTVg3IG1vZHVsZS4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPHBoaWxpcHBlLnNjaGVu
a2VyQHRvcmFkZXguY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjM6IE5vbmUN
Cj4gPiBDaGFuZ2VzIGluIHYyOiBOb25lDQo+ID4gDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lt
eDctY29saWJyaS5kdHNpIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kNCj4gPiBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+ID4gaW5kZXggYThkOTkyZjNlODk3
Li4yNDgwNjIzYzkyZmYgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1j
b2xpYnJpLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmkuZHRz
aQ0KPiA+IEBAIC0xNDAsOCArMTQwLDEyIEBADQo+ID4gDQo+ID4gICZpMmMxIHsNCj4gPiAgCWNs
b2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDA+Ow0KPiA+IC0JcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsNCj4gPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJncGlvIjsNCj4gPiAgCXBpbmN0
cmwtMCA9IDwmcGluY3RybF9pMmMxICZwaW5jdHJsX2kyYzFfaW50PjsNCj4gPiArCXBpbmN0cmwt
MSA9IDwmcGluY3RybF9pMmMxX3JlY292ZXJ5ICZwaW5jdHJsX2kyYzFfaW50PjsNCj4gPiArCXNj
bC1ncGlvcyA9IDwmZ3BpbzEgNCBHUElPX0FDVElWRV9ISUdIPjsNCj4gDQo+IHNjbC1ncGlvcyBz
aG91bGQgYmUgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pIHNpbmNlDQo+IGNv
bW1pdCBkMmQwYWQyYWVjNGEgKCJpMmM6IGlteDogdXNlIG9wZW4gZHJhaW4gZm9yIHJlY292ZXJ5
IEdQSU8iKQ0KPiANCj4gT3RoZXJ3aXNlIHlvdSdsbCBnZXQgYSBib290LXRpbWUgd2FybmluZzoN
Cj4gICAgZW5mb3JjZWQgb3BlbiBkcmFpbiBwbGVhc2UgZmxhZyBpdCBwcm9wZXJseSBpbiBEVC9B
Q1BJIERTRFQvYm9hcmQNCj4gZmlsZQ0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LCBJ
IGFkZGVkIHRoaXMgZm9yIHY0Lg0KDQpQaGlsaXBwZQ0KPiANCj4gPiArCXNkYS1ncGlvcyA9IDwm
Z3BpbzEgNSBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiArDQo+ID4gIAlzdGF0dXMgPSAib2theSI7
DQo+ID4gDQo+ID4gIAljb2RlYzogc2d0bDUwMDBAYSB7DQo+ID4gQEAgLTI0Miw4ICsyNDYsMTEg
QEANCj4gPiANCj4gPiAgJmkyYzQgew0KPiA+ICAJY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47
DQo+ID4gLQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IiwgImdwaW8iOw0KPiA+ICAJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzQ+Ow0K
PiA+ICsJcGluY3RybC0xID0gPCZwaW5jdHJsX2kyYzRfcmVjb3Zlcnk+Ow0KPiA+ICsJc2NsLWdw
aW9zID0gPCZncGlvNyA4IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiANCj4gYW5kIGhlcmUsIHRvby4N
Cj4gDQo+IENoZWVycywNCj4gQW5kcsOpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
