From: Robin Gong <yibin.gong@nxp.com>
Subject: Re: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Wed, 4 Jul 2018 01:42:54 +0000
Message-ID: <1530697336.15665.43.camel@nxp.com>
References: <CAOMZO5BjOEGWv2dC-bp0BYHq+PhLssEKic+o7ock8_1Dobd=sQ@mail.gmail.com>
         <AM3PR04MB131507901BFEE1A5E426EECBF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
         <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
         <AM3PR04MB1315E7AED2BCE2265E6C443DF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
         <CAOMZO5D8v4KM9S4ooHTDbA+vc8BZN_eO_wDuOPA+8Hcq-SmLDw@mail.gmail.com>
         <AM3PR04MB1315C7C7CFF990615732FFBCF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
         <CAOMZO5AM5VRS7UiWuvAQ8vvTB8OM+iwofuYrbsL_yB9e0Z9Kyg@mail.gmail.com>
         <AM3PR04MB13155B8D567ABEF7EF03249AF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
         <CAOMZO5BdtxKjQge5ONpnjr1yNVeTJf4u8Gh-fPqpHz7G9ipOTg@mail.gmail.com>
         <1530526335.15665.13.camel@nxp.com> <20180703053843.GC4348@dragon>
         <AM3PR04MB131542D42FCD798FDBBA54BFF5420@AM3PR04MB1315.eurprd04.prod.outlook.com>
         <CAOMZO5BY99f5jjU+73=8WjqwBKr_q2S1mvx90URZUBkgOVn9YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BY99f5jjU+73=8WjqwBKr_q2S1mvx90URZUBkgOVn9YA@mail.gmail.com>
Content-Language: en-US
Content-ID: <2B891B2205B58049928F6419B42AAB82@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "festevam@gmail.com" <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24g5LqMLCAyMDE4LTA3LTAzIGF0IDA4OjEwIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBIaSBBbnNvbiwNCj4gDQo+IE9uIFR1ZSwgSnVsIDMsIDIwMTggYXQgNDo0NCBBTSwgQW5zb24g
SHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiANCj4gPiBJdCBp
cyBOT1QgZWFzeSB0byBpZGVudGlmeSB3aGljaCBzd2l0Y2ggaXMgY3JpdGljYWwgb3IgTk9ULCBh
bmQNCj4gPiBkaWZmZXJlbnQgcGxhdGZvcm1zDQo+ID4gaGF2ZSBkaWZmZXJlbnQgYm9hcmQgZGVz
aWduLCBpdCB3aWxsIGludHJvZHVjZSBtYW55IHBsYXRmb3JtDQo+ID4gc3BlY2lmaWVkIGNvZGUs
IHNvIEkgdGhpbmsNCj4gPiBqdXN0IHJldmVydCB0aGUgcGZ1emUxMDAgc3dpdGNoIGVuYWJsZS9k
aXNhYmxlIHBhdGNoIHNob3VsZCBiZSBPSw0KPiA+IGZvciBub3cuDQo+IEkgaGF2ZSBzZW50IHRo
ZSBwZnV6ZTEwMCByZWd1bGF0b3IgcGF0Y2ggcmV2ZXJ0IGFuZCBpdCBpcyBsaW51eC1uZXh0DQo+
IG5vdy4gU2hvdWxkIHByb2JhYmx5IHJlYWNoIDQuMTgtcmM0Lg0KPiANCj4gPiANCj4gPiBBZnRl
ciBhIGNvdXBsZSBvZiByZWxlYXNlIGN5Y2xlcywgYWRkIHRoZSBwZnV6ZTEwMCBzd2l0Y2gNCj4g
PiBlbmFibGUvZGlzYWJsZSBwYXRjaA0KPiA+IGJhY2sgdG8gc3VwcG9ydCB0aGlzIGZlYXR1cmUs
IEkgYmVsaWV2ZSB1c2VycyBzaG91bGQgc3dpdGNoIHRvIG5ldw0KPiA+IGR0YiB3aXRoICJyZWd1
bGF0b3ItYWx3YXlzLW9uIg0KPiA+IGV4aXN0aW5nIGFscmVhZHkuDQo+IFRoYXQgd2lsbCBzdGls
bCBicmVhayBvbGQgZHRiIGNvbXBhdGliaWxpdHkuDQo+IA0KPiBZb3UgY2Fubm90IGZvcmNlIHVz
ZXJzIHRvIHVzZSAicmVndWxhdG9yLWFsd2F5cy1vbiIgYW5kIHRoZSBvbGQgZHRicw0KPiBuZWVk
IHRvIGFsd2F5cyB3b3JrLg0KPiANCj4gU28gd2hhdGV2ZXIgbmV3IGZlYXR1cmUgeW91IG5lZWQg
dG8gaW50cm9kdWNlIGl0IG5lZWRzIHRvIGJlIGRvbmUgaW4NCj4gc3VjaCBhIHdheSB0aGF0IHRo
ZSBleGlzdGluZyBkdGIncyB3aWxsIGNvbnRpbnVlIHdvcmtpbmcuDQpCdXQgYWN0dWFsbHkgZXhp
c3RpbmcgZHRiIGlzIG5vdCByaWdodCBzaW5jZSB0aGUgY3JpdGljYWwgcG93ZXIgcmFpbA0KbWlz
c2luZyAncmVndWxhdG9yLWFsd2F5cy1vbicuIEl0J3MgYSBmaXggcGF0Y2ggZm9yIGR0cywgbm90
IHJlbGF0ZWQNCndpdGggZm9sbG93aW5nIGR0Yi9rZXJuZWwgYnJlYWsgcnVsZXMsIGp1c3QgYSBz
aW1wbGUgZHRzIHBhdGNoLiBXaHkNCnNob3VsZCB3ZSBtYWtlIHByb21pc2UgZm9yIHRoZSB3cm9u
ZyBkdGJzPw==
