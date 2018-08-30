From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v2 1/2] GPIO: add single-register gpio via creg driver
Date: Thu, 30 Aug 2018 12:14:25 +0000
Message-ID: <1535631219.4465.47.camel@synopsys.com>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
         <20180828112721.28178-2-Eugeniy.Paltsev@synopsys.com>
         <024be088-15ff-89ed-3766-09eb64e47342@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <024be088-15ff-89ed-3766-09eb64e47342@infradead.org>
Content-Language: en-US
Content-ID: <DDDFDA5BDD648947967BBC318628814F@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "rdunlap@infradead.org" <rdunlap@infradead.org>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "Alexey.Brodkin@synopsys.com" <Alexey.Brodkin@synopsys.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE4LTA4LTI4IGF0IDExOjE1IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IEhpLA0KPiANCj4gSSBkb24ndCBzZWUgYW55IHVwZGF0ZXMvY29ycmVjdGlvbnMgaGVyZS4gIDoo
DQoNCk15IGZhdWx0IC0gSSd2ZSBmb3Jnb3R0ZW4gdG8gcmUtZ2VuZXJhdGUgbmV3IHBhdGNoIHZp
YSBnaXQgZm9ybWF0LXBhdGNoDQphbmQgc2VuZCB5b3UgcHJldmlvdXMgdmVyc2lvbi4NCg0KPiAN
Cj4gT24gMDgvMjgvMjAxOCAwNDoyNyBBTSwgRXVnZW5peSBQYWx0c2V2IHdyb3RlOg0KPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9kcml2ZXJzL2dwaW8vS2NvbmZp
Zw0KPiA+IGluZGV4IDcxYzBhYjQ2ZjIxNi4uMGY5Y2MxNTgyY2FiIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3Bpby9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9ncGlvL0tjb25maWcNCj4g
PiBAQCAtNDMwLDYgKzQzMCwxNSBAQCBjb25maWcgR1BJT19SRUcNCj4gPiAgCSAgQSAzMi1iaXQg
c2luZ2xlIHJlZ2lzdGVyIEdQSU8gZml4ZWQgaW4vb3V0IGltcGxlbWVudGF0aW9uLiAgVGhpcw0K
PiA+ICAJICBjYW4gYmUgdXNlZCB0byByZXByZXNlbnQgYW55IHJlZ2lzdGVyIGFzIGEgc2V0IG9m
IEdQSU8gc2lnbmFscy4NCj4gPiAgDQo+ID4gK2NvbmZpZyBHUElPX1NOUFNfQ1JFRw0KPiA+ICsJ
Ym9vbCAiR1BJTyB2aWEgQ1JFRyAoQ29udHJvbCBSRUdpc2VycykgZHJpdmVyIg0KPiA+ICsJc2Vs
ZWN0IE9GX0dQSU8NCj4gPiArCWhlbHANCj4gPiArCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgR1BJ
T3MgdmlhIENSRUcgb24gdmFyaW91cyBTeW5vcHN5cyBTb0NzLg0KPiA+ICsJICBUaGlzIGlzIGlz
IHNpbmdsZS1yZWdpc3RlciBNTUlPIGdwaW8gZHJpdmVyIGZvciBjb21wbGV4IGNhc2VzDQo+ID4g
KwkgIHdoZXJlIG9ubHkgc2V2ZXJhbCBmaWVsZHMgaW4gcmVnaXN0ZXIgYmVsb25nIHRvIEdQSU8g
YW5kDQo+ID4gKwkgIGVhY2ggR1BJTyBvd25zIGZpZWxkIHdpdGggZGlmZmVyZW50IGxlbmd0aCBh
bmQgb24vb2ZmIHZhbHVlcy4NCj4gPiArDQo+ID4gIGNvbmZpZyBHUElPX1NQRUFSX1NQSUNTDQo+
ID4gIAlib29sICJTVCBTUEVBcjEzeHggU1BJIENoaXAgU2VsZWN0IGFzIEdQSU8gc3VwcG9ydCIN
Cj4gPiAgCWRlcGVuZHMgb24gUExBVF9TUEVBUg0KPiANCj4gDQotLSANCiBFdWdlbml5IFBhbHRz
ZXY=
