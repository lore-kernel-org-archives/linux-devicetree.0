Return-Path: <SRS0=jpoJ=K7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0081.outbound.protection.outlook.com ([104.47.1.81]:42698
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731354AbeHPLQq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Aug 2018 07:16:46 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: RE: [v7 3/7] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Date: Thu, 16 Aug 2018 08:19:54 +0000
Message-ID: <AM6PR0402MB3382183FB4BF9107E5C7D07BE23E0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
References: <20180725112919.31340-1-wen.he_1@nxp.com>
 <20180725112919.31340-3-wen.he_1@nxp.com>
 <AM6PR0402MB338230FB60522E900AFF2423E23F0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
 <20180816043900.GA3687@vkoul-mobl>
In-Reply-To: <20180816043900.GA3687@vkoul-mobl>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Peng Ma <peng.ma@nxp.com>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG1hZW5naW5lLW93bmVy
QHZnZXIua2VybmVsLm9yZw0KPiBbbWFpbHRvOmRtYWVuZ2luZS1vd25lckB2Z2VyLmtlcm5lbC5v
cmddIE9uIEJlaGFsZiBPZiBWaW5vZA0KPiBTZW50OiAyMDE45bm0OOaciDE25pelIDEyOjM5DQo+
IFRvOiBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+IENjOiBkbWFlbmdpbmVAdmdlci5rZXJu
ZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IEppYWZlaSBQYW4NCj4gPGppYWZlaS5wYW5A
bnhwLmNvbT47IFBlbmcgTWEgPHBlbmcubWFAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFt2NyAz
LzddIGRtYWVuZ2luZTogZnNsLXFkbWE6IEFkZCBxRE1BIGNvbnRyb2xsZXIgZHJpdmVyIGZvcg0K
PiBMYXllcnNjYXBlIFNvQ3MNCj4gDQo+IE9uIDE1LTA4LTE4LCAwNjo0NiwgV2VuIEhlIHdyb3Rl
Og0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9t
OiBXZW4gSGUgW21haWx0bzp3ZW4uaGVfMUBueHAuY29tXQ0KPiA+ID4gU2VudDogMjAxOOW5tDfm
nIgyNeaXpSAxOToyOQ0KPiA+ID4gVG86IHZrb3VsQGtlcm5lbC5vcmc7IGRtYWVuZ2luZUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gPiA+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBMZW8gTGkNCj4gPiA+IDxsZW95YW5nLmxpQG54cC5jb20+OyBKaWFmZWkg
UGFuIDxqaWFmZWkucGFuQG54cC5jb20+OyBKaWFoZW5nIEZhbg0KPiA+ID4gPGppYWhlbmcuZmFu
QG54cC5jb20+OyBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+ID4gPiBTdWJqZWN0OiBbdjcg
My83XSBkbWFlbmdpbmU6IGZzbC1xZG1hOiBBZGQgcURNQSBjb250cm9sbGVyIGRyaXZlcg0KPiA+
ID4gZm9yIExheWVyc2NhcGUgU29Dcw0KPiA+ID4NCj4gPiA+IE5YUCBRdWV1ZSBETUEgY29udHJv
bGxlcihxRE1BKSBvbiBMYXllcnNjYXBlIFNvQ3Mgc3VwcG9ydHMgY2hhbm5lbA0KPiA+ID4gdmly
dHVhbGxpemF0aW9uIGJ5IGFsbG93aW5nIERNQSBqb2JzIHRvIGJlIGVucXVldWVkIGludG8gZGlm
ZmVyZW50DQo+ID4gPiBjb21tYW5kIHF1ZXVlcy4NCj4gPiA+DQo+ID4NCj4gPiBIaSBWaW5vZCwN
Cj4gPg0KPiA+IERvIHlvdSBoYXZlIGFueSBvdGhlciBjb21tZW50cyBmb3IgdGhpcyBwYXRjaD8N
Cj4gPiBJZiBub3QsIGNhbiB3ZSBtZXJnZSBpdCB0byB1cHN0cmVhbSBub3c/DQo+IA0KPiBJIGRv
bid0IGhhdmUgdGhpcyBpbiBteSBxdWV1ZSwgc28gY2FuIHlvdSBwbGVhc2UgcmVzZW5kIHRoaXMg
YWZ0ZXIgbWVyZ2UNCj4gd2luZG93IGNsb3Nlcy4NCj4gDQo+IFRoYW5rcw0KDQpPSywgc28gSSBu
ZWVkIHJlc2VuZCBhbGwgb2YgcGF0Y2gsIHJpZ2h0PyANCg0KPiAtLQ0KPiB+Vmlub2QNCg==
