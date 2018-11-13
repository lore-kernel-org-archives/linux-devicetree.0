From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: RE: [PATCH 15/23] dt-bindings: pci: mobiveil: change gpio_slave and
 apb_csr to optional
Date: Tue, 13 Nov 2018 06:08:44 +0000
Message-ID: <AM6PR04MB57810984D8C842A2134A836184C20@AM6PR04MB5781.eurprd04.prod.outlook.com>
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com>
 <20181106131807.29951-16-Zhiqiang.Hou@nxp.com>
 <5bea0eb7.1c69fb81.dd309.4a26@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5bea0eb7.1c69fb81.dd309.4a26@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgQUNLIQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IDIwMTjE6jEx1MIxM8jVIDI6MTMNCj4gVG86IFoucS4gSG91IDx6aGlxaWFuZy5ob3VAbnhw
LmNvbT4NCj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGJoZWxnYWFzQGdvb2dsZS5jb207IG1hcmsucnV0
bGFuZEBhcm0uY29tOw0KPiBsLnN1YnJhaG1hbnlhQG1vYml2ZWlsLmNvLmluOyBzaGF3bmd1b0Br
ZXJuZWwub3JnOyBMZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNvbT47IGxvcmVuem8ucGllcmFs
aXNpQGFybS5jb207IE1pbmdrYWkgSHUNCj4gPG1pbmdrYWkuaHVAbnhwLmNvbT47IE0uaC4gTGlh
biA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgWGlhb3dlaSBCYW8NCj4gPHhpYW93ZWkuYmFvQG54
cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTUvMjNdIGR0LWJpbmRpbmdzOiBwY2k6IG1v
Yml2ZWlsOiBjaGFuZ2UgZ3Bpb19zbGF2ZSBhbmQNCj4gYXBiX2NzciB0byBvcHRpb25hbA0KPiAN
Cj4gT24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMDE6MjA6NDFQTSArMDAwMCwgWi5xLiBIb3Ugd3Jv
dGU6DQo+ID4gRnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCj4gPg0K
PiA+IENoYW5nZSB0aGUgImdwaW9fc2xhdmUiIGFuZCAiYXBiX2NzciIgdG8gb3B0aW9uYWwsIHRo
ZSAiZ3Bpb19zbGF2ZSINCj4gPiBpcyBub3QgdXNlZCBpbiBjdXJyZW50IGNvZGUsIGFuZCAiYXBi
X2NzciIgaXMgbm90IHVzZWQgYnkgc29tZQ0KPiA+IHBsYXRvcm1zLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCj4gPiAtLS0NCj4g
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tb2JpdmVpbC1wY2llLnR4
dCB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQoNClJlZ2FyZHMsDQpaaGlxaWFu
Zw0K
