From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 05/12] Document: dt: binding: imx: update pinctrl doc
 for imx6sll
Date: Tue, 17 Jan 2017 06:35:25 +0000
Message-ID: <AM3PR04MB530F532D867C08824DADDC9877C0@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-6-git-send-email-ping.bai@nxp.com>
 <CACRpkdYUME8K+JusA0ORRKqxyBuhDdyei8eg7UZbHidKw9=bQw@mail.gmail.com>
 <AM3PR04MB5304992095753B761E66A9A87640@AM3PR04MB530.eurprd04.prod.outlook.com>
 <CACRpkdYTpEHyzBY-mA4YUsj=xt46Pibka3-4VHwUXosfgbgp1Q@mail.gmail.com>
 <AM3PR04MB530A88C5C0E7C6AD2C59B9E87790@AM3PR04MB530.eurprd04.prod.outlook.com>
 <CACRpkda1a4+yOrzBnKs6J84PS0StwQ68gHxDub_u7i5ofU9s7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CACRpkda1a4+yOrzBnKs6J84PS0StwQ68gHxDub_u7i5ofU9s7w@mail.gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>
List-Id: devicetree@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzEyXSBEb2N1bWVudDogZHQ6IGJpbmRpbmc6IGlt
eDogdXBkYXRlIHBpbmN0cmwgZG9jDQo+IGZvciBpbXg2c2xsDQo+IA0KPiBPbiBUaHUsIEphbiAx
MiwgMjAxNyBhdCAzOjU3IEFNLCBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+IHdyb3RlOg0K
PiANCj4gPiBBbm90aGVyIHRoaW5nIGlzIHRoYXQgd2UgY2FuIHVzZSBhIHBpbnMtdG9vbCBwcm9n
cmFtIGRldmVsb3BlZCBieSBOWFANCj4gPiB0byAgZ2VuZXJhdGUgdGhlIHBpbmN0cmwgY29uZmln
dXJhdGlvbiBjb2RlIHRoYXQgY2FuIGJlIHVzZWQgZGlyZWN0bHkNCj4gPiBpbiBkdHMuIFRoaXMg
dGlueSBwcm9ncmFtIGNhbiBhdm9pZCBwaW4gZnVuY3Rpb24gY29uZmxpY3QuIEFzIG9uIGkuTVgs
DQo+ID4gdGhlcmUgYXJlIHNvIG1heSBwaW5zLCBlYWNoIHBpbiBjYW4gYmUgdXNlZCBmb3IgdXAg
OCAgZnVuY3Rpb24uDQo+ID4gQ29uZmlndXJpbmcgdGhlIHBpbnMgaXMgYSB0aW1lLWNvbnN1bWlu
ZyB3b3JrLiAgVGhpcyB0b29scyBpcyB2ZXJ5IHVzZWZ1bCBmb3INCj4gY3VzdG9tZXIgdG8gZ2Vu
ZXJhdGUgdGhlIGR0cyBjb2RlLg0KPiANCj4gSSB1bmRlcnN0YW5kLCBidXQgZXZlcnkgc2lsaWNv
biB2ZW5kb3IgaGFzIHN1Y2ggYSB0b29sLCBhbGwgYXJlIGRpZmZlcmVudCwNCj4gcHJvcHJpZXRh
cnkgYW5kIHVuZnJpZW5kbHkgdG8gcHJvZ3JhbW1lcnMgYW5kIG9wZW4gc291cmNlIGRldmVsb3Bl
cnMsIHdobw0KPiBuZWVkIHRvIHVuZGVyc3RhbmQgaG93IHRoZSBoYXJkd2FyZSBpcyB3b3JraW5n
IHdpdGhvdXQgbWFnaWMgdG9vbHMgYW5kDQo+IHNlY3JldCBkYXRhIHNoZWV0cyB0byBmaXggYnVn
cy4NCj4gDQo+IEZvciB0aGUgcGVvcGxlIHdvcmtpbmcgd2l0aCBtYWludGFpbmluZyB0aGUgY29k
ZSBpdCBpcyBwYXJhbW91bnQgdGhhdCBEVFMgZmlsZXMNCj4gYXJlIHNlbGYtZGVzY3JpcHRpdmUu
DQo+IA0KDQpPSy4gIFRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gIEFkZGluZyBnZW5lcmljLXBp
bmNvbmYgaW4gaW14IHBpbmN0cmwgbmVlZHMgc29tZSB0aW1lDQp0byBmaW5pc2ggYW5kIHRoZSBs
ZWdhY3kgbWV0aG9kIHN0aWxsIG5lZWQgYmUgaGVyZSBldmVuIGlmIGdlbmVyaWMtcGluY29uZiBp
cyBhZGRlZC4gDQpEbyB5b3UgcGxhbiB0byBwaWNrIHRoaXMgbGVnYWN5IGJpbmRpbmcgcGF0Y2gg
Zm9yIG5vdz8NCg0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K
