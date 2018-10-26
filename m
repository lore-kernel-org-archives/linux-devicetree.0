From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: RE: [PATCH 3/6] PCI: layerscape: Add the EP mode support
Date: Fri, 26 Oct 2018 03:45:43 +0000
Message-ID: <HE1PR04MB149735C7EF2A23AEE982BB9FF5F00@HE1PR04MB1497.eurprd04.prod.outlook.com>
References: <20181025110901.5680-1-xiaowei.bao@nxp.com>
 <20181025110901.5680-3-xiaowei.bao@nxp.com> <20181025215246.GA14861@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181025215246.GA14861@bogus>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "niklas.cassel@axis.com" <niklas.cassel@axis.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "cyrille.pitchen@free-electrons.com" <cyrille.pitchen@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "pombredanne@nexb.com" <pombredanne@nexb.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>, shawnguo@kernel.or
List-Id: devicetree@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiANClNlbnQ6IDIwMTjE6jEw1MIyNsjVIDU6NTMNClRvOiBYaWFvd2VpIEJhbyA8
eGlhb3dlaS5iYW9AbnhwLmNvbT4NCkNjOiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBtYXJrLnJ1dGxh
bmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5j
b20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBhcm5kQGFybmRi
LmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgTS5oLiBMaWFuIDxtaW5naHVhbi5saWFu
QG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kgWmFuZyA8cm95
LnphbmdAbnhwLmNvbT47IGtzdGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc7IGN5cmlsbGUucGl0
Y2hlbkBmcmVlLWVsZWN0cm9ucy5jb207IHBvbWJyZWRhbm5lQG5leGIuY29tOyBzaGF3bi5saW5A
cm9jay1jaGlwcy5jb207IG5pa2xhcy5jYXNzZWxAYXhpcy5jb207IGxpbnV4LXBjaUB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBj
LWRldkBsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDMvNl0gUENJOiBsYXll
cnNjYXBlOiBBZGQgdGhlIEVQIG1vZGUgc3VwcG9ydA0KDQpPbiBUaHUsIE9jdCAyNSwgMjAxOCBh
dCAwNzowODo1OFBNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gQWRkIHRoZSBFUCBtb2Rl
IHN1cHBvcnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9A
bnhwLmNvbT4NCj4gLS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2Fw
ZS1wY2kudHh0ICAgICB8ICAgIDMgKysrDQo+ICAxIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+IGluZGV4IDY2ZGYx
ZTguLmQzZDdiZTEgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+IEBAIC0xMywxMiArMTMsMTUg
QEAgaW5mb3JtYXRpb24uDQo+ICANCj4gIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ICAtIGNvbXBh
dGlibGU6IHNob3VsZCBjb250YWluIHRoZSBwbGF0Zm9ybSBpZGVudGlmaWVyIHN1Y2ggYXM6DQo+
ICsgIFJDIG1vZGU6DQo+ICAgICAgICAgICJmc2wsbHMxMDIxYS1wY2llIiwgInNucHMsZHctcGNp
ZSINCj4gICAgICAgICAgImZzbCxsczIwODBhLXBjaWUiLCAiZnNsLGxzMjA4NWEtcGNpZSIsICJz
bnBzLGR3LXBjaWUiDQo+ICAgICAgICAgICJmc2wsbHMyMDg4YS1wY2llIg0KPiAgICAgICAgICAi
ZnNsLGxzMTA4OGEtcGNpZSINCj4gICAgICAgICAgImZzbCxsczEwNDZhLXBjaWUiDQo+ICAgICAg
ICAgICJmc2wsbHMxMDEyYS1wY2llIg0KPiArICBFUCBtb2RlOg0KPiArICAgICAgICAiZnNsLGxz
LXBjaWUtZXAiDQoNCllvdSBuZWVkIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlcyBmb3IgdGhlIHNh
bWUgcmVhc29ucyBhcyB0aGUgUkMuDQpbWGlhb3dlaSBCYW9dIEkgd2FudCB0byBjb250YWlucyBh
bGwgbGF5ZXJzY2FwZSBwbGF0Zm9ybSB1c2Ugb25lIGNvbXBhdGlibGUgaWYgdGhlIFBDSWUgY29u
dHJvbGxlciB3b3JrIGluIEVQIG1vZGUuDQoNClJvYg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
