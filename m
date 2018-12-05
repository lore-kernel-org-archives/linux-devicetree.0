Return-Path: <SRS0=rNTY=OO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:54714
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbeLEH5m (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Dec 2018 02:57:42 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: RE: [PATCH v3 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Date: Wed, 5 Dec 2018 07:57:37 +0000
Message-ID: <VI1PR04MB532787E6EF89EBFAAE052A0C8BA80@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20181127092824.22756-1-peter.chen@nxp.com>
 <20181127092824.22756-5-peter.chen@nxp.com>
 <CAOMZO5CV9Hk5ORnmjOLSZv5bk61nc2Ljq_4vKvRvAvO_F=Fzxg@mail.gmail.com>
 <VI1PR04MB5327E51B366724706028E07E8BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <a081eb16-920a-0ff4-2ae7-7c9efd28668a@kontron.de>
 <CAOMZO5BdzvSNovd15jcijGBMzS_G+5xnmyNBXMH7S3cmwCfKMA@mail.gmail.com>
 <0215e99c-c024-42f6-9dad-4bab70bae193@kontron.de>
In-Reply-To: <0215e99c-c024-42f6-9dad-4bab70bae193@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Fabio Estevam <festevam@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>
List-ID: <devicetree@vger.kernel.org>

IA0KPiBPbiAwNC4xMi4xOCAyMTowMSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToNCj4gPiBIaSBGcmll
ZGVyLA0KPiA+DQo+ID4gT24gVHVlLCBEZWMgNCwgMjAxOCBhdCAxMjozMSBQTSBTY2hyZW1wZiBG
cmllZGVyDQo+ID4gPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4gd3JvdGU6DQo+ID4NCj4g
Pj4gVGhlcmUgYXJlIG1hbnkgb3RoZXIgb3B0aW9uYWwgcHJvcGVydGllcyBmb3IgdGhpcyBkcml2
ZXIgYW5kIGEgbG90IG9mDQo+ID4+IHRoZW0gYXJlIG5vdCBpbiB0aGUgZ2l2ZW4gZXhhbXBsZS4g
TWF5YmUgd2Ugc2hvdWxkIGp1c3Qga2VlcCB0aGUNCj4gPj4gcGluY3RybHMgZm9yIEhTSUMtbW9k
ZSBvdXQgb2YgdGhlIGV4YW1wbGUsIHRvbz8NCj4gPg0KPiA+IEkgYW0ganVzdCB0cnlpbmcgdG8g
bWFrZSBsaWZlIGVhc2llciBmb3IgdGhvc2Ugd2hvIHdhbnQgdG8gdXNlIEhTSUMNCj4gPiBzdXBw
b3J0IHdpdGggY2hpcGlkZWEuDQo+ID4NCj4gPiBDYW4gd2UganVzdCBhZGQgYSByZWFsIGR0cyBz
bmlwcGV0IGV4YW1wbGUgb2YgeW91ciBib2FyZCBpbnRvIHRoZQ0KPiA+IGJpbmRpbmcgZG9jdW1l
bnQ/DQo+IA0KPiBTdXJlLCBoZXJlIGlzIHdoYXQgSSBoYXZlIGluIG15IGR0czoNCj4gDQo+ICZ1
c2JoMiB7DQo+IAlwaW5jdHJsLW5hbWVzID0gImlkbGUiLCAiYWN0aXZlIjsNCj4gCXBpbmN0cmwt
MCA9IDwmcGluY3RybF91c2JoMl9pZGxlPjsNCj4gCXBpbmN0cmwtMSA9IDwmcGluY3RybF91c2Jo
Ml9hY3RpdmU+Ow0KPiAJc3RhdHVzID0gIm9rYXkiOw0KPiAJI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+IAkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gDQo+IAl1c2JuZXQ6IHNtc2NAMSB7DQo+IAkJY29t
cGF0aWJsZSA9ICJ1c2I0MjQsOTczMCI7DQo+IAkJcmVnID0gPDE+Ow0KPiAJfTsNCj4gfTsNCj4g
DQo+IEBQZXRlcjogQ2FuIHlvdSBhZGQgdGhpcyBhcyBhIHNlY29uZCBleGFtcGxlIHRvIHRoZSBi
aW5kaW5nIGRvY3VtZW50YXRpb24/DQo+IA0KDQpTbywgdGhlcmUgYXJlIHR3byBleGFtcGxlcyBh
dCBiaW5kaW5nLWRvYywgb25lIGZvciBub3JtYWwsIG9uZSBmb3IgSFNJQz8gRmFiaW8sIGRvIHlv
dQ0KbWVhbiB0aGF0PyBJZiBEVCBtYWludGFpbmVyIGFncmVlcyBpdCB0b28sIEkgd2lsbCBhZGQg
aXQuDQoNClBldGVyDQo=
