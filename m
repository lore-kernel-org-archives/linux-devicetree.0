From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] ARM: dts: aspeed: add SPI controller bindings to Romulus
Date: Wed, 22 Mar 2017 17:04:43 +0100
Message-ID: <1490198683-5796-1-git-send-email-clg@kaod.org>
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
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Um9tdWx1cyBzeXN0ZW1zIGhhdmUgb25lIE1YMjVMMjU2MzUgKDMyNzY4IEtieXRlcykgZmxhc2gg
bW9kdWxlIGZvcgp0aGUgQk1DIGZpcm13YXJlIGFuZCBvdGhlciBNVDI1UUw1MTJBICg2NTUzNiBL
Ynl0ZXMpIGZvciB0aGUgaG9zdC4KClNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1vcHAtcm9tdWx1
cy5kdHMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLW9wcC1y
b211bHVzLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtb3BwLXJvbXVsdXMuZHRz
CmluZGV4IDdhM2IyYjUwYzg4NC4uZTNjNjM1OGJjN2Q5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtYm1jLW9wcC1yb211bHVzLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtYm1jLW9wcC1yb211bHVzLmR0cwpAQCAtMzEsNiArMzEsMjYgQEAKIAl9OwogfTsK
IAorJmZtYyB7CisJc3RhdHVzID0gIm9rYXkiOworCWZsYXNoQDAgeworCQlzdGF0dXMgPSAib2th
eSI7CisJCWxhYmVsID0gImJtYyI7CisJfTsKK307CisKKyZzcGkxIHsKKwlzdGF0dXMgPSAib2th
eSI7CisJZmxhc2hAMCB7CisJCXN0YXR1cyA9ICJva2F5IjsKKwkJbGFiZWwgPSAicG5vciI7CisJ
fTsKK307CisKKyZzcGkyIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmdWFydDUgewogCXN0
YXR1cyA9ICJva2F5IjsKIH07Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
