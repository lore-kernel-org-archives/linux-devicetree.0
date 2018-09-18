Return-Path: <SRS0=t5sK=MA=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
Date: Tue, 18 Sep 2018 11:55:10 +0000
Message-ID: 
 <TY1PR01MB15621E4C1E84A6E3BC4B94CF8A1D0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
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
In-Reply-To: 
 <CAMuHMdWOR91HWNGnQAfkjesg_89=AuxUy0RnE3R7=3=KZ_0Kyg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Mark Brown <broonie@linaro.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFR1ZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOCwgbGludXgtcmVuZXNh
cy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIHdyb3RlOg0KPiA+IEkndmUgY29kZWQgdGhpcyB1
cCBhbmQgaXQgd29ya3MgZmluZS4NCj4gDQo+IFdoaWxlIEkgZG9uJ3QgZG91YnQgdGhpcyB3b3Jr
cyBmaW5lLCB5b3VyIERUIGlzIG5vIGxvbmdlciBkZXNjcmliaW5nDQo+IGhhcmR3YXJlLCBidXQg
YWxzbyBzb2Z0d2FyZSBwb2xpY3kuDQo+IA0KPiBJIHRoaW5rIHRoZSBwcm9wZXIgc29sdXRpb24s
IG1heGltaXppbmcgY29kZSByZXVzZSwgaXMgdG86DQo+ICAgLSBTcGxpdCBvZmYgZWFybHkgY2xv
Y2tzIGZyb20gY3BnX21zc3JfaW5mby5jb3JlX2Nsa3NbXSBhbmQgLm1vZF9jbGtbXQ0KPiBpbnRv
DQo+ICAgICBjcGdfbXNzcl9pbmZvLmVhcmx5X2NvcmVfY2xrc1tdIGFuZCAuZWFybHlfbW9kX2Ns
a3NbXSwNCg0KVGhpcyBpcyB3aGVyZSBJIGdvdCBpbnRvIHRyb3VibGUuDQpJIG9yaWdpbmFsbHkg
anVzdCB0cmllZCB0byByZWdpc3RlciBhbGwgdGhlIGNvcmUgY2xvY2tzIGluIHRoZSBlYXJseSAN
CmluaXQuIEJ1dCB0aGVuIEkgaGFkIGlzc3VlcyB3aGVuIHRoZSBwbGF0Zm9ybSBwcm9iZSBjYW1l
IGluIGxhdGVyIGFuZCANCndhbnRlZCB0byBkbyB0aGUgc2FtZSB0aGluZy4NCg0KRm9yIGV4YW1w
bGUsIHRoZSBjbG9jayB0cmVlIGZvciBPU1RNIGlzOg0KICBFWFRBTCAtPiBQTEwgLT4gUDFDIC0+
IE9TVE0NCg0KT2YgY291cnNlIHRoZXJlIGFyZSBvdGhlciBub24tZWFybHkgbW9kdWxlIHRoYXQg
dXNlIHRoZSBQMUMgY2xvY2suDQoNCkRvIHlvdSB0aGluayBpdCB3b3VsZCBiZSBPSyBpZiBJIGp1
c3QgcmVnaXN0ZXJzIGFsbCB0aGUgY29yZSBjbG9jayBpbiANCmVhcmx5IGluaXQsIHRoZW4ganVz
dCBwYXNzIGJhY2sgdGhlIGNsayBwb2ludGVycyB0byBjcGdfbXNzcl9wcm9iZSBsYXRlciANCih0
byBsZXQgdGhlIHBsYXRmb3JtIGRyaXZlciBtYW5hZ2UgdGhlbSk/DQoNCg0KQ2hyaXMNCg0K
