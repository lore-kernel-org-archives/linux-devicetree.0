From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: RE: [PATCHv2 1/4] dt-bindings: PCI: designware: Remove the num-lanes
 from  Required properties
Date: Wed, 28 Aug 2019 03:43:11 +0000
Message-ID: <DB8PR04MB674721E7EE7491BCFBBC890C84A30@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190820073022.24217-1-Zhiqiang.Hou@nxp.com>
 <20190820073022.24217-2-Zhiqiang.Hou@nxp.com> <20190827165742.GA5083@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827165742.GA5083@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "andrew.murray@arm.com" <andrew.murray@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3IQ0KDQpUaGFua3MsDQpaaGlx
aWFuZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMTnE6jjUwjI4yNUgMDo1OA0KPiBUbzogWi5x
LiBIb3UgPHpoaXFpYW5nLmhvdUBueHAuY29tPg0KPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVs
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOw0KPiBqaW5nb29oYW4xQGdt
YWlsLmNvbTsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBtYXJr
LnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpDQo+IDxsZW95YW5n
LmxpQG54cC5jb20+OyBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOw0KPiBhbmRyZXcubXVycmF5
QGFybS5jb207IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgWi5xLiBIb3UNCj4g
PHpoaXFpYW5nLmhvdUBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIdjIgMS80XSBkdC1i
aW5kaW5nczogUENJOiBkZXNpZ253YXJlOiBSZW1vdmUgdGhlDQo+IG51bS1sYW5lcyBmcm9tIFJl
cXVpcmVkIHByb3BlcnRpZXMNCj4gDQo+IE9uIFR1ZSwgMjAgQXVnIDIwMTkgMDc6Mjg6NDMgKzAw
MDAsICJaLnEuIEhvdSIgd3JvdGU6DQo+ID4gRnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5I
b3VAbnhwLmNvbT4NCj4gPg0KPiA+IFRoZSBudW0tbGFuZXMgaXMgbm90IGEgbWFuZGF0b3J5IHBy
b3BlcnR5LCBlLmcuIG9uIEZTTCBMYXllcnNjYXBlDQo+ID4gU29DcywgdGhlIFBDSWUgbGluayB0
cmFpbmluZyBpcyBjb21wbGV0ZWQgYXV0b21hdGljYWxseSBiYXNlIG9uIHRoZQ0KPiA+IHNlbGVj
dGVkIFNlckRlcyBwcm90b2NvbCwgaXQgZG9lc24ndCBuZWVkIHRoZSBudW0tbGFuZXMgdG8gc2V0
LXVwIHRoZQ0KPiA+IGxpbmsgd2lkdGguDQo+ID4NCj4gPiBJdCBpcyBwcmV2aW91c2x5IGluIGJv
dGggUmVxdWlyZWQgYW5kIE9wdGlvbmFsIHByb3BlcnRpZXMsIGxldCdzDQo+ID4gcmVtb3ZlIGl0
IGZyb20gdGhlIFJlcXVpcmVkIHByb3BlcnRpZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
b3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IFYyOg0KPiA+
ICAtIFJld29yZGVkIHRoZSBjaGFuZ2UgbG9nIGFuZCBzdWJqZWN0Lg0KPiA+ICAtIEZpeGVkIGEg
dHlwbyBpbiBzdWJqZWN0Lg0KPiA+DQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wY2kvZGVzaWdud2FyZS1wY2llLnR4dCB8IDEgLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQ0KPiA+DQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCg==
