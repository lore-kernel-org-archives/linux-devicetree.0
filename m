From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: RE: [PATCHv5 04/20] PCI: mobiveil: Remove the flag
 MSI_FLAG_MULTI_PCI_MSI
Date: Wed, 12 Jun 2019 11:34:51 +0000
Message-ID: <AM0PR04MB67383023B81AEB33DAF9C35584EC0@AM0PR04MB6738.eurprd04.prod.outlook.com>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-5-Zhiqiang.Hou@nxp.com>
 <20190611165935.GA22836@redmoon>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190611165935.GA22836@redmoon>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTG9yZW56bywNCg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExvcmVuem8gUGllcmFsaXNpIDxsb3Jlbnpv
LnBpZXJhbGlzaUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo21MIxMsjVIDE6MDANCj4gVG86IFou
cS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGJoZWxn
YWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207
DQo+IGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW47IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExl
byBMaQ0KPiA8bGVveWFuZy5saUBueHAuY29tPjsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdp
bGwuZGVhY29uQGFybS5jb207DQo+IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47IE0u
aC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsNCj4gWGlhb3dlaSBCYW8gPHhpYW93ZWku
YmFvQG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0h2NSAwNC8yMF0gUENJOiBtb2JpdmVp
bDogUmVtb3ZlIHRoZSBmbGFnDQo+IE1TSV9GTEFHX01VTFRJX1BDSV9NU0kNCj4gDQo+IE9uIEZy
aSwgQXByIDEyLCAyMDE5IGF0IDA4OjM1OjM2QU0gKzAwMDAsIFoucS4gSG91IHdyb3RlOg0KPiA+
IEZyb206IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+ID4NCj4gPiBUaGUg
Y3VycmVudCBjb2RlIGRvZXMgbm90IHN1cHBvcnQgbXVsdGlwbGUgTVNJcywgc28gcmVtb3ZlIHRo
ZQ0KPiA+IGNvcnJlc3BvbmRpbmcgZmxhZyBmcm9tIHRoZSBtc2lfZG9tYWluX2luZm8gc3RydWN0
dXJlLg0KPiANCj4gUGxlYXNlIGV4cGxhaW4gbWUgd2hhdCdzIHRoZSBwcm9ibGVtIGJlZm9yZSBy
ZW1vdmluZyBtdWx0aSBNU0kgc3VwcG9ydC4NCg0KTlhQIExYMiBQQ0llIHVzZSB0aGUgR0lDLUlU
UyBpbnN0ZWFkIG9mIE1vYml2ZWlsIElQIGludGVybmFsIE1TSSBjb250cm9sbGVyLA0Kc28sIEkg
ZGlkbid0IGVuY291bnRlciBwcm9ibGVtLg0KU3ViYnUsIGRpZCB5b3UgdGVzdCB3aXRoIEVuZHBv
aW50IHN1cHBvcnRpbmcgbXVsdGkgTVNJPw0KDQpUaGFua3MsDQpaaGlxaWFuZw0KDQo+IA0KPiBU
aGFua3MsDQo+IExvcmVuem8NCj4gDQo+ID4gRml4ZXM6IDFlOTEzZTU4MzM1ZiAoIlBDSTogbW9i
aXZlaWw6IEFkZCBNU0kgc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSG91IFpoaXFpYW5n
IDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8
TWluZ2h1YW4uTGlhbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IFY1Og0KPiA+ICAtIENvcnJlY3Rl
ZCB0aGUgc3ViamVjdC4NCj4gPg0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9i
aXZlaWwuYyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLW1vYml2ZWlsLmMNCj4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVp
bC5jDQo+ID4gaW5kZXggNTYzMjEwZTczMWQzLi5hMGRkMzM3YzYyMTQgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCj4gPiArKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KPiA+IEBAIC03MDMsNyArNzAzLDcg
QEAgc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBtb2JpdmVpbF9tc2lfaXJxX2NoaXAgPSB7DQo+ID4N
Cj4gPiAgc3RhdGljIHN0cnVjdCBtc2lfZG9tYWluX2luZm8gbW9iaXZlaWxfbXNpX2RvbWFpbl9p
bmZvID0gew0KPiA+ICAJLmZsYWdzCT0gKE1TSV9GTEFHX1VTRV9ERUZfRE9NX09QUyB8DQo+IE1T
SV9GTEFHX1VTRV9ERUZfQ0hJUF9PUFMgfA0KPiA+IC0JCSAgIE1TSV9GTEFHX01VTFRJX1BDSV9N
U0kgfCBNU0lfRkxBR19QQ0lfTVNJWCksDQo+ID4gKwkJICAgTVNJX0ZMQUdfUENJX01TSVgpLA0K
PiA+ICAJLmNoaXAJPSAmbW9iaXZlaWxfbXNpX2lycV9jaGlwLA0KPiA+ICB9Ow0KPiA+DQo+ID4g
LS0NCj4gPiAyLjE3LjENCj4gPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
