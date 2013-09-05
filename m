From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 5 Sep 2013 04:25:39 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com> <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com> <20130904113322.GA5859@sirena.org.uk>
 <20130905014350.GA2261@gmail.com>
 <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com>
 <20130905020435.GA3970@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130905020435.GA3970@gmail.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Huang Shijie <shijie8@gmail.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "b32955@freescale.com" <b32955@freescale.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgU2hpamllLA0KDQo+IA0KPiA+IEhlbGxvIEh1YW5nLA0KPiA+DQo+ID4gPj4gSW4gd2hhdCB3
YXkgZG9lcyB0aGUgY29udHJvbGxlciBkcml2ZXIgZGVwZW5kIG9uIHRob3NlIGNoYW5nZXM/DQo+
ID4gPiBUaGlzIGRyaXZlciBuZWVkcyB0aGUgc3BpIG5vciBjb21tYW5kIHRvIGZpbGwgdGhlIExV
VCByZWdpc3Rlciwgc3VjaCBhcw0KPiA+ID4gT1BDT0RFX1dSRU4oMHgwNiksIHNvIHRoZSBwYXRj
aCAxIG1vdmVzIHRoZSBzcGkgbm9yIGNvbW1hbmQgdG8gYQ0KPiBzZXByYXRlDQo+ID4gPiBoZWFk
ZXIgc3BpLW5vci5oLCBhbmQgdGhpcyBkcml2ZXIgaW5jbHVkZXMgdGhpcyBuZXcgaGVhZGVyLg0K
PiA+ID4NCj4gPiBUaGVuIHNvbWUgcXVlc3Rpb25zIGNvbWUgdXA6DQo+ID4gLSBXaHkgZG9lcyB0
aGUgc3BpIGNvbnRyb2xsZXIgbmVlZCB0byBrbm93IHRoaXM/DQo+IFRoZSBoYXJkd2FyZSB3b3Jr
cyBpbiB0aGlzIHdheS4NCj4gPiAtIFdoYXQgaXMgdGhpcyBMVVQgcmVnaXN0ZXIgYXQgYWxsPw0K
PiBQbGVhc2Ugc2VlIHRoZSBwYXRjaCAxLg0KPiA+IC0gV2hhdCBoYXBwZW5zIGlmIHNvbWV0aGlu
ZyBkaWZmZXJlbnQgdGhhdCBhIGZsYXNoIGlzIGNvbm5lY3RlZCBhbmQNCj4gPiAgICB0aGUgZGF0
YSBzdGFydHMgd2l0aCBvbmUgb2YgdGhlc2Ugb3Bjb2Rlcz8NCj4gU3VibWl0IGEgbmV3IHBhdGNo
IHRvIGZpeCBpdC4NCj4gDQpUaGlzIGlzIG5vdCB0aGUgY29ycmVjdCBhcHByb2FjaCwgYmVjYXVz
ZSBmb3IgZXZlcnkgTk9SIGZsYXNoIGRldmljZQ0KdXNlciBuZWVkcyB0byBzdWJtaXQgYSBwYXRj
aCB0byBwb3B1bGF0ZSB0aGVzZSBMVVQgd2l0aCBDTUQsIE9QRVJBTkQNCmFuZCBEVU1NWSB2YWx1
ZXMgc3BlY2lmaWMgdG8gdGhhdCBOT1IgZGV2aWNlIGludG8gdGhlc2UgaGVhZGVyIGZpbGVzLg0K
QXMgdGhlIHN1cHBvcnRlZCBOT1IgZGV2aWNlIGxpc3QgZ3Jvd3MsIHRoZSBoZWFkZXIgZmlsZSB3
b3VsZCBiZWNvbWUNCnVubWFuYWdlYWJsZSBhbmQgY2x1dHRlcmVkLg0KDQpJIHdvdWxkIHJhdGhl
ciBzdWdnZXN0IHRvIGdldCB0aGVzZSB2YWx1ZXMgZnJvbSBEVCBiaW5kaW5ncyBzcGVjaWZpYyB0
byANCnlvdXIgZnNsLXFzcGktY29udHJvbGxlci4gVGhpcyB3YXkgeW91IHdvdWxkIHByb3ZpZGUg
c2NhbGFiaWxpdHkgd2l0aG91dA0KYWZmZWN0aW5nIG90aGVyIGZyYW1ld29yay4gVGhpcyBzaG91
bGQgYWxzbyBoZWxwIHlvdSB0byBrZWVwIHlvdXIgDQpNVEQgZHJpdmVyIGluZGVwZW5kZW50IG9m
IFFTUEktY29udHJvbGxlciBkcml2ZXIuDQoNCldpdGggcmVnYXJkcywgcGVrb24NCg==
