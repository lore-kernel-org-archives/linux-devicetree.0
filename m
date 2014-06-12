From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv4 1/5] mtd: gpmi: remove useless (void *) type casts and
 spaces between type casts and variables
Date: Thu, 12 Jun 2014 15:20:41 +0200
Message-ID: <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
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
cnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCmluZGV4IGY2MzhjZDguLjMxMDMyYjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCkBAIC0xMTgwLDcgKzExODAs
NyBAQCBzdGF0aWMgaW50IGdwbWlfZWNjX3dyaXRlX3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQs
IHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAKIAkJLyogSGFuZGxlIGJsb2NrIG1hcmsgc3dhcHBp
bmcuICovCiAJCWJsb2NrX21hcmtfc3dhcHBpbmcodGhpcywKLQkJCQkodm9pZCAqKSBwYXlsb2Fk
X3ZpcnQsICh2b2lkICopIGF1eGlsaWFyeV92aXJ0KTsKKwkJCQkodm9pZCAqKXBheWxvYWRfdmly
dCwgKHZvaWQgKilhdXhpbGlhcnlfdmlydCk7CiAJfSBlbHNlIHsKIAkJLyoKIAkJICogSWYgY29u
dHJvbCBhcnJpdmVzIGhlcmUsIHdlJ3JlIG5vdCBkb2luZyBibG9jayBtYXJrIHN3YXBwaW5nLApA
QCAtMTc2MCwxNiArMTc2MCwxNiBAQCBlcnJfb3V0Ogogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgZ3BtaV9uYW5kX2lkX3RhYmxlW10gPSB7CiAJewogCQkuY29tcGF0aWJsZSA9ICJm
c2wsaW14MjMtZ3BtaS1uYW5kIiwKLQkJLmRhdGEgPSAodm9pZCAqKSZncG1pX2RldmRhdGFfaW14
MjMsCisJCS5kYXRhID0gJmdwbWlfZGV2ZGF0YV9pbXgyMywKIAl9LCB7CiAJCS5jb21wYXRpYmxl
ID0gImZzbCxpbXgyOC1ncG1pLW5hbmQiLAotCQkuZGF0YSA9ICh2b2lkICopJmdwbWlfZGV2ZGF0
YV9pbXgyOCwKKwkJLmRhdGEgPSAmZ3BtaV9kZXZkYXRhX2lteDI4LAogCX0sIHsKIAkJLmNvbXBh
dGlibGUgPSAiZnNsLGlteDZxLWdwbWktbmFuZCIsCi0JCS5kYXRhID0gKHZvaWQgKikmZ3BtaV9k
ZXZkYXRhX2lteDZxLAorCQkuZGF0YSA9ICZncG1pX2RldmRhdGFfaW14NnEsCiAJfSwgewogCQku
Y29tcGF0aWJsZSA9ICJmc2wsaW14NnN4LWdwbWktbmFuZCIsCi0JCS5kYXRhID0gKHZvaWQgKikm
Z3BtaV9kZXZkYXRhX2lteDZzeCwKKwkJLmRhdGEgPSAmZ3BtaV9kZXZkYXRhX2lteDZzeCwKIAl9
LCB7fQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGdwbWlfbmFuZF9pZF90YWJsZSk7Ci0t
IAoxLjcuMTAuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
