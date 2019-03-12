From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: RE: [PATCHv4 10/28] PCI: mobiveil: fix the INTx process error
Date: Tue, 12 Mar 2019 04:42:19 +0000
Message-ID: <AM6PR04MB57814BDE85B6A51ABF4FD80384490@AM6PR04MB5781.eurprd04.prod.outlook.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
 <20190311093130.7209-11-Zhiqiang.Hou@nxp.com>
 <20190311140803.GF214730@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311140803.GF214730@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgQmpvcm4sDQoNClRoYW5rcyBhIGxvdCBmb3IgeW91ciBjb21tZW50cyENCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCam9ybiBIZWxnYWFzIFttYWlsdG86aGVsZ2Fh
c0BrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE5xOoz1MIxMcjVIDIyOjA4DQo+IFRvOiBaLnEuIEhv
dSA8emhpcWlhbmcuaG91QG54cC5jb20+DQo+IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiByb2JoK2R0QGtl
cm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBsLnN1YnJhaG1hbnlhQG1vYml2ZWlsLmNv
LmluOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47
DQo+IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207IGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tOw0K
PiB3aWxsLmRlYWNvbkBhcm0uY29tOyBNLmguIExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47
IFhpYW93ZWkgQmFvDQo+IDx4aWFvd2VpLmJhb0BueHAuY29tPjsgTWluZ2thaSBIdSA8bWluZ2th
aS5odUBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIdjQgMTAvMjhdIFBDSTogbW9iaXZl
aWw6IGZpeCB0aGUgSU5UeCBwcm9jZXNzIGVycm9yDQo+IA0KPiBPbiBNb24sIE1hciAxMSwgMjAx
OSBhdCAwOTozMToxNkFNICswMDAwLCBaLnEuIEhvdSB3cm90ZToNCj4gPiBGcm9tOiBIb3UgWmhp
cWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+DQo+ID4gSW4gdGhlIGxvb3AgYmxvY2ss
IHRoZXJlIGlzIG5vdCBjb2RlIGNoYW5nZSB0aGUgbG9vcCBrZXksIHRoaXMgcGF0Y2gNCj4gPiB1
cGRhdGVkIHRoZSBsb29wIGtleSBieSByZS1yZWFkIHRoZSBJTlR4IHN0YXR1cyByZWdpc3Rlci4N
Cj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWxzbyBjaGFuZ2UgdG8gY2xlYXIgdGhlIGhhbmRsZWQgSU5U
eCBzdGF0dXMuDQo+ID4NCj4gPiBOb3RlOiBOZWVkIE1WIHRvIHRlc3QgdGhpcyBmaXguDQo+ID4N
Cj4gPiBGaXhlczogOWFmNmJjYjExZTEyICgiUENJOiBtb2JpdmVpbDogQWRkIE1vYml2ZWlsIFBD
SWUgSG9zdCBCcmlkZ2UgSVANCj4gPiBkcml2ZXIiKQ0KPiANCj4gVGhlICJGaXhlczoiIGxpbmUg
c2hvdWxkIGJlIGFsbCBvbiBvbmUgbGluZSwgd2l0aG91dCBhIG5ld2xpbmUgaW4gdGhlIG1pZGRs
ZSwNCj4gZXZlbiBpZiBpdCBleGNlZWRzIDgwIGNvbHVtbnMuICBUaGF0J3MganVzdCB0byBtYWtl
IGl0IGVhc2llciBmb3IgcHJvZ3JhbXMgdG8NCj4gcGFyc2UgdGhlIGxvZ3MuDQoNCldpbGwgZml4
IGluIHY1Lg0KDQpUaGFua3MsDQpaaGlxaWFuZw0K
