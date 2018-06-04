From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 2/4] dt-bindings: timer: add i.MX EPIT timer binding
Date: Mon,  4 Jun 2018 12:00:33 +0200
Message-ID: <20180604100035.19558-3-peron.clem@gmail.com>
References: <20180604100035.19558-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180604100035.19558-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogQ2zDqW1lbnQgUGVyb24gPGNsZW1lbnQucGVyb25AZGV2aWFsZXQuY29tPgoKQWRkIGRl
dmljZXRyZWUgYmluZGluZyBkb2N1bWVudCBmb3IgTlhQJ3MgaS5NWCBTb0Mgc3BlY2lmaWMKRVBJ
VCB0aW1lciBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQZXJvbiA8Y2xlbWVudC5w
ZXJvbkBkZXZpYWxldC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvZnNs
LGlteGVwaXQudHh0IHwgMjEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIx
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdGltZXIvZnNsLGlteGVwaXQudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2ZzbCxpbXhlcGl0LnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9mc2wsaW14ZXBpdC50eHQKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kZTJlNmVmNjhkMjQKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvZnNsLGlteGVw
aXQudHh0CkBAIC0wLDAgKzEsMjEgQEAKK0JpbmRpbmcgZm9yIHRoZSBpLk1YIEVuaGFuY2VkIFBl
cmlvZGljIEludGVycnVwdCBUaW1lciAoRVBJVCkKKworVGhlIEVuaGFuY2VkIFBlcmlvZGljIElu
dGVycnVwdCBUaW1lciAoRVBJVCkgaXMgYSAzMi1iaXQgc2V0LWFuZC1mb3JnZXQgdGltZXIKK3Ro
YXQgaXMgY2FwYWJsZSBvZiBwcm92aWRpbmcgcHJlY2lzZSBpbnRlcnJ1cHRzIGF0IHJlZ3VsYXIg
aW50ZXJ2YWxzIHdpdGgKK21pbmltYWwgcHJvY2Vzc29yIGludGVydmVudGlvbi4KKworUmVxdWly
ZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJmc2wsPGNoaXA+LWVwaXQi
LCAiZnNsLGlteDMxLWVwaXQiIHdoZXJlIDxjaGlwPiBpcworICBpbXgyNSwgaW14NnFkbCwgaW14
NnNsLCBpbXg2c3VsIG9yIGlteDZzeC4KKy0gcmVnOiBwaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2Yg
dGhlIGNvbnRyb2xsZXIgYW5kIGxlbmd0aCBvZiBtZW1vcnkgbWFwcGVkCisgIHJlZ2lvbi4KKy0g
aW50ZXJydXB0czogU2hvdWxkIGNvbnRhaW4gRVBJVCBjb250cm9sbGVyIGludGVycnVwdAorLSBj
bG9ja3MgOiBUaGUgY2xvY2sgcHJvdmlkZWQgYnkgdGhlIFNvQyB0byBkcml2ZSB0aGUgdGltZXIu
CisKK0V4YW1wbGUgZm9yIGkuTVg2UURMOgorCWVwaXQxOiBlcGl0QDIwZDAwMDAgeworCQljb21w
YXRpYmxlID0gImZzbCxpbXg2cWRsLWVwaXQiLCAiZnNsLGlteDMxLWVwaXQiOworCQlyZWcgPSA8
MHgwMjBkMDAwMCAweDQwMDA+OworCQlpbnRlcnJ1cHRzID0gPDAgNTYgSVJRX1RZUEVfTEVWRUxf
SElHSD47CisJCWNsb2NrcyA9IDwmY2xrcyBJTVg2UURMX0NMS19FUElUMT47CisJfTsKLS0gCjIu
MTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
