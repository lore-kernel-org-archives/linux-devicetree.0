Return-Path: <SRS0=hgex=M7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50069.outbound.protection.outlook.com ([40.107.5.69]:6432
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726584AbeJSOwe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 19 Oct 2018 10:52:34 -0400
From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
Date: Fri, 19 Oct 2018 06:47:47 +0000
Message-ID: <DB5PR0401MB221330431FEF31D3ABE0C640F3F90@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
         <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
         <DB5PR0401MB221359C5FB8FE3AAA36A3F0BF3F80@DB5PR0401MB2213.eurprd04.prod.outlook.com>
 <05005bca663190ca375e7ddcdc9221f99655010d.camel@buserror.net>
In-Reply-To: <05005bca663190ca375e7ddcdc9221f99655010d.camel@buserror.net>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Scott Wood <oss@buserror.net>, Stephen Boyd <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNjb3R0IFdvb2QgPG9zc0Bi
dXNlcnJvci5uZXQ+DQo+IFNlbnQ6IDIwMTjlubQxMOaciDE55pelIDE0OjI4DQo+IFRvOiBBbmR5
IFRhbmcgPGFuZHkudGFuZ0BueHAuY29tPjsgU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3Jn
PjsNCj4gbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsg
bWFyay5ydXRsYW5kQGFybS5jb207DQo+IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBjbGs6IHFv
cmlxOiBhZGQgdDEwMjMgc29jIHN1cHBvcnQNCj4gDQo+IE9uIFRodSwgMjAxOC0xMC0xOCBhdCAw
MTowMCArMDAwMCwgQW5keSBUYW5nIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+IEZyb206IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiA+
IFNlbnQ6IDIwMTjlubQxMOaciDE35pelIDIzOjI4DQo+ID4gPiBUbzogbXR1cnF1ZXR0ZUBiYXls
aWJyZS5jb207IG9zc0BidXNlcnJvci5uZXQ7IEFuZHkgVGFuZw0KPiA+ID4gPGFuZHkudGFuZ0Bu
eHAuY29tPg0KPiA+ID4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5j
b207DQo+ID4gPiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzNdIGNsazogcW9yaXE6IGFkZCB0
MTAyMyBzb2Mgc3VwcG9ydA0KPiA+ID4NCj4gPiA+IFF1b3RpbmcgQW5keSBUYW5nICgyMDE4LTEw
LTE1IDIzOjE3OjE4KQ0KPiA+ID4gPiBIaSwNCj4gPiA+ID4NCj4gPiA+ID4gQXBwcmVjaWF0ZSBp
ZiB5b3UgY2FuIHRha2UgYSBsb29rIGF0IHRoaXMgcGF0Y2ggc2V0Lg0KPiA+ID4gPg0KPiA+ID4N
Cj4gPiA+IEkgY2FuIHBpY2sgdGhlIGNsayBwYXRjaGVzLCBidXQgbm90IHRoZSBkdHMgYml0cy4g
U291bmQgZ29vZD8NCj4gPg0KPiA+IExldCdzIHNlZSB3aGF0IFNjb3R0IHNheS4NCj4gPg0KPiA+
IEhpIFNjb3R0LA0KPiA+DQo+ID4gRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIGFib3V0IHRoaXMg
cGF0Y2ggc2V0Pw0KPiA+DQo+ID4gRG8geW91IHRoaW5payBpdCBpcyBvayBpZiBTdGVwaGVuIHBp
Y2tzIHVwIHRoZSBjbGsgcGF0Y2ggYW5kIHlvdSBwaWNrDQo+ID4gdXAgdGhlIHJlc3Qgb2YgdHdv
IHBhdGNoZXM/DQo+ID4gT3Igb25lIG9mIHlvdSBBY2tlZCB0aGUgcGF0Y2ggYW5kIHRoZSBvdGhl
ciBvbmUgYXBwbHkgdGhlbSBhbGw/DQo+IA0KPiBJIGNhbiB0YWtlIHRoZSBkdHMgcGF0Y2hlcy4N
Cj4gDQpUaGFua3MgU2NvdHQuIFBsZWFzZSB0YWtlIHRoZSBkdHMgcGF0Y2hlcy4NCg0KSGkgU3Rl
cGhlbiwNClBsZWFzZSB0YWtlIHRoZSBjbGsgcGF0Y2guDQoNClRoYW5rcyB5b3UgYWxsLg0KQlIs
DQpBbmR5DQoNCj4gLVNjb3R0DQoNCg==
