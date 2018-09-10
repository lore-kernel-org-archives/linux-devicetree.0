Return-Path: <SRS0=5mrQ=LY=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Date: Mon, 10 Sep 2018 17:20:41 +0000
Message-ID: 
 <TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
 <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
 <TY1PR01MB156202DC354E70F1C8C5B18A8A090@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <c16b82c0-e675-8f86-19e6-75cb5995813b@linaro.org>
 <CAMuHMdX9nXYan-m14k6h7OU1UCGW_irDLvMMi==dnM0cdUR_nA@mail.gmail.com>
 <c4bd550f-5319-9d92-a30a-1d12fc9bbcab@linaro.org>
 <CAMuHMdUs-YNQk1wmbqQvz_n9xq04=gkyL1uBJdg9ExA9Lmg5uw@mail.gmail.com>
 <a160b76b-8dca-81e8-e958-d8b92bdc8928@linaro.org>
 <CAMuHMdV3Ai+CLHBJ_GH9d=JN0cmiaQT3eSfNGRgiiMffgK7stg@mail.gmail.com>
 <ba334f02-ac37-0908-ec0c-da8a6459fab4@linaro.org>
 <TYXPR01MB1568B71126AB4A2BDB78BF1F8A000@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
In-Reply-To: 
 <CAL_JsqJ84FW8a8eaHPsJAM9R3tYVzOJxp7=Fq+xWzBPVV03fhg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

T24gTW9uZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMTgsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+IFRo
ZSBjdXJyZW50IE9TVE0gZHJpdmVyIHVzZXMgVElNRVJfT0ZfREVDTEFSRSBhbmQgdGhhdCBiYXNp
Y2FsbHkgbWVhbnMNCj4gPiBpdCB3aWxsIG5ldmVyIHdvcmsgd2l0aCBteSBuZXcgU29DLg0KPiA+
DQo+ID4gRm9yIG5vdywgY2FuIEkgY2hhbmdlIHRoZSBkcml2ZXIgdG8gcmVnaXN0ZXIgYSBzdGFu
ZGFyZCBwbGF0Zm9ybSBkcml2ZXINCj4gPiBpbiBzdWJzeXNfaW5pdGNhbGwgbGlrZSB0aGUgb3Ro
ZXIgUmVuZXNhcyB0aW1lciBkcml2ZXJzPw0KPiANCj4gSSdtIGNvbmZ1c2VkIGhvdyB0aGlzIGNh
biBldmVuIHdvcmsgYXMgYW4gaW5pdGNhbGwuIFRoZSB3aG9sZSByZWFzb24NCj4gKl9PRl9ERUNM
QVJFIGV4aXN0cyBpcyBmb3IgdGhpbmdzIHRoYXQgaGF2ZSB0byBiZSBzZXR1cCBiZWZvcmUNCj4g
aW5pdGNhbGxzLg0KDQpJIHdyb3RlIGEgbG9uZyBleHBsYW5hdGlvbiBvZiB0aGUgaXNzdWUsIGJ1
dCB0aGUgc3VtbWFyeSBpczoNCg0KVGhlIHRpbWVyICh3aGljaCBpcyBjdXJyZW50bHkgdXNpbmcg
VElNRVJfT0ZfREVDTEFSRSkgY2FuJ3Qgc3RhcnQgdXAgDQp1bnRpbCB0aGUgY2xvY2tzIGFyZSBz
ZXQgdXAgYmVjYXVzZSBvZl9jbGtfZ2V0IGZhaWxzKCkuDQoNCkJ1dCwgdGhlIGNsb2NrIGRyaXZl
ciBpcyBhIHBsYXRmb3JtIGRyaXZlciB0aGF0IGlzIG5vdCBzdGFydGVkIHVudGlsIA0Kc3Vic3lz
X2luaXRjYWxsLg0KDQpTbywgdW5sZXNzIHlvdSBoYXZlIGEgY2xvY2sgZHJpdmVyIHdpdGggQ0xL
X09GX0RFQ0xBUkUsIHlvdSBjYW4ndCB1c2UNCmEgdGltZXIgZHJpdmVyIHdpdGggYSBUSU1FUl9P
Rl9ERUNMQVJFIGRyaXZlci4NCg0KQW5kLCB0aGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIGEgZGVm
ZXJyZWQgcHJvYmUgZm9yIHRpbWVyIGRyaXZlcnMgDQpkZWNsYXJlZCB3aXRoIElNRVJfT0ZfREVD
TEFSRS4NCg0KQ2hyaXMNCg0K
