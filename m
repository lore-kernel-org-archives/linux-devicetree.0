From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv4 2/5] mtd: gpmi: remove line breaks from error messages and
 improve wording
Date: Thu, 12 Jun 2014 15:20:42 +0200
Message-ID: <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>, Huang Shijie <b32955@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>, Boris BREZILLON <b.brezillon.dev@gmail.com>, Ezequie
List-Id: devicetree@vger.kernel.org

ClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFubiA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4K
LS0tCiBkcml2ZXJzL210ZC9uYW5kL2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8ICAgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCmluZGV4IDMxMDMyYjEuLjE2YTUzM2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCkBAIC0yODUsOSArMjg1LDgg
QEAgc3RhdGljIGludCBsZWdhY3lfc2V0X2dlb21ldHJ5KHN0cnVjdCBncG1pX25hbmRfZGF0YSAq
dGhpcykKIAlnZW8tPmVjY19zdHJlbmd0aCA9IGdldF9lY2Nfc3RyZW5ndGgodGhpcyk7CiAJaWYg
KCFncG1pX2NoZWNrX2VjYyh0aGlzKSkgewogCQlkZXZfZXJyKHRoaXMtPmRldiwKLQkJCSJXZSBj
YW4gbm90IHN1cHBvcnQgdGhpcyBuYW5kIGNoaXAuIgotCQkJIiBJdHMgcmVxdWlyZWQgZWNjIHN0
cmVuZ3RoKCVkKSBpcyBiZXlvbmQgb3VyIgotCQkJIiBjYXBhYmlsaXR5KCVkKS5cbiIsIGdlby0+
ZWNjX3N0cmVuZ3RoLAorCQkJInJlcXVpcmVkIGVjYyBzdHJlbmd0aCBvZiB0aGUgTkFORCBjaGlw
OiAlZCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBHUE1JIGNvbnRyb2xsZXIgKCVkKVxuIiwKKwkJ
CWdlby0+ZWNjX3N0cmVuZ3RoLAogCQkJdGhpcy0+ZGV2ZGF0YS0+YmNoX21heF9lY2Nfc3RyZW5n
dGgpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CkBAIC0xNTk3LDggKzE1OTYsOSBAQCBzdGF0aWMg
aW50IG14MjNfYm9vdF9pbml0KHN0cnVjdCBncG1pX25hbmRfZGF0YSAgKnRoaXMpCiAJCQlkZXZf
ZGJnKGRldiwgIlRyYW5zY3JpYmluZyBtYXJrIGluIGJsb2NrICV1XG4iLCBibG9jayk7CiAJCQly
ZXQgPSBjaGlwLT5ibG9ja19tYXJrYmFkKG10ZCwgYnl0ZSk7CiAJCQlpZiAocmV0KQotCQkJCWRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIG1hcmsgYmxvY2sgYmFkIHdpdGggIgotCQkJCQkJCSJyZXQg
JWRcbiIsIHJldCk7CisJCQkJZGV2X2VycihkZXYsCisJCQkJCSJGYWlsZWQgdG8gbWFyayBibG9j
ayBiYWQgd2l0aCByZXQgJWRcbiIsCisJCQkJCXJldCk7CiAJCX0KIAl9CiAKLS0gCjEuNy4xMC40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
