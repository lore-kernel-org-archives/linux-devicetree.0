From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/2] mtd: parsers: trx: add of_match_table with the new DT
 binding
Date: Tue, 12 Jun 2018 12:44:34 +0200
Message-ID: <20180612104434.15232-2-zajec5@gmail.com>
References: <20180612104434.15232-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180612104434.15232-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Jonas Gorski <jonas.gorski@gmail.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhbGxvd3MgdXNp
bmcgVFJYIHBhcnNlciB0byBmaW5kIFRSWCBwYXJ0aXRpb25zIG9uIGZsYXNoIGRldmljZQpkZXNj
cmliZWQgaW4gRFQgdXNpbmcgYSBwcm9wZXIgYmluZGluZy4gSXQncyB1c2VmdWwgZm9yIGRldmlj
ZXMgc3RvcmluZwpmaXJtd2FyZSBvbiBhIHNlcGFyYXRlZCBmbGFzaCBhbmQgaGF2aW5nIHJvb3Rm
cyBwYXJ0aXRpb24gaW4gaXQuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Ci0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgfCA4ICsr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3BhcnNl
cl90cnguYwppbmRleCBkZjM2MGE3NWUxZWIuLmU0ZmMzNjExMTEwYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMKKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9w
YXJzZXJfdHJ4LmMKQEAgLTExNiw5ICsxMTYsMTcgQEAgc3RhdGljIGludCBwYXJzZXJfdHJ4X3Bh
cnNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogCXJldHVybiBpOwogfTsKIAorc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRkX3BhcnNlcl90cnhfb2ZfbWF0Y2hfdGFibGVbXSA9IHsK
Kwl7IC5jb21wYXRpYmxlID0gImJyY20sdHJ4IiB9LAorCXsgLmNvbXBhdGlibGUgPSAiYnJjbSx0
cngtdjEiIH0sCisJe30sCit9OworTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRkX3BhcnNlcl90
cnhfb2ZfbWF0Y2hfdGFibGUpOworCiBzdGF0aWMgc3RydWN0IG10ZF9wYXJ0X3BhcnNlciBtdGRf
cGFyc2VyX3RyeCA9IHsKIAkucGFyc2VfZm4gPSBwYXJzZXJfdHJ4X3BhcnNlLAogCS5uYW1lID0g
InRyeCIsCisJLm9mX21hdGNoX3RhYmxlID0gbXRkX3BhcnNlcl90cnhfb2ZfbWF0Y2hfdGFibGUs
CiB9OwogbW9kdWxlX210ZF9wYXJ0X3BhcnNlcihtdGRfcGFyc2VyX3RyeCk7CiAKLS0gCjIuMTMu
NwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
