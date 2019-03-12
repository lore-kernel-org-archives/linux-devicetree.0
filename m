From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: RE: [PATCHv4 23/28] dt-bindings: pci: Add NXP Layerscape SoCs PCIe
 Gen4  controller
Date: Tue, 12 Mar 2019 03:17:03 +0000
Message-ID: <AM6PR04MB5781CBCE876031C73D0A4E3B84490@AM6PR04MB5781.eurprd04.prod.outlook.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
 <20190311093130.7209-24-Zhiqiang.Hou@nxp.com> <20190311221142.GA11898@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311221142.GA11898@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIFttYWlsdG86cm9iaEBrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE5xOoz1MIxMsjVIDY6MTIN
Cj4gVG86IFoucS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LXBjaUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGJoZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5k
QGFybS5jb207DQo+IGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW47IHNoYXduZ3VvQGtlcm5l
bC5vcmc7IExlbyBMaQ0KPiA8bGVveWFuZy5saUBueHAuY29tPjsgbG9yZW56by5waWVyYWxpc2lA
YXJtLmNvbTsNCj4gY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdpbGwuZGVhY29uQGFybS5jb207
IE1pbmdrYWkgSHUNCj4gPG1pbmdrYWkuaHVAbnhwLmNvbT47IE0uaC4gTGlhbiA8bWluZ2h1YW4u
bGlhbkBueHAuY29tPjsgWGlhb3dlaSBCYW8NCj4gPHhpYW93ZWkuYmFvQG54cC5jb20+OyBaLnEu
IEhvdSA8emhpcWlhbmcuaG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0h2NCAyMy8y
OF0gZHQtYmluZGluZ3M6IHBjaTogQWRkIE5YUCBMYXllcnNjYXBlIFNvQ3MgUENJZQ0KPiBHZW40
IGNvbnRyb2xsZXINCj4gDQo+IE9uIE1vbiwgMTEgTWFyIDIwMTkgMDk6MzM6MDUgKzAwMDAsICJa
LnEuIEhvdSIgd3JvdGU6DQo+ID4gRnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhw
LmNvbT4NCj4gPg0KPiA+IEFkZCBQQ0llIEdlbjQgY29udHJvbGxlciBEVCBiaW5kaW5ncyBvZiBO
WFAgTGF5ZXJzY2FwZSBTb0NzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSG91IFpoaXFpYW5n
IDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBWNDoNCj4gPiAgLSBubyBjaGFu
Z2UNCj4gPg0KPiA+ICAuLi4vYmluZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLWdlbjQudHh0ICAg
ICAgfCA1Mg0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDYwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS1nZW40LnR4dA0KPiA+
DQo+IA0KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5n
IG5ldyB2ZXJzaW9ucy4gSG93ZXZlciwNCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRj
aGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQ0KPiBtYWludGFpbmVyIHdp
bGwgZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5Lg0K
PiANCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5
IGFuZCB3aGF0IGNoYW5nZWQuDQoNClNvcnJ5LCBJIG1pc3NlZCB5b3VyIFJldmlld2VkLWJ5IHRh
ZyBpbiB0aGlzIHBhdGNoLCB3aWxsIHJlLXNlbmQgdGhpcyBwYXRjaCBhZGRpbmcgdGhlIGxvc3Qg
dGFnLg0KDQpUaGFua3MsDQpaaGlxaWFuZw0K
