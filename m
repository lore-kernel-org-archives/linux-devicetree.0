From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 1/5] ARM: dts: tx53: remove redundant regulator-boot-on
Date: Wed, 19 Mar 2014 14:28:37 +0100
Message-ID: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
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
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

ClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFubiA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4K
LS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1My10eDUzLXgxM3guZHRzIHwgICAgMiAtLQogMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NTMtdHg1My14MTN4LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLXR4NTMteDEz
eC5kdHMKaW5kZXggNjQ4MDQ3MS4uYzhhMzQ3MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NTMtdHg1My14MTN4LmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg1My10eDUz
LXgxM3guZHRzCkBAIC03Miw3ICs3Miw2IEBACiAJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsKIAkJCWdwaW8gPSA8JmdwaW8zIDI5IEdQSU9fQUNUSVZFX0hJR0g+OwogCQkJ
ZW5hYmxlLWFjdGl2ZS1oaWdoOwotCQkJcmVndWxhdG9yLWJvb3Qtb247CiAJCX07CiAKIAkJcmVn
X2xjZF9wd3IxOiByZWd1bGF0b3JANiB7CkBAIC04Myw3ICs4Miw2IEBACiAJCQlyZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKIAkJCWdwaW8gPSA8JmdwaW8yIDMxIEdQSU9fQUNU
SVZFX0hJR0g+OwogCQkJZW5hYmxlLWFjdGl2ZS1oaWdoOwotCQkJcmVndWxhdG9yLWJvb3Qtb247
CiAJCX07CiAJfTsKIH07Ci0tIAoxLjcuMTAuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
