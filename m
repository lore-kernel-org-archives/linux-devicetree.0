From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] ARM: dts: aspeed-g4: fix AHB window size of the SMC
 controllers
Date: Wed, 19 Apr 2017 15:43:15 +0200
Message-ID: <1492609395-9151-1-git-send-email-clg@kaod.org>
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

VGhlIHdpbmRvdyBvZiB0aGUgQXNwZWVkIEFTVDI0MDAgU01DIENvbnRyb2xsZXJzIHRvIG1hcCBj
aGlwcyBvbiB0aGUKQUhCIEJ1cyBoYXMgYSAyNTZNQiBzaXplLiBUaGUgZnVsbCB3aW5kb3cgcmFu
Z2UgaXMKCiAgICBbIDB4MjAwMDAwMDAgLSAweDJGRkZGRkZGIF0gZm9yIHRoZSBGTUMgY29udHJv
bGxlcgogICAgWyAweDMwMDAwMDAwIC0gMHgzRkZGRkZGRiBdIGZvciB0aGUgU1BJIGNvbnRyb2xs
ZXIKClRoaXMgY2hhbmdlIHJlcXVpcmVzIENPTkZJR19WTVNQTElUXzJHIHRvIGJlIHNldC4KClNp
Z25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaQppbmRl
eCA0ZTNmMDU1YjM2NWMuLmE3YjZlMDRkNWYxYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kK
QEAgLTI2LDcgKzI2LDcgQEAKIAogCQlmbWM6IGZsYXNoLWNvbnRyb2xsZXJAMWU2MjAwMDAgewog
CQkJcmVnID0gPCAweDFlNjIwMDAwIDB4OTQKLQkJCQkweDIwMDAwMDAwIDB4MDIwMDAwMDAgPjsK
KwkJCQkweDIwMDAwMDAwIDB4MTAwMDAwMDAgPjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owog
CQkJI3NpemUtY2VsbHMgPSA8MD47CiAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLWZt
YyI7CkBAIC00MSw3ICs0MSw3IEBACiAKIAkJc3BpOiBmbGFzaC1jb250cm9sbGVyQDFlNjMwMDAw
IHsKIAkJCXJlZyA9IDwgMHgxZTYzMDAwMCAweDE4Ci0JCQkJMHgzMDAwMDAwMCAweDAyMDAwMDAw
ID47CisJCQkJMHgzMDAwMDAwMCAweDEwMDAwMDAwID47CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQw
MC1zcGkiOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
