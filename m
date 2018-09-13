Return-Path: <SRS0=0aeE=L3=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Date: Thu, 13 Sep 2018 14:54:19 +0000
Message-ID: 
 <TY1PR01MB15627A875767E1428E6C7DCE8A1A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
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
 <TY1PR01MB15621F2C9CC30B20BF5E09A18A050@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAL_JsqJorfOhuwiRk9vbfZ_6B8s-EM7k+RTJmC4La76NzY5tuw@mail.gmail.com>
 <TY1PR01MB15629984AA415D4F876B86038A040@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <e4b750b4-2e99-ac24-d7aa-db05a6872a8b@linaro.org>
 <CAMuHMdWOc=p-y4cB=8Y5+HRxRdVqXxE7TaSXkcOO9AMaB+1Mqg@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdWOc=p-y4cB=8Y5+HRxRdVqXxE7TaSXkcOO9AMaB+1Mqg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

T24gVGh1cnNkYXksIFNlcHRlbWJlciAxMywgMjAxOCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPiA+ID4gSSB3b25kZXIgdGhleSBqdXN0IGRpZG4ndCBtYWtlIGEgY2xvY2tfaW5pdGNhbGwo
KSBhbmQgdGltZXJfaW5pdGNhbGwoKQ0KPiA+ID4gaW5zdGVhZC4NCj4gPg0KPiA+IFdoYXQgaGFw
cGVucyBpZiB5b3UgcGxhY2UgdGhlIGNsa19pbml0KCkgYmVmb3JlIGJvYXJkX3RpbWVfaW5pdCgp
ID8gaW4NCj4gPiBhcmNoL3NoL2tlcm5lbC90aW1lLmMNCj4gDQo+IE5vdGhpbmcsIGFzIENocmlz
IGlzIHVzaW5nIGFuIEFSTSBwbGF0Zm9ybSA7LSkNCj4gDQo+IFRoZSBjbG9jayBkcml2ZXIgaXMg
ZHJpdmVycy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMsIHdoaWNoIGlzIGENCj4gcGxh
dGZvcm1fZHJpdmVyIHJlZ2lzdGVyZWQgZnJvbSBzdWJzeXNfaW5pdGNhbGwoKS4NCg0KSnVzdCBG
WUksIGZvciB0aGUgaGVjayBvZiBpdCwgSSB0cmllZCBhbmQgaGFja2VkIGluIHJlZ2lzdGVyaW5n
IHRoZSANCmNsb2NrIGRyaXZlciB1c2luZyBDTEtfT0ZfREVDTEFSRSBzaW5jZSB0aGF0IGhhcHBl
bnMgYmVmb3JlIHRoZSANClRJTUVSX09GX0RFQ0xBUkUgdGltZXJzIGFyZSBwcm9iZWQuDQoNCkJ1
dCwgSSBnb3QgdGhpcyByZXN1bHQ6DQoNClsgICAgMC4wMDAwMDBdIERyaXZlciAncmVuZXNhcy1j
cGctbXNzcicgd2FzIHVuYWJsZSB0byByZWdpc3RlciB3aXRoIGJ1c190eXBlICdwbGF0Zm9ybScg
YmVjYXVzZSB0aGUgYnVzIHdhcyBub3QgaW5pdGlhbGl6ZWQuDQoNCg0KQ2hyaXMNCg==
