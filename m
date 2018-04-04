From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 4.18] ARM: dts: BCM5301X: Switch Luxul XWC-1000 to the new
 fixed partitions syntax
Date: Wed,  4 Apr 2018 15:14:21 +0200
Message-ID: <20180404131421.28651-1-zajec5@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBuZXcgc3ludGF4
IGlzIHNsaWdodGx5IGJldHRlciBkZXNpZ25lZCAmIHVzZXMgImNvbXBhdGlibGUiIHN0cmluZy4K
Rm9yIGRldGFpbHMgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9uLnR4dCAuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOC1sdXh1bC14d2MtMTAwMC5kdHMg
fCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOC1sdXh1bC14
d2MtMTAwMC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9iY200NzA4LWx1eHVsLXh3Yy0xMDAwLmR0
cwppbmRleCA1MGQ2NWQ4ZmJkOWEuLjVlZmI2ZjMxMTY0ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvYmNtNDcwOC1sdXh1bC14d2MtMTAwMC5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvYmNtNDcwOC1sdXh1bC14d2MtMTAwMC5kdHMKQEAgLTI2LDkgKzI2LDE1IEBACiAKIAluYW5k
OiBuYW5kQDE4MDI4MDAwIHsKIAkJbmFuZGNzQDAgewotCQkJcGFydGl0aW9uQDAgewotCQkJCWxh
YmVsID0gInViaSI7Ci0JCQkJcmVnID0gPDB4MDAwMDAwMDAgMHgwODAwMDAwMD47CisJCQlwYXJ0
aXRpb25zIHsKKwkJCQljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOworCQkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OworCQkJCSNzaXplLWNlbGxzID0gPDE+OworCisJCQkJcGFydGl0aW9u
QDAgeworCQkJCQlsYWJlbCA9ICJ1YmkiOworCQkJCQlyZWcgPSA8MHgwMDAwMDAwMCAweDA4MDAw
MDAwPjsKKwkJCQl9OwogCQkJfTsKIAkJfTsKIAl9OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
