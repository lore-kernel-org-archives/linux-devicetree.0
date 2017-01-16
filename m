From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
Date: Mon, 16 Jan 2017 14:27:05 +0100
Message-ID: <1484573225-19095-4-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1484573225-19095-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Robert Lippert <roblip@gmail.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Robert Lippert <rlippert@google.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

RnJvbTogUm9iZXJ0IExpcHBlcnQgPHJvYmxpcEBnbWFpbC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgTGlwcGVydCA8cmxpcHBlcnRAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1u
b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMKaW5kZXggZGE3Y2Q2OWQ0ODU3Li43NzU3ODhmOTgyOGEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCisrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jCkBAIC04NzYsNyArODc2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmbGFzaF9pbmZvIHNwaV9ub3JfaWRzW10gPSB7CiAJeyAibXgyNWwyNTYzNWUiLCBJTkZPKDB4
YzIyMDE5LCAwLCA2NCAqIDEwMjQsIDUxMiwgMCkgfSwKIAl7ICJteDI1dTI1NjM1ZiIsIElORk8o
MHhjMjI1MzksIDAsIDY0ICogMTAyNCwgNTEyLCBTRUNUXzRLKSB9LAogCXsgIm14MjVsMjU2NTVl
IiwgSU5GTygweGMyMjYxOSwgMCwgNjQgKiAxMDI0LCA1MTIsIDApIH0sCi0JeyAibXg2Nmw1MTIz
NWwiLCBJTkZPKDB4YzIyMDFhLCAwLCA2NCAqIDEwMjQsIDEwMjQsIFNQSV9OT1JfUVVBRF9SRUFE
KSB9LAorCXsgIm14NjZsNTEyMzVsIiwgSU5GTygweGMyMjAxYSwgMCwgNjQgKiAxMDI0LCAxMDI0
LCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAogCXsgIm14NjZsMWc1
NWciLCAgSU5GTygweGMyMjYxYiwgMCwgNjQgKiAxMDI0LCAyMDQ4LCBTUElfTk9SX1FVQURfUkVB
RCkgfSwKIAogCS8qIE1pY3JvbiAqLwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
