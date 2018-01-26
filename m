From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 1/3] ARM: dts: imx6ull: fix the i.MX6ULL UART8 configuration
Date: Fri, 26 Jan 2018 09:23:50 +0100
Message-ID: <1516955032-21167-2-git-send-email-LW@KARO-electronics.de>
References: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516955032-21167-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

VUFSVDggb24gaS5NWDZVTEwgaXMgbm90IGxvY2F0ZWQgb24gdGhlIFNQQkEgYnVzIGxpa2Ugb24g
aS5NWDZVTCBidXQKb24gdGhlIChvdGhlcndpc2UgdW51c2VkKSBBSVBTLTMgYnVzLgpDcmVhdGUg
dGhlIGFwcHJvcHJpYXRlIEFJUFMtMyBidXMgY29uZmlndXJhdGlvbiBhbmQgbW92ZSB0aGUgdWFy
dDgKZGVmaW5pdGlvbiB3aGVyZSBpdCBiZWxvbmdzLgoKU2lnbmVkLW9mZi1ieTogTG90aGFyIFdh
w59tYW5uIDxMV0BLQVJPLWVsZWN0cm9uaWNzLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZ1bGwuZHRzaSB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZ1bGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwuZHRzaQppbmRleCAwYzE4Mjkx
Li5hYmM4MTVmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLmR0c2kKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC5kdHNpCkBAIC00MSwzICs0MSwzMiBAQAogCiAj
aW5jbHVkZSAiaW14NnVsLmR0c2kiCiAjaW5jbHVkZSAiaW14NnVsbC1waW5mdW5jLmgiCisKKy8g
eworCXNvYyB7CisJCWFpcHMtYnVzQDIwMDAwMDAgeworCQkJc3BiYS1idXNAMjAwMDAwMCB7CisJ
CQkJL2RlbGV0ZS1ub2RlLyBzZXJpYWxAMjAyNDAwMDsKKwkJCX07CisJCX07CisKKwkJYWlwczM6
IGFpcHMtYnVzQDIyMDAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJmc2wsYWlwcy1idXMiLCAic2lt
cGxlLWJ1cyI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDE+
OworCQkJcmVnID0gPDB4MDIyMDAwMDAgMHgxMDAwMDA+OworCQkJcmFuZ2VzOworCisJCQl1YXJ0
ODogc2VyaWFsQDIyODgwMDAgeworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC11YXJ0IiwK
KwkJCQkJICAgICAiZnNsLGlteDZxLXVhcnQiOworCQkJCXJlZyA9IDwweDAyMjg4MDAwIDB4NDAw
MD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQwIElSUV9UWVBFX0xFVkVMX0hJR0g+Owor
CQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2VUxfQ0xLX0lQRz4sCisJCQkJCSA8JmNsa3MgSU1YNlVM
X0NMS19VQVJUOF9TRVJJQUw+OworCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIiOworCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCQl9OworCX07Cit9OwotLSAKMi4xLjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
