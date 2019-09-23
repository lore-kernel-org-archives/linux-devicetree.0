From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH 1/1] ARM: dts: imx28: add poweroff support
Date: Mon, 23 Sep 2019 11:17:00 +0200
Message-ID: <20190923091700.22517-1-sebastien.szymanski@armadeus.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Julien Boibessot <julien.boibessot@armadeus.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

VGhpcyBhZGQgcG93ZXJvZmYgc3VwcG9ydCB1c2luZyB0aGUgZ2VuZXJpYyBzeXNjb24tcG93ZXJv
ZmYgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGll
bi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDI4LmR0
c2kgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14MjguZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDI4LmR0c2kKaW5kZXggZTE0ZDhlZjAxNThiLi4zN2ZhODEzMWEw
MjIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI4LmR0c2kKKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvaW14MjguZHRzaQpAQCAtMTExNCw4ICsxMTE0LDE2IEBACiAJCQl9OwogCiAJ
CQlwb3dlcjogcG93ZXJAODAwNDQwMDAgeworCQkJCWNvbXBhdGlibGUgPSAic3lzY29uIiwgInNp
bXBsZS1tZmQiOwogCQkJCXJlZyA9IDwweDgwMDQ0MDAwIDB4MjAwMD47Ci0JCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKKworCQkJCW14c19wb3dlcm9mZjogbXhzLXBvd2Vyb2ZmIHsKKwkJCQkJY29t
cGF0aWJsZSA9ICJzeXNjb24tcG93ZXJvZmYiOworCQkJCQlyZWdtYXAgPSA8JnBvd2VyPjsKKwkJ
CQkJb2Zmc2V0ID0gPDB4MTA0PjsKKwkJCQkJdmFsdWUgPSA8MHgzRTc3MDAwMT47CisJCQkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkJfTsKIAkJCX07CiAKIAkJCXNhaWYxOiBzYWlmQDgwMDQ2
MDAwIHsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
