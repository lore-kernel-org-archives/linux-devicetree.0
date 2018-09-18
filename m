Return-Path: <SRS0=t5sK=MA=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Date: Tue, 18 Sep 2018 15:51:52 +0000
Message-ID: 
 <TY1PR01MB1562ED7502A2D183B5A981588A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
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
 <TY1PR01MB15627A875767E1428E6C7DCE8A1A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXy=NXgqc0p5x+dp6u45LkYENNA6mjECwnOYOURE_+yCg@mail.gmail.com>
 <TY1PR01MB1562DB2A1F955F52807F8AC88A1E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWOR91HWNGnQAfkjesg_89=AuxUy0RnE3R7=3=KZ_0Kyg@mail.gmail.com>
 <TY1PR01MB15621E4C1E84A6E3BC4B94CF8A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdV1LvTrf3jw+JMkAC=skxB48--AYm_eJtZJqt9374Sd3w@mail.gmail.com>
 <TY1PR01MB15625BAD12E2CB56AB47ACE88A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVfa1yz=N=KCwXO=4TGGB113mTYqtB=0iYiaQVoTC260Q@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdVfa1yz=N=KCwXO=4TGGB113mTYqtB=0iYiaQVoTC260Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFR1ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOCAxLCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6DQo+ID4gV2hhdCBkbyB5b3Ugc2VlIHRoZSAuZHRzaSBhbmQgLmR0cyBs
b29raW5nIGxpa2U/DQo+IA0KPiBUaGUgcGFydCB1c2luZyBDTEtfT0ZfREVDTEFSRSgpIGlzIG5v
dCBhIHBsYXRmb3JtIGRyaXZlci4gSXQgZG9lcyBub3QNCj4gb3BlcmF0ZSBvbiBhIGRldmljZSAo
c3RydWN0IHBsYXRmb3JtX2RldmljZSksIGJ1dCBvbiBhIGRldmljZSBub2RlDQo+IChzdHJ1Y3QN
Cj4gZGV2aWNlX25vZGUpLiBIZW5jZSBpdCB3b3VsZCBtYXRjaCBhZ2FpbnN0IHRoZSBzYW1lIERU
IG5vZGUsIGJ1dCBtYXAgaXQNCj4gdXNpbmcgb2ZfaW9tYXAoKS4gIFNvIHlvdSBqdXN0IG5lZWQg
dGhlIGV4aXN0aW5nICJyZW5lc2FzLHI3czkyMTAtY3BnLQ0KPiBtc3NyIg0KPiBub2RlLg0KDQpT
by4uLkkgdHJpZWQgdGhhdC4uLmFuZCBpdCBkb2Vzbid0IHdvcmsuDQoNCkJhc2ljYWxseSwgdGhp
czoNCkNMS19PRl9ERUNMQVJFKGNwZ19tc3RwX2Vhcmx5X2Nsa3MsICJyZW5lc2FzLHI3czkyMTAt
Y3BnLW1zc3IiLA0KICAgICAgICAgICAgICAgcnphMl9jcGdfbXNzcl9lYXJseV9pbml0KTsNCg0K
QnV0LCB3aGF0IGhhcHBlbnMgaXMgdGhhdCByemEyX2NwZ19tc3NyX2Vhcmx5X2luaXQgZ2V0cyBj
YWxsZWQgYmVjYXVzZSANCml0IGZpbmQgYSBtYXRjaCBhZ2FpbnN0ICJyZW5lc2FzLHI3czkyMTAt
Y3BnLW1zc3IiLiBCdXQgbGF0ZXIgYWZ0ZXIgDQpjcGdfbXNzcl9pbml0IGdldHMgY2FsbCwgY3Bn
X21zc3JfcHJvYmUgbmV2ZXIgZ2V0cyBjYWxsZWQuIEkgYXNzdW1lIHRoYXQgaXMgDQpiZWNhdXNl
IGRldmljZSAicmVuZXNhcyxyN3M5MjEwLWNwZy1tc3NyIiBoYXMgYWxyZWFkeSBiZWVuIG1hdGNo
ZWQgdG8gYSANCmRyaXZlci4NCg0KDQo+IFBsZWFzZSBoYXZlIGEgbG9vayBhdCBlLmcuICJtZWRp
YXRlayxtdDI3MTItdG9wY2tnZW4iLg0KDQpPbmUgdGhpbmcgSSBkb24ndCB1bmRlcnN0YW5kIGlz
IHRoYXQgaW4gdGhlIGVhcmx5IGluaXQsIGl0IHJlZ2lzdGVycyBhIA0Kb2ZfY2xrX2FkZF9wcm92
aWRlci4gQnV0IHRoZW4gbGF0ZXIgaW4gdGhlIHByb2JlLCBpdCByZWdpc3RlciANCm9mX2Nsa19h
ZGRfcHJvdmlkZXIgYWdhaW4gKG9uIHRoZSBzYW1lIERUIG5vZGUpLiBJIGd1ZXNzIHlvdSBjYW4g
ZG8gdGhhdD8/Pz8NCg0KDQpTbyBJIHNlZSB3aGF0IHRoZSBtZWRpYXRlayBpcyBkb2luZywgYnV0
IEkgY2FuJ3Qgc2VlbSB0byByZXByb2R1Y2UgaXQuIEkNCm11c3QgYmUgbWlzc2luZyBzb21ldGhp
bmcuDQoNCkNocmlzDQoNCg==
