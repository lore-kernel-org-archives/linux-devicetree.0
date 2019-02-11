From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Mon, 11 Feb 2019 20:14:16 +0000
Message-ID: <1549916056.3075.102.camel@impinj.com>
References: <20190107132226.16216-1-stefan@agner.ch>
         <20190107132226.16216-2-stefan@agner.ch>
         <1549573243.3075.72.camel@impinj.com> <20190211012305.GA21496@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211012305.GA21496@dragon>
Content-Language: en-US
Content-ID: <C8C20BCD9316084191ED9ADADA43B63E@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTAyLTExIGF0IDA5OjIzICswODAwLCBTaGF3biBHdW8gd3JvdGU6DQo+IE9u
IFRodSwgRmViIDA3LCAyMDE5IGF0IDA5OjAwOjQ0UE0gKzAwMDAsIFRyZW50IFBpZXBobyB3cm90
ZToNCj4gPiBPbiBNb24sIDIwMTktMDEtMDcgYXQgMTQ6MjIgKzAxMDAsIFN0ZWZhbiBBZ25lciB3
cm90ZToNCj4gPiA+IEFsbG93IHRvIHVzZSBETUEgZm9yIFNQSSBieSBhZGRpbmcgdGhlIGFwcHJv
cHJpYXRlIERNQSBwcm9wZXJpdGVzDQo+ID4gPiB0byB0aGUgZWNzcGkgbm9kZXMuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPg0KPiA+
ID4gDQo+ID4gVGhlcmUncyBhbiBpbnRlcmVzdGluZyB0aGluZyB0aGF0IGhhcHBlbnMgd2hlbiBE
TUEgaXMgdXNlZC4gIFRoZSBTUEkNCj4gPiBjbG9jayBjaGFuZ2VzLiAgSW5zdGVhZCBvZiBjeWNs
aW5nIGNvbnRpbnVvdXNseSBmb3IgdGhlIGVudGlyZQ0KPiA+IHRyYW5zZmVyLCBpdCBpbnN0ZWFk
IGNsb2NrcyBvdXQgOCBiaXRzLCB0aGVuIHBhdXNlcyBmb3IgNCBiaXQgdGltZXMsDQo+ID4gdGhl
biB0aGUgbmV4dCBieXRlLCBldGMuICBTbyBpdCdzIGEgbmV0IG9mIGFib3V0IDUwJSBzbG93ZXIu
ICBUaGUgcGF1c2UNCj4gPiBiZXR3ZWVuIGJ5dGVzIHNjYWxlcyB3aXRoIHNwaSBmcmVxdWVuY3kg
dG8gYWx3YXlzIGJlIGFib3V0IDQgYml0cy4NCj4gPiANCj4gPiBJIHRoaW5rIERNQSBvbiBpbXgg
bm90IGJlIHJlYWR5IGZvciBwcmltZSB0aW1lIHlldC4NCj4gDQo+IEkgZHJvcHBlZCBib3RoIHBh
dGNoZXMgZnJvbSBteSB0cmVlLg0KPiANCg0KSSd2ZSBoYWQgbW9yZSB0aW1lIHRvIHRlc3QuDQoN
CldpdGhvdXQgRE1BLCBJIGNhbiByZWxvYWQgbXkgRlBHQSBodW5kcmVkcyBvZiB0aW1lcyBhbmQg
Z2V0IGRheXMgb2YNCnVwdGltZSB1c2luZyBsaW51eC1uZXh0Lg0KDQpXaXRoIERNQSwgbG9hZGlu
ZyBpcyB1bnJlbGlhYmxlLiAgVGhlIGhpZ2hlciB0aGUgU1BJIHNwZWVkLCB0aGUgbGVzcw0KcmVs
aWFibGUgaXQgaXMuICBVbmZvcnR1bmF0ZWx5LCBpdCdzIGhhcmQgdG8gZHVwbGljYXRlIHRoZSBw
cm9ibGVtIHdpdGgNCmEgc21hbGwgYW1vdW50IG9mIGRhdGEsIGFuZCB3aXRoIGEgbGFyZ2UgYW1v
dW50IG9mIGRhdGEgSSBjYW4ndCBleGFtaW5lDQppdCBpbiBkZXB0aCBlbm91Z2ggdG8gZGV0ZXJt
aW5lIGlmIHRoZSBwcm9ibGVtIGlzIHJlbGF0ZWQgdG8gU1BJIGJ1cw0KdGltaW5nIG9yIElNWCBz
RE1BIHNlbmRpbmcgdGhlIHdyb25nIGJ5dGVzIHRvIHRoZSBzcGkgY29udHJvbGxlci4NCg0KVXNp
bmcgRE1BIHdpdGggU1BJIGNhdXNlcyBrZXJuZWwgcGFuaWNzLiAgTm90IGFsd2F5cyBpbW1lZGlh
dGVseSwgYnV0DQphZnRlciB1c2luZyBETUEgaXQncyBhIHNtYWxsZXIgb2YgbWludXRlcyBiZWZv
cmUgc29tZXRoaW5nIGNyYXNoZXMuIA0KVGhlIGJhY2t0cmFjZXMgYXJlIGFsbCBvdmVyIHRoZSBw
bGFjZSBhbmQgZG9uJ3QgdXN1YWxseSBwb2ludCBiYWNrIGludG8NClNQSS4gIEl0IGRvZXMgc2Vl
bSBsaWtlIHRoZXkgdXN1YWxseSBoaXQgc29tZXRoaW5nIGhhcyBhbGxvY2F0ZWQgb3IgaXMNCmFs
bG9jYXRpbmcgRE1BIG1lbW9yeS4=
