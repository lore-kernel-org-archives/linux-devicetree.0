From: Zhiqiang Hou <zhiqiang.hou@nxp.com>
Subject: RE: [PATCH v3 1/2] Documentation: DT: Add entry for Freescale
 LS1043a-QDS board
Date: Tue, 8 Mar 2016 02:10:11 +0000
Message-ID: <AM4PR04MB214891F1E20C2D22537770EA84B20@AM4PR04MB2148.eurprd04.prod.outlook.com>
References: <1457350232-12749-1-git-send-email-Zhiqiang.Hou@nxp.com>
 <DB5PR0401MB1928313A537226265C54764291B10@DB5PR0401MB1928.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB5PR0401MB1928313A537226265C54764291B10@DB5PR0401MB1928.eurprd04.prod.outlook.com>
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
To: Scott Wood <scott.wood@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Shaohui Xie <shaohui.xie@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgU2NvdHQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2NvdHQg
V29vZA0KPiBTZW50OiAyMDE2xOoz1MI4yNUgMToyMw0KPiBUbzogWmhpcWlhbmcgSG91IDx6aGlx
aWFuZy5ob3VAbnhwLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiByb2JoK2R0
QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBwYXdlbC5tb2xsQGFybS5jb207DQo+
IGlqYytkZXZpY2V0cmVlQGhlbGxpb24ub3JnLnVrOyBnYWxha0Bjb2RlYXVyb3JhLm9yZzsgbGlu
dXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgY2F0YWxpbi5tYXJpbmFzQGFy
bS5jb207IHdpbGwuZGVhY29uQGFybS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmcNCj4gQ2M6
IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47IFNoYW9odWkgWGllIDxzaGFvaHVpLnhp
ZUBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMl0gRG9jdW1lbnRhdGlvbjog
RFQ6IEFkZCBlbnRyeSBmb3IgRnJlZXNjYWxlIExTMTA0M2EtDQo+IFFEUyBib2FyZA0KPiANCj4g
T24gMDMvMDcvMjAxNiAwNTozOSBBTSwgWmhpcWlhbmcgSG91IHdyb3RlOg0KPiA+IEZyb206IEhv
dSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IHYzOg0K
PiA+ICAtIE5vIGNoYW5nZS4NCj4gPg0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2ZzbC50eHQgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9mc2wudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2ZzbC50eHQNCj4gPiBpbmRleCA3NTJhNjg1Li5mNTA0ZmRmIDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnR4dA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnR4dA0KPiA+IEBAIC0x
MzQsNiArMTM0LDcgQEAgRnJlZXNjYWxlIEFSTXY4IGJhc2VkIExheWVyc2NhcGUgU29DIGZhbWls
eSBEZXZpY2UNCj4gPiBUcmVlIEJpbmRpbmdzICBMUzEwNDNBIEFSTXY4IGJhc2VkIFJEQiBCb2Fy
ZCAgUmVxdWlyZWQgcm9vdCBub2RlDQo+ID4gcHJvcGVydGllczoNCj4gPiAgICAgIC0gY29tcGF0
aWJsZSA9ICJmc2wsbHMxMDQzYS1yZGIiLCAiZnNsLGxzMTA0M2EiOw0KPiA+ICsgICAgLSBjb21w
YXRpYmxlID0gImZzbCxsczEwNDNhLXFkcyIsICJmc2wsbHMxMDQzYSI7DQo+IA0KPiAiZnNsLGxz
MTA0M2EtcWRzIiBpcyByZXF1aXJlZCBmb3IgdGhlICJMUzEwNDNBIEFSTXY4IGJhc2VkIFJEQiBC
b2FyZCI/DQoNClRoYW5rcyBmb3IgeW91ciByZWRyZXNzLCBhbmQgd2lsbCBjb3JyZWN0IHRoaXMg
aXNzdWUgaW4gdjQuDQoNClRoYW5rcywNClpoaXFpYW5nDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
