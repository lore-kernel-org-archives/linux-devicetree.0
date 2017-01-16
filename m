From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Mon, 16 Jan 2017 22:00:39 +0100
Message-ID: <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, kernel@pengutronix.de, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIE1SMjUgZmFtaWx5IGRvZXNuJ3Qgc3VwcG9ydCBKRURFQywgc28gdGhleSBuZWVkIGV4cGxp
Y2l0IG1lbnRpb25pbmcKaW4gdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHNwaSBJRHMuIFRoaXMgbWFr
ZXMgaXQgcG9zc2libGUgdG8gYWRkIHRoZXNlCnVzaW5nIGZvciBleGFtcGxlOgoKCWNvbXBhdGli
bGUgPSAiZXZlcnNwaW4sbXIyNWg0MCI7CgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KQ2hhbmdlcyBzaW5jZSAoaW1w
bGljaXQpIHYxOgogLSB1c2UgS2liIGluc3RlYWQgb2Yga2liCgogZHJpdmVycy9tdGQvZGV2aWNl
cy9tMjVwODAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jIGIvZHJpdmVycy9tdGQvZGV2
aWNlcy9tMjVwODAuYwppbmRleCA5Y2Y3ZmNkMjgwMzQuLmFhNTBiZDk2ZGUzYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9tMjVwODAuYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2Vz
L20yNXA4MC5jCkBAIC0zMDUsNiArMzA1LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2Rl
dmljZV9pZCBtMjVwX2lkc1tdID0gewogCXsibTI1cDQwLW5vbmplZGVjIn0sCXsibTI1cDgwLW5v
bmplZGVjIn0sCXsibTI1cDE2LW5vbmplZGVjIn0sCiAJeyJtMjVwMzItbm9uamVkZWMifSwJeyJt
MjVwNjQtbm9uamVkZWMifSwJeyJtMjVwMTI4LW5vbmplZGVjIn0sCiAKKwkvKiBFdmVyc3BpbiBN
UkFNcyAqLworCXsgIm1yMjVoMjU2IiB9LCAvKiAyNTYgS2liLCA0MCBNSHogKi8KKwl7ICJtcjI1
aDEwIiB9LCAgLyogICAxIE1pYiwgNDAgTUh6ICovCisJeyAibXIyNWg0MCIgfSwgIC8qICAgNCBN
aWIsIDQwIE1IeiAqLworCiAJeyB9LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBtMjVw
X2lkcyk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
