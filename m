Return-Path: <SRS0=HPSP=N7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:19728
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726559AbeKTMhw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Nov 2018 07:37:52 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: RE: [PATCH v2 0/4] usb: chipidea: imx: add HSIC support
Date: Tue, 20 Nov 2018 02:11:06 +0000
Message-ID: <VI1PR04MB53275355AA67EFA1B2F72FC98BD90@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20181022054031.14027-1-peter.chen@nxp.com>
 <92959997-4a83-fe9c-9600-ce51045131d2@kontron.de>
 <VI1PR04MB5327E8A8A55DDA918D460D1D8BF50@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <3a754907-cb57-c7eb-210a-d3559da78b0a@kontron.de>
 <2d5a1fb9-511f-f7cc-26b9-81f28a789561@kontron.de>
In-Reply-To: <2d5a1fb9-511f-f7cc-26b9-81f28a789561@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

IA0KPiA+DQo+ID4gT24gMjMuMTAuMTggMDg6MzMsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4+PiBB
cyBJIGFscmVhZHkgcG9zdGVkIHdoZW4gSSB3YXMgdGVzdGluZyB2MSBsYXN0IHdlZWssIHRoZXJl
IGlzIGENCj4gPj4+IHByb2JsZW0gd2l0aCBhdXRvIHN1c3BlbmQgd2l0aCBteSBMQU45NzMwIGNo
aXAuIEkgdGhvdWdodCBpdCB3YXMgYQ0KPiA+Pj4gcHJvYmxlbSB3aXRoIHRoZSBzbXNjOTV4eC91
c2JuZXQgZHJpdmVyLCBidXQgSSdtIG5vdCBzbyBzdXJlDQo+ID4+PiBhbnltb3JlLg0KPiA+Pj4N
Cj4gPj4+IFNvIEknZCBsaWtlIHRvIGZpZ3VyZSBvdXQgaWYgaXQgaGFzIHNvbWV0aGluZyB0byBk
byB3aXRoIHRoZSBIU0lDDQo+ID4+PiBwYXRjaGVzLiBJIGhvcGUgdG8gZmluZCBzb21lIHRpbWUg
dG8gZG8gc29tZSBtb3JlIGRlYnVnZ2luZyBzb29uLg0KPiA+Pj4gV2hlbiB0aGlzIGlzIHNvcnRl
ZCBJIHdpbGwgYXBwZW5kIG15IFItYiwgVC1iIHRhZ3MuDQo+ID4+Pg0KPiA+PiBUaGFua3MsIEZy
aWVkZXINCj4gPg0KPiA+IFRoZSBwcm9ibGVtIGlzIGluIHRoZSBzbXNjOTV4eCBkcml2ZXIgYW5k
IEkgYWxyZWFkeSBzZW50IGEgZml4IGZvciBpdC4NCj4gPiBTbyB0aGUgSFNJQyBwYXRjaGVzIGFy
ZSBvay4NCj4gPg0KPiA+IEkgaGF2ZSBzb21lIG1vcmUgc21hbGwgc3VnZ2VzdGlvbnMgZm9yIHRo
ZSB2MiBwYXRjaGVzLCBJIHdpbGwgc2VuZA0KPiA+IHNlcGFyYXRlbHkuIENvdWxkIHlvdSBzZW5k
IGEgdjMsIHRoZW4gSSB3aWxsIGFkZCBteSBSLWIgYW5kIFQtYiB0YWdzDQo+ID4gdG8gdGhlIHdo
b2xlIHNlcmllcz8NCj4gDQo+IERpZCB5b3UgaGF2ZSBzb21lIHRpbWUgdG8gcHJlcGFyZSB2MyBz
byB3ZSBjYW4gbW92ZSBvbj8NCj4gQWxzbyBjb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBxdWljayBs
b29rIGFkZCB0aGUgZGV2aWNldHJlZSBjaGFuZ2VzOg0KPiBodHRwczovL2VtZWEwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcGF0Y2h3b3JrLg0K
PiBrZXJuZWwub3JnJTJGcGF0Y2glMkYxMDY0Njg1MyUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGV0
ZXIuY2hlbiU0MG54DQo+IHAuY29tJTdDZDk5ZmMxNTc3MzgxNDQ5MWFmZWYwOGQ2NGRmYTBkMGUl
N0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1DQo+IGMzMDE2MzUlN0MwJTdDMCU3QzYzNjc4MjEz
MzY5MTU3NTA5NSZhbXA7c2RhdGE9MzY5RFY5akF2MTdpQmlaVmpFckkNCj4gWFdScDYzbEpLdWVM
QmtnV1BPaWxUVHclM0QmYW1wO3Jlc2VydmVkPTANCj4gDQogDQpIaSBTY2hyZW1wZiwNCg0KSSBh
bSBhZnJhaWQgSSBhbSBhIGxpdHRsZSBidXN5IHdpdGggc29tZSBvdGhlciBVU0IgdGFza3MsIEkg
d2lsbCBzZW5kIHYzIGF0IG5leHQgd2Vlay4NCg0KUGV0ZXINCg==
