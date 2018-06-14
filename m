From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v7 10/10] drivers: clk: Add ZynqMP clock driver
Date: Thu, 14 Jun 2018 18:30:03 +0000
Message-ID: <SN1PR02MB3758971F60A9800642B16F95B87D0@SN1PR02MB3758.namprd02.prod.outlook.com>
References: <1527713725-1086-1-git-send-email-jollys@xilinx.com>
 <1527713725-1086-11-git-send-email-jollys@xilinx.com>
 <c042fd9b-85cb-f0d3-101c-f78f3dc4fc44@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c042fd9b-85cb-f0d3-101c-f78f3dc4fc44@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tejas Patel <TEJASP@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>
List-Id: devicetree@vger.kernel.org

SGkgUmFuZHksDQoNClRoYW5rcyBmb3IgcmV2aWV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFJhbmR5IER1bmxhcCBbbWFpbHRvOnJkdW5sYXBAaW5mcmFkZWFkLm9y
Z10NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMzAsIDIwMTggMjoxOCBQTQ0KPiBUbzogSm9sbHkg
U2hhaCA8Sk9MTFlTQHhpbGlueC5jb20+OyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBt
aW5nb0BrZXJuZWwub3JnOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbWF0dEBjb2RlYmx1
ZXByaW50LmNvLnVrOw0KPiBzdWRlZXAuaG9sbGFAYXJtLmNvbTsgaGthbGx3ZWl0MUBnbWFpbC5j
b207IGtlZXNjb29rQGNocm9taXVtLm9yZzsNCj4gZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsg
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNib3lkQGNvZGVhdXJvcmEub3JnOyBtaWNoYWwu
c2ltZWtAeGlsaW54LmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBtYXJrLnJ1dGxhbmRAYXJt
LmNvbTsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZw0KPiBDYzogUmFqYW4gVmFqYSA8UkFKQU5W
QHhpbGlueC5jb20+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBU
ZWphcyBQYXRlbA0KPiA8VEVKQVNQQHhpbGlueC5jb20+OyBTaHViaHJhanlvdGkgRGF0dGEgPHNo
dWJocmFqQHhpbGlueC5jb20+OyBKb2xseSBTaGFoDQo+IDxKT0xMWVNAeGlsaW54LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NyAxMC8xMF0gZHJpdmVyczogY2xrOiBBZGQgWnlucU1QIGNs
b2NrIGRyaXZlcg0KPiANCj4gT24gMDUvMzAvMjAxOCAwMTo1NSBQTSwgSm9sbHkgU2hhaCB3cm90
ZToNCj4gPiBGcm9tOiBKb2xseSBTaGFoIDxqb2xseS5zaGFoQHhpbGlueC5jb20+DQo+IA0KPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvenlucW1wL0tjb25maWcgYi9kcml2ZXJzL2Ns
ay96eW5xbXAvS2NvbmZpZw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAu
LmZlODE1ZjcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvenlucW1w
L0tjb25maWcNCj4gPiBAQCAtMCwwICsxLDExIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+ID4gK2NvbmZpZyBDT01NT05fQ0xLX1pZTlFNUA0KPiA+
ICsJYm9vbCAiU3VwcG9ydCBmb3IgWGlsaW54IFp5bnFNUCBVbHRyYXNjYWxlKyBjbG9jayBjb250
cm9sbGVycyINCj4gPiArCWRlcGVuZHMgb24gT0YNCj4gPiArCWRlcGVuZHMgb24gQVJDSF9aWU5R
TVAgfHwgQ09NUElMRV9URVNUDQo+ID4gKwlkZXBlbmRzIG9uIFpZTlFNUF9GSVJNV0FSRQ0KPiA+
ICsJaGVscA0KPiA+ICsJICBTdXBwb3J0IGZvciB0aGUgWnlucW1wIFVsdHJhc2NhbGUgY2xvY2sg
Y29udHJvbGxlci4NCj4gPiArCSAgSXQgaGFzIGEgZGVwZW5kZW5jeSBvbiB0aGUgUE1VIGZpcm13
YXJlLg0KPiA+ICsJICBTYXkgWSBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IGNsb2NrIHN1cHBvcnQN
Cj4gDQo+IAkgIFNheSBZIGlmIHlvdSB3YW50IHRvIGluY2x1ZGUgY2xvY2sgc3VwcG9ydC4NCj4g
DQoJRml4ZWQgaW4gdjgNCg0KPiANCj4gLS0NCj4gflJhbmR5DQo=
