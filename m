From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH 1/1] ARM: dts: imx6ul: Add PXP node
Date: Thu,  6 Jun 2019 18:46:42 +0200
Message-ID: <20190606164642.11539-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: devicetree@vger.kernel.org

QWRkIFBYUCBub2RlIGZvciBpLk1YNlVML0wgU29DLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGll
biBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpICB8IDkgKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0
cy9pbXg2dWxsLmR0c2kgfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9pbXg2dWwuZHRzaQppbmRleCBmMTAwMTJkZTVlYjYuLmEzYzAwNTM3M2FlMSAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvaW14NnVsLmR0c2kKQEAgLTk3MSw2ICs5NzEsMTUgQEAKIAkJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwogCQkJfTsKIAorCQkJcHhwOiBweHBAMjFjYzAwMCB7CisJCQkJY29tcGF0aWJs
ZSA9ICJmc2wsaW14NnVsLXB4cCI7CisJCQkJcmVnID0gPDB4MDIxY2MwMDAgMHg0MDAwPjsKKwkJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgOCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQljbG9j
a3MgPSA8JmNsa3MgSU1YNlVMX0NMS19QWFA+OworCQkJCWNsb2NrLW5hbWVzID0gImF4aSI7CisJ
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKIAkJCXFzcGk6IHNwaUAyMWUwMDAwIHsK
IAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2lteDZ1bGwuZHRzaQppbmRleCAyMmU0YTMwN2ZhNTkuLmIwMTdlOTI1YmQ4NyAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2lteDZ1bGwuZHRzaQpAQCAtMzQsNiArMzQsMTIgQEAKIAljb21wYXRpYmxlID0gImZzbCxpbXg2
dWxsLW9jb3RwIiwgInN5c2NvbiI7CiB9OwogCismcHhwIHsKKwljb21wYXRpYmxlID0gImZzbCxp
bXg2dWxsLXB4cCI7CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDggSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCSAgICAgPEdJQ19TUEkgMTggSVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCiAmdXNk
aGMxIHsKIAljb21wYXRpYmxlID0gImZzbCxpbXg2dWxsLXVzZGhjIiwgImZzbCxpbXg2c3gtdXNk
aGMiOwogfTsKLS0gCjIuMTkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
