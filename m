From: Robin Gong <yibin.gong@nxp.com>
Subject: Re: [PATCH v2 6/7] dmaengine: fsl-edma: add i.mx7ulp edma2 version
 support
Date: Mon, 27 May 2019 10:04:52 +0000
Message-ID: <1558980522.19282.19.camel@nxp.com>
References: <20190527085118.40423-1-yibin.gong@nxp.com>
         <20190527085118.40423-7-yibin.gong@nxp.com>
         <20190527090553.lek7tm3lyst3bhrd@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527090553.lek7tm3lyst3bhrd@pengutronix.de>
Content-Language: en-US
Content-ID: <8E36FDC36F6C504D97207C792FF31B4D@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "vkoul@kernel.org" <vkoul@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gMjAxOS0wNS0yNyBhdCAxMTowNSArMDIwMCwgU2FzY2hhIEhhdWVyIHdyb3RlOg0KPiBPbiBN
b24sIE1heSAyNywgMjAxOSBhdCAwNDo1MToxN1BNICswODAwLCB5aWJpbi5nb25nQG54cC5jb20g
d3JvdGU6DQo+ID4gDQo+ID4gRnJvbTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPg0K
PiA+IA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBmc2xfZWRtYV9kdF9p
ZHNbXSA9IHsNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLHZmNjEwLWVkbWEiLCAuZGF0YSA9
ICh2b2lkICopdjEgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtZWRtYSIs
IC5kYXRhID0gKHZvaWQgKil2MyB9LA0KPiA+ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+IFBsZWFz
ZSBwdXQgYSBzdHJ1Y3QgdHlwZSBiZWhpbmQgdGhlIC5kYXRhIHBvaW50ZXIgc28gdGhhdCB5b3Ug
Y2FuDQo+IGNvbmZpZ3VyZS4uLg0KQnV0IGN1cnJlbnQgb25seSB2ZXJzaW9uIG5lZWRlZCwgc28g
SSBnaXZlIHVwIHN0cnVjdCBkZWZpbmUuLi4uDQo+IA0KPiA+IA0KPiA+ICt9Ow0KPiA+ICtNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBmc2xfZWRtYV9kdF9pZHMpOw0KPiA+ICsNCj4gPiBAQCAtMjE4
LDYgKzI3MiwyMiBAQCBzdGF0aWMgaW50IGZzbF9lZG1hX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPiDCoAlmc2xfZWRtYV9zZXR1cF9yZWdzKGZzbF9lZG1hKTsN
Cj4gPiDCoAlyZWdzID0gJmZzbF9lZG1hLT5yZWdzOw0KPiA+IMKgDQo+ID4gKwlpZiAoZnNsX2Vk
bWEtPnZlcnNpb24gPT0gdjMpIHsNCj4gPiArCQlmc2xfZWRtYS0+ZG1hbXV4X25yID0gMTsNCj4g
Li4udGhpbmdzIGxpa2UgdGhpcy4uLg0KWWVzLCBkbWFtdXhfbnIgY291bGQgYmUgbW92ZWQgdG8g
c3RydWN0IGF0IGxlYXN0Lg0KPiANCj4gPiANCj4gPiBAQCAtMjY0LDcgKzMzNCwxMSBAQCBzdGF0
aWMgaW50IGZzbF9lZG1hX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gPiDCoAl9DQo+ID4gwqANCj4gPiDCoAllZG1hX3dyaXRlbChmc2xfZWRtYSwgfjAsIHJlZ3Mt
PmludGwpOw0KPiA+IC0JcmV0ID0gZnNsX2VkbWFfaXJxX2luaXQocGRldiwgZnNsX2VkbWEpOw0K
PiA+ICsNCj4gPiArCWlmIChmc2xfZWRtYS0+dmVyc2lvbiA9PSB2MykNCj4gPiArCQlyZXQgPSBm
c2xfZWRtYTJfaXJxX2luaXQocGRldiwgZnNsX2VkbWEpOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCXJl
dCA9IGZzbF9lZG1hX2lycV9pbml0KHBkZXYsIGZzbF9lZG1hKTsNCj4gLi4uYW5kIHRoaXMgb25l
IGluIHRoYXQgc3RydWN0IHJhdGhlciB0aGFuIGxpdHRlcmluZyB0aGUgY29kZSBtb3JlDQo+IGFu
ZA0KPiBtb3JlIHdpdGggc3VjaCB2ZXJzaW9uIHRlc3RzLg0KWWVzLCBzdWNoIGlycSBzZXR1cCBm
dW5jdGlvbiBjb3VsZCBiZSBtb3ZlZCB0byBzdHJ1Y3QsIHRodXMsIG5vIHZlcnNpb24NCnRlc3Qg
aW4gdGhpcyBmaWxlLiBXaWxsIHJlZmluZSBpdCBpbiB2My4NCj4gDQo+IFNhc2NoYQ0KPiA=
