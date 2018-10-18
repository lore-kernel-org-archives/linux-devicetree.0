Return-Path: <SRS0=MYDa=M6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:21010
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727502AbeJRRFE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 18 Oct 2018 13:05:04 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 0/4] usb: chipidea: imx: add HSIC support
Date: Thu, 18 Oct 2018 09:04:56 +0000
Message-ID: <VI1PR04MB53275150CEF772C49CAC29AF8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20181016045846.2345-1-peter.chen@nxp.com>
 <82a99c3c-20c6-4972-fc6d-1fca8d5d684d@exceet.de>
 <VI1PR04MB53271CABB291EECC73C86C518BFF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <796469f2-ea5d-d428-6088-32d8eedb3160@exceet.de>
 <70259e7d-2b2a-ddf6-4f10-3c53c065133c@exceet.de>
 <9efff07e-deb6-5740-6326-bd2f11f9fed4@exceet.de>
 <VI1PR04MB5327FF408B0FFE0FEA8935338BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <b127d005-3407-4c00-99a1-2a92809b7148@exceet.de>
 <VI1PR04MB53271760D4EE48F1B38E73458BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <5f22a449-aa97-0abd-242c-e33233d8ca28@exceet.de>
In-Reply-To: <5f22a449-aa97-0abd-242c-e33233d8ca28@exceet.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Frieder Schrempf <frieder.schrempf@exceet.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

IA0KPiA+PiBNeSBib2FyZCBpcyBjdXJyZW50bHkgb2ZmLXRyZWUgc28gSSBjYW4ndCBzZW5kIGFu
eSBwYXRjaCBmb3IgdGhlDQo+ID4+IHBpbm11eCBzZXR0aW5ncyBpbiBkZXZpY2V0cmVlLiBCdXQg
SSB3aWxsIHNlbmQgYSBwYXRjaCB3aXRoIHRoZQ0KPiA+PiBjaGFuZ2VzIHRoYXQgc2hvdWxkIGdv
IHRvIGlteDZxZGwuZHRzaSwgaW14NnNsLmR0c2kgYW5kIGlteDZzeC5kdHNpLiBUaG91Z2ggSQ0K
PiBvbmx5IHRlc3RlZCBvbiBpLk1YNlMuDQo+ID4+DQo+ID4NCj4gPiBObywgdGhlIGNoYW5nZXMg
YXJlIGJvYXJkIGxldmVsIHNwZWNpZmljLCB5b3UgY291bGQgbm90IGFkZCBpdCBpbnRvIFNvQyBm
aWxlLg0KPiANCj4gTm90IGFsbCBjaGFuZ2VzIGFyZSBib2FyZCBzcGVjaWZpYy4gVGhlIEhTSUMt
b25seSBob3N0IGNvbnRyb2xsZXJzIGNhbiBvbmx5IGJlIHVzZWQNCj4gdG8gaW50ZXJmYWNlIHdp
dGggb24tYm9hcmQgY2hpcHMgdmlhIEhTSUMuIFNvIHRoZXkgbmVlZCBhICJ1c2Itbm9wLXhjZWl2
IiBkdW1teQ0KPiBQSFkgaW4gYWxsIHVzZSBjYXNlcy4NCj4gDQo+IFNvIGlmIEkgdW5kZXJzdGFu
ZCB0aGlzIGNvcnJlY3RseSB0aGlzIHNob3VsZCBiZSBkb25lIGluIHRoZSBTb0NzIGR0c2kgZmls
ZXMgbGlrZSBpbiB0aGlzDQo+IHBhdGNoIEkganVzdCBzZW50OiBbMV0uDQo+IA0KPiBQbGVhc2Ug
YWxzbyBub3RlIHRoYXQgZm9yIGkuTVg3UyB0aGlzIGlzIGFscmVhZHkgYWRkZWQgaW4gaW14N3Mu
ZHRzaTogWzJdDQo+IA0KDQpPaCwgSSBoYXZlIG1pc3VuZGVyc3Rvb2QgeW91ciBtZWFuaW5nLCB0
aGUgWzFdIGlzIG5lZWRlZCBzaW5jZSBpdCBpcyBmb3IgU29DLg0KSSB0aG91Z2h0IHlvdXIgYm9h
cmQgbGV2ZWwgY2hhbmdlcyAobGlrZSBwaW5jdHJsKSB3b3VsZCBnbyBpbnRvIFNvQyBkdHNpIGZp
bGUuDQpJZiB0aGVyZSBhcmUgbm8gbW9yZSBjb21tZW50cywgSSB3aWxsIHNlbmQgdjIgbmV4dCB3
ZWVrLCBmZWVsIGZyZWUgdG8gYWRkIHlvdXINCnJldmlld2VkLWJ5IGFuZCB0ZXN0ZWQtYnkgdGFn
LCB0aGFua3MuDQoNClBldGVyDQoNCj4gDQo+IFsxXToNCj4gaHR0cHM6Ly9lbWVhMDEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxrbWwub3JnJTIN
Cj4gRmxrbWwlMkYyMDE4JTJGMTAlMkYxOCUyRjQxNCZhbXA7ZGF0YT0wMiU3QzAxJTdDcGV0ZXIu
Y2hlbiU0MG54cC4NCj4gY29tJTdDM2M3M2ZkZjRlYzk4NDc3ZGE0OTMwOGQ2MzRkNzhiMzklN0M2
ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1Yw0KPiAzMDE2MzUlN0MwJTdDMCU3QzYzNjc1NDQ5NzY4
Nzc5Mzk5MSZhbXA7c2RhdGE9YUhoTWhhaiUyRmJkVEZ1MEINCj4gcVhpMGxvaUJoJTJCSHpsJTJG
JTJCVFN3M3R4eWpCU05MUSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiBbMl06DQo+IGh0dHBzOi8vZW1l
YTAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZn
aXRodWIuY29tDQo+ICUyRnRvcnZhbGRzJTJGbGludXglMkZibG9iJTJGbWFzdGVyJTJGYXJjaCUy
RmFybSUyRmJvb3QlMkZkdHMlMkZpbQ0KPiB4N3MuZHRzaSUyM0w4OCZhbXA7ZGF0YT0wMiU3QzAx
JTdDcGV0ZXIuY2hlbiU0MG54cC5jb20lN0MzYzczZmRmNGVjOQ0KPiA4NDc3ZGE0OTMwOGQ2MzRk
NzhiMzklN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJQ0KPiA3QzYz
Njc1NDQ5NzY4Nzc5Mzk5MSZhbXA7c2RhdGE9N2NWaEFNUXBXV1lqR0hqWThYaDJnMENHM2pQYWVH
OFgNCj4gOUszNjhBb29RY2MlM0QmYW1wO3Jlc2VydmVkPTANCg==
