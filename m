From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Mon, 11 Feb 2019 22:22:07 +0000
Message-ID: <1549923727.3075.103.camel@impinj.com>
References: <20190107132226.16216-1-stefan@agner.ch>
         <20190107132226.16216-2-stefan@agner.ch>
         <1549573243.3075.72.camel@impinj.com> <20190211012305.GA21496@dragon>
         <1549916056.3075.102.camel@impinj.com>
         <CAOMZO5BrTLyg7Q51tPcHbN8S2VmA4HAENOVzNhw+Yx7Nniz3Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BrTLyg7Q51tPcHbN8S2VmA4HAENOVzNhw+Yx7Nniz3Gg@mail.gmail.com>
Content-Language: en-US
Content-ID: <C92860F19D57624E88286F1F866A4B77@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTAyLTExIGF0IDE5OjM0IC0wMjAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBIaSBUcmVudCwNCj4gDQo+IE9uIE1vbiwgRmViIDExLCAyMDE5IGF0IDY6NDQgUE0gVHJlbnQg
UGllcGhvIDx0cGllcGhvQGltcGluai5jb20+IHdyb3RlOg0KPiANCj4gPiBJJ3ZlIGhhZCBtb3Jl
IHRpbWUgdG8gdGVzdC4NCj4gPiANCj4gPiBXaXRob3V0IERNQSwgSSBjYW4gcmVsb2FkIG15IEZQ
R0EgaHVuZHJlZHMgb2YgdGltZXMgYW5kIGdldCBkYXlzIG9mDQo+ID4gdXB0aW1lIHVzaW5nIGxp
bnV4LW5leHQuDQo+ID4gDQo+ID4gV2l0aCBETUEsIGxvYWRpbmcgaXMgdW5yZWxpYWJsZS4gIFRo
ZSBoaWdoZXIgdGhlIFNQSSBzcGVlZCwgdGhlIGxlc3MNCj4gPiByZWxpYWJsZSBpdCBpcy4gIFVu
Zm9ydHVuYXRlbHksIGl0J3MgaGFyZCB0byBkdXBsaWNhdGUgdGhlIHByb2JsZW0gd2l0aA0KPiA+
IGEgc21hbGwgYW1vdW50IG9mIGRhdGEsIGFuZCB3aXRoIGEgbGFyZ2UgYW1vdW50IG9mIGRhdGEg
SSBjYW4ndCBleGFtaW5lDQo+ID4gaXQgaW4gZGVwdGggZW5vdWdoIHRvIGRldGVybWluZSBpZiB0
aGUgcHJvYmxlbSBpcyByZWxhdGVkIHRvIFNQSSBidXMNCj4gPiB0aW1pbmcgb3IgSU1YIHNETUEg
c2VuZGluZyB0aGUgd3JvbmcgYnl0ZXMgdG8gdGhlIHNwaSBjb250cm9sbGVyLg0KPiA+IA0KPiA+
IFVzaW5nIERNQSB3aXRoIFNQSSBjYXVzZXMga2VybmVsIHBhbmljcy4gIE5vdCBhbHdheXMgaW1t
ZWRpYXRlbHksIGJ1dA0KPiA+IGFmdGVyIHVzaW5nIERNQSBpdCdzIGEgc21hbGxlciBvZiBtaW51
dGVzIGJlZm9yZSBzb21ldGhpbmcgY3Jhc2hlcy4NCj4gPiBUaGUgYmFja3RyYWNlcyBhcmUgYWxs
IG92ZXIgdGhlIHBsYWNlIGFuZCBkb24ndCB1c3VhbGx5IHBvaW50IGJhY2sgaW50bw0KPiA+IFNQ
SS4gIEl0IGRvZXMgc2VlbSBsaWtlIHRoZXkgdXN1YWxseSBoaXQgc29tZXRoaW5nIGhhcyBhbGxv
Y2F0ZWQgb3IgaXMNCj4gPiBhbGxvY2F0aW5nIERNQSBtZW1vcnkuDQo+IA0KPiBEaWQgeW91IHRl
c3Qgd2l0aCBhbiBleHRlcm5hbCBTRE1BIGZpcm13YXJlIG9yIHdpdGggdGhlIFJPTSBTRE1BIGZp
cm13YXJlPw0KPiANCj4gSnVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpZiB0aGUgU0RNQSBmaXJt
d2FyZSBwbGF5cyBhIHJvbGUgb24gdGhpcw0KPiBiZWhhdmlvciBvciBub3QuDQoNClRoZSBST00g
ZmlybXdhcmUgb25seS4=
