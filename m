From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Thu, 4 Feb 2016 13:28:57 +0000
Message-ID: <B256D81BAE5131468A838E5D7A243641D64062A0@penmbx01>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
 <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
 <20160129113518.GQ4130@sirena.org.uk>
 <CABxcv=kNKmgRytxB5ppawrAvC-GDRhV4T_UUGvpHgKp9+BsUmQ@mail.gmail.com>
 <B256D81BAE5131468A838E5D7A243641D63FE2C7@penmbx01>
 <CABxcv=nJsWEv9KW-5iPpUnyN8ZVpx6CV07gBRaLNWqd644YOqQ@mail.gmail.com>
 <B256D81BAE5131468A838E5D7A243641D64026CB@penmbx01>
 <20160203174753.GJ4455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160203174753.GJ4455@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Peter Korsgaard <jacmet@gmail.com>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biBbbWFp
bHRvOmJyb29uaWVAa2VybmVsLm9yZ10NCj4gU2VudDogMjAxNsTqMtTCNMjVIDE6NDgNCj4gVG86
IFlhbmcsIFdlbnlvdSA8V2VueW91LllhbmdAYXRtZWwuY29tPg0KPiBDYzogSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzIDxqYXZpZXJAZG93aGlsZTAub3JnPjsgTGlhbSBHaXJkd29vZA0KPiA8bGdp
cmR3b29kQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBQYXdl
bCBNb2xsDQo+IDxwYXdlbC5tb2xsQGFybS5jb20+OyBJYW4gQ2FtcGJlbGwgPGlqYytkZXZpY2V0
cmVlQGhlbGxpb24ub3JnLnVrPjsgS3VtYXINCj4gR2FsYSA8Z2FsYWtAY29kZWF1cm9yYS5vcmc+
OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrLmtvemxvd3NraUBzYW1zdW5nLmNvbT47IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBQZXRlcg0KPiBLb3JzZ2FhcmQgPGphY21ldEBn
bWFpbC5jb20+OyBGZXJyZSwgTmljb2xhcyA8Tmljb2xhcy5GRVJSRUBhdG1lbC5jb20+Ow0KPiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMS8yXSByZWd1bGF0b3I6IGFjdDg5NDVhOiBhZGQgcmVndWxhdG9yIGRyaXZlciBm
b3INCj4gQUNUODk0NUENCj4gDQo+IE9uIFdlZCwgRmViIDAzLCAyMDE2IGF0IDAyOjMzOjExQU0g
KzAwMDAsIFlhbmcsIFdlbnlvdSB3cm90ZToNCj4gDQo+ID4gPiBJIHdvdWxkIGp1c3QgcmVtb3Zl
IHRoZSAiYWN0aXZlLXNlbWksYWN0ODk0NWEtcmVndWxhdG9yIiBub2RlIGFuZA0KPiA+ID4gbWFr
ZSAiYWN0aXZlLSBzZW1pLHZzZWwtaGlnaCIgYSBwcm9wZXJ0eSBvZiB0aGUgImFjdGl2ZS1zZW1p
LGFjdDg5NDVhIiBub2RlLg0KPiA+ID4gVGhhdCB3YXkgeW91IGNhbiByZW1vdmUgdGhlIG1mZCBj
ZWxsIC5vZl9jb21wYXRpYmxlIGFuZCBPRiB0YWJsZSBpbg0KPiA+ID4gdGhlIHJlZ3VsYXRvciBk
cml2ZXIgYW5kIHJlYWQgdGhlICJhY3RpdmUtc2VtaSx2c2VsLWhpZ2giIHVzaW5nIHRoZQ0KPiA+
ID4gcGxhdGZvcm0gZGV2aWNlJ3MgcGFyZW50IG9mX25vZGUuDQo+IA0KPiA+ID4gQnV0IGl0J3Mg
YmV0dGVyIGlmIHlvdSB3YWl0IGZvciBNYXJrJ3Mgb3BpbmlvbnMgYmVmb3JlIHJlLXNwaW5pbmcg
eW91ciBwYXRjaGVzLg0KPiANCj4gPiBIaSBNYXJrLCB3aGF0IGlzIHlvdXIgb3BpbmlvbnM/DQo+
IA0KPiBMaWtlIEphdmllciBzYXlzIHlvdSBzaG91bGQgbWFrZSB5b3VyIERUIGJpbmRpbmcgbG9v
ayBsaWtlIHRoZSBEVCBiaW5kaW5ncyBmb3INCj4gb3RoZXIgTUZEcyBhbmQgbm90IHVzZSBvZl9j
b21wYXRpYmxlLg0KDQpBbGwgcmlnaHQuDQoNClRoYW5rIHlvdSwgTWFyaywgSmF2aWVyLg0KDQoN
CkJlc3QgUmVnYXJkcywNCldlbnlvdSBZYW5nDQo=
