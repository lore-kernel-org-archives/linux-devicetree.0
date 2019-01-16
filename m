From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: RE: [PATCHv4 1/4] dt-bindings: add DT binding for the layerscape PCIe
 controller with EP mode
Date: Wed, 16 Jan 2019 03:50:44 +0000
Message-ID: <AM5PR04MB32998AF3C7BA8EB9AF659646F5820@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190108030922.24031-1-xiaowei.bao@nxp.com>
 <20190111143123.GA6960@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190111143123.GA6960@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "kishon@ti.com" <kishon@ti.com>, Mingkai Hu <mingkai.hu@nxp.com>, "niklas.cassel@axis.com" <niklas.cassel@axis.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "cyrille.pitchen@free-electrons.com" <cyrille.pitchen@free-electrons.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, gregkh@linuxfounda
List-Id: devicetree@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiANClNlbnQ6IDIwMTnE6jHUwjExyNUgMjI6MzENClRvOiBYaWFvd2VpIEJhbyA8
eGlhb3dlaS5iYW9AbnhwLmNvbT4NCkNjOiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtl
cm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8g
TGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207IGxvcmVuem8ucGllcmFsaXNp
QGFybS5jb207IGFybmRAYXJuZGIuZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBNLmgu
IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhw
LmNvbT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsga3N0ZXdhcnRAbGludXhmb3VuZGF0
aW9uLm9yZzsgY3lyaWxsZS5waXRjaGVuQGZyZWUtZWxlY3Ryb25zLmNvbTsgcG9tYnJlZGFubmVA
bmV4Yi5jb207IHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbTsgbmlrbGFzLmNhc3NlbEBheGlzLmNv
bTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IFhpYW93ZWkgQmFvIDx4
aWFvd2VpLmJhb0BueHAuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSHY0IDEvNF0gZHQtYmluZGlu
Z3M6IGFkZCBEVCBiaW5kaW5nIGZvciB0aGUgbGF5ZXJzY2FwZSBQQ0llIGNvbnRyb2xsZXIgd2l0
aCBFUCBtb2RlDQoNCk9uIFR1ZSwgIDggSmFuIDIwMTkgMTE6MDk6MTkgKzA4MDAsIFhpYW93ZWkg
QmFvIHdyb3RlOg0KPiBBZGQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSBEZXZpY2UgVHJlZSBi
aW5kaW5nIGZvciB0aGUgbGF5ZXJzY2FwZSANCj4gUENJZSBjb250cm9sbGVyIHdpdGggRVAgbW9k
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29t
Pg0KPiAtLS0NCj4gdjI6DQo+ICAtIEFkZCB0aGUgU29DIHNwZWNpZmljIGNvbXBhdGlibGVzLg0K
PiB2MzoNCj4gIC0gbW9kaWZ5IHRoZSBjb21taXQgbWVzc2FnZS4NCj4gdjQ6DQo+ICAtIG5vIGNo
YW5nZS4NCj4gDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2ku
dHh0ICAgICB8ICAgIDMgKysrDQo+ICAxIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MCBkZWxldGlvbnMoLSkNCj4gDQoNClBsZWFzZSBhZGQgQWNrZWQtYnkvUmV2aWV3ZWQtYnkgdGFn
cyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLCB0aGVyZSdzIG5vIG5lZWQgdG8g
cmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4gVGhlIHVwc3RyZWFtIG1haW50
YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkg
YXBwbHkuDQoNCklmIGEgdGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRl
IHdoeSBhbmQgd2hhdCBjaGFuZ2VkLg0KW1hpYW93ZWkgQmFvXSBIaSBSb2IsIHRoYW5rcyBhIGxv
dCBmb3IgeW91ciBjb21tZW50cywgaWYgdGhlIHBhdGNoZXMgaGF2ZSBuZXcgdXBkYXRlLCBJIHdp
bGwgYWRkIHRoZSBBY2tlZC1ieS9SZXZpZXdlZC1ieSwgdGhhbmtzLg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
