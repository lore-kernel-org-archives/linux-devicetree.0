From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 2/2] mtd: parsers: trx: add of_match_table with the new DT
 binding
Date: Tue, 26 Jun 2018 00:05:08 +0200
Message-ID: <20180625220508.21242-2-zajec5@gmail.com>
References: <20180612104434.15232-1-zajec5@gmail.com>
 <20180625220508.21242-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180625220508.21242-1-zajec5@gmail.com>
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
QG1pbGVja2kucGw+Ci0tLQpWMjogVXBkYXRlIHRvIHN1cHBvcnQgb25seSB0aGUgImJyY20sdHJ4
IiBiaW5kaW5nCi0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9wYXJzZXJfdHJ4LmMgfCA3ICsrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9wYXJzZXJzL3BhcnNlcl90cnguYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvcGFyc2VyX3Ry
eC5jCmluZGV4IGRmMzYwYTc1ZTFlYi4uZjU4MGE0MWE1MmI4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9wYXJzZXJzL3BhcnNlcl90cnguYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3BhcnNl
cl90cnguYwpAQCAtMTE2LDkgKzExNiwxNiBAQCBzdGF0aWMgaW50IHBhcnNlcl90cnhfcGFyc2Uo
c3RydWN0IG10ZF9pbmZvICptdGQsCiAJcmV0dXJuIGk7CiB9OwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtdGRfcGFyc2VyX3RyeF9vZl9tYXRjaF90YWJsZVtdID0geworCXsg
LmNvbXBhdGlibGUgPSAiYnJjbSx0cngiIH0sCisJe30sCit9OworTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgbXRkX3BhcnNlcl90cnhfb2ZfbWF0Y2hfdGFibGUpOworCiBzdGF0aWMgc3RydWN0IG10
ZF9wYXJ0X3BhcnNlciBtdGRfcGFyc2VyX3RyeCA9IHsKIAkucGFyc2VfZm4gPSBwYXJzZXJfdHJ4
X3BhcnNlLAogCS5uYW1lID0gInRyeCIsCisJLm9mX21hdGNoX3RhYmxlID0gbXRkX3BhcnNlcl90
cnhfb2ZfbWF0Y2hfdGFibGUsCiB9OwogbW9kdWxlX210ZF9wYXJ0X3BhcnNlcihtdGRfcGFyc2Vy
X3RyeCk7CiAKLS0gCjIuMTMuNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
