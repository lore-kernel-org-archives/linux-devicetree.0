From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 06/16] ARM: dts: imx6ul: disable PWMs by default
Date: Wed, 20 Jan 2016 11:08:59 +0100
Message-ID: <1453284549-16363-7-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

U2luY2UgUFdNcyBhcmUgb25seSB1c2VmdWwgaWYgdGhleSBhcmUgYWN0dWFsbHkgY29ubmVjdGVk
IHRvIGFuIG91dHB1dCBwaW4sCmxldCB1c2VycyBlbmFibGUgdGhlbSBleHBsaWNpdGx5IGluIHRo
ZWlyIGRldmljZSB0cmVlcyB3aGVyZSB0aGV5IHNob3VsZAphbHNvIHNldCB1cCB0aGUgcGluIGNv
bmZpZ3VyYXRpb24uIFRoaXMgaXMgaW4gc3luYyB3aXRoIGEgcmVjZW50IGNoYW5nZQooY29tbWl0
IGUyNjc1MjY2YjM5YiAiQVJNOiBkdHM6IGlteDZxZGw6IGRpc2FibGUgUFdNcyBieSBkZWZhdWx0
IikKdG8gb3RoZXIgaS5NWCBTb0NzLgoKU2lnbmVkLW9mZi1ieTogTG90aGFyIFdhw59tYW5uIDxM
V0BLQVJPLWVsZWN0cm9uaWNzLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNp
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwu
ZHRzaQppbmRleCAzYWJhMGJiLi44NjM3NzdlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0
cy9pbXg2dWwuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQpAQCAtNTEy
LDYgKzUxMiw3IEBACiAJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19QV001PjsKIAkJCQljbG9jay1u
YW1lcyA9ICJpcGciLCAicGVyIjsKIAkJCQkjcHdtLWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CiAJCQl9OwogCiAJCQlwd202OiBwd21AMDIwZjQwMDAgewpAQCAtNTIyLDYg
KzUyMyw3IEBACiAJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19QV002PjsKIAkJCQljbG9jay1uYW1l
cyA9ICJpcGciLCAicGVyIjsKIAkJCQkjcHdtLWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CiAJCQl9OwogCiAJCQlwd203OiBwd21AMDIwZjgwMDAgewpAQCAtNTMyLDYgKzUz
NCw3IEBACiAJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19QV003PjsKIAkJCQljbG9jay1uYW1lcyA9
ICJpcGciLCAicGVyIjsKIAkJCQkjcHdtLWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCQl9OwogCiAJCQlwd204OiBwd21AMDIwZmMwMDAgewpAQCAtNTQyLDYgKzU0NSw3
IEBACiAJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19QV004PjsKIAkJCQljbG9jay1uYW1lcyA9ICJp
cGciLCAicGVyIjsKIAkJCQkjcHdtLWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CiAJCQl9OwogCQl9OwogCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
