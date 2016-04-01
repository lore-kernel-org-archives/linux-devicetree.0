From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH 2/2] PCI: imx6: Add reset-gpio-active-high boolean property to
 DT
Date: Fri,  1 Apr 2016 14:41:48 +0200
Message-ID: <1459514508-8557-3-git-send-email-ynezz@true.cz>
References: <1459514508-8557-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459514508-8557-1-git-send-email-ynezz@true.cz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pci@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <Richard.Zhu@freescale.com>, stefan@agner.ch, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

V2UgbmVlZCB0aGF0IHByb3BlcnR5IGluIG9yZGVyIHRvIG1ha2UgdGhlIFRvcmFkZXggQXBhbGlz
IFNvTXMgd29ya2luZwp3aXRob3V0IGJyZWFraW5nIG9sZCBEVEJzLiBPbiBBcGFsaXMgU29NcyB0
aGUgR1BJTzFfSU8yOCB1c2VkIHRvIFBDSWUKcmVzZXQgaXMgbm90IGNvbm5lY3RlZCBkaXJlY3Rs
eSB0byBQRVJTVCMgUENJZSBzaWduYWwsIGJ1dCBpdCdzIE9SZWQKd2l0aCBSRVNFVEJNQ1UgY29t
aW5nIG9mZiB0aGUgUE1JQywgYW5kIHRodXMgaXMgaW52ZXJ0ZWQsIGFjdGl2ZS1oaWdoLgoKU2ln
bmVkLW9mZi1ieTogUGV0ciDFoHRldGlhciA8eW5lenpAdHJ1ZS5jej4KLS0tCiBkcml2ZXJzL3Bj
aS9ob3N0L3BjaS1pbXg2LmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kv
aG9zdC9wY2ktaW14Ni5jIGIvZHJpdmVycy9wY2kvaG9zdC9wY2ktaW14Ni5jCmluZGV4IDJmODE3
ZmEuLjFiM2JjZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2hvc3QvcGNpLWlteDYuYworKysg
Yi9kcml2ZXJzL3BjaS9ob3N0L3BjaS1pbXg2LmMKQEAgLTMzLDYgKzMzLDcgQEAKIAogc3RydWN0
IGlteDZfcGNpZSB7CiAJaW50CQkJcmVzZXRfZ3BpbzsKKwlib29sCQkJZ3Bpb19hY3RpdmVfaGln
aDsKIAlzdHJ1Y3QgY2xrCQkqcGNpZV9idXM7CiAJc3RydWN0IGNsawkJKnBjaWVfcGh5OwogCXN0
cnVjdCBjbGsJCSpwY2llOwpAQCAtMzEwLDkgKzMxMSwxMSBAQCBzdGF0aWMgaW50IGlteDZfcGNp
ZV9kZWFzc2VydF9jb3JlX3Jlc2V0KHN0cnVjdCBwY2llX3BvcnQgKnBwKQogCiAJLyogU29tZSBi
b2FyZHMgZG9uJ3QgaGF2ZSBQQ0llIHJlc2V0IEdQSU8uICovCiAJaWYgKGdwaW9faXNfdmFsaWQo
aW14Nl9wY2llLT5yZXNldF9ncGlvKSkgewotCQlncGlvX3NldF92YWx1ZV9jYW5zbGVlcChpbXg2
X3BjaWUtPnJlc2V0X2dwaW8sIDApOworCQlncGlvX3NldF92YWx1ZV9jYW5zbGVlcChpbXg2X3Bj
aWUtPnJlc2V0X2dwaW8sCisJCQkJCSEhaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoKTsKIAkJ
bXNsZWVwKDEwMCk7Ci0JCWdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVwKGlteDZfcGNpZS0+cmVzZXRf
Z3BpbywgMSk7CisJCWdwaW9fc2V0X3ZhbHVlX2NhbnNsZWVwKGlteDZfcGNpZS0+cmVzZXRfZ3Bp
bywKKwkJCQkJIWlteDZfcGNpZS0+Z3Bpb19hY3RpdmVfaGlnaCk7CiAJfQogCXJldHVybiAwOwog
CkBAIC01NDYsOSArNTQ5LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IGlteDZfcGNpZV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJLyogRmV0Y2ggR1BJT3MgKi8KIAlpbXg2
X3BjaWUtPnJlc2V0X2dwaW8gPSBvZl9nZXRfbmFtZWRfZ3BpbyhucCwgInJlc2V0LWdwaW8iLCAw
KTsKKwlpbXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2ggPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
bnAsCisJCQkJCQkicmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIpOwogCWlmIChncGlvX2lzX3ZhbGlk
KGlteDZfcGNpZS0+cmVzZXRfZ3BpbykpIHsKIAkJcmV0ID0gZGV2bV9ncGlvX3JlcXVlc3Rfb25l
KCZwZGV2LT5kZXYsIGlteDZfcGNpZS0+cmVzZXRfZ3BpbywKLQkJCQkJICAgIEdQSU9GX09VVF9J
TklUX0xPVywgIlBDSWUgcmVzZXQiKTsKKwkJCQlpbXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2gg
PworCQkJCQlHUElPRl9PVVRfSU5JVF9ISUdIIDoKKwkJCQkJR1BJT0ZfT1VUX0lOSVRfTE9XLAor
CQkJCSJQQ0llIHJlc2V0Iik7CiAJCWlmIChyZXQpIHsKIAkJCWRldl9lcnIoJnBkZXYtPmRldiwg
InVuYWJsZSB0byBnZXQgcmVzZXQgZ3Bpb1xuIik7CiAJCQlyZXR1cm4gcmV0OwotLSAKMS45LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
