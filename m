From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V10 3/3] mtd: ofpart: add of_match_table with
 "fixed-partitions"
Date: Wed, 14 Mar 2018 13:10:44 +0100
Message-ID: <20180314121044.12033-4-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhbGxvd3MgdXNp
bmcgdGhpcyBwYXJzZXIgd2l0aCBhbnkgZmxhc2ggZHJpdmVyIHRoYXQgdGFrZXMgY2FyZSBvZgpz
ZXR0aW5nIG9mX25vZGUgKHVzaW5nIG10ZF9zZXRfb2Zfbm9kZSBoZWxwZXIpIGNvcnJlY3RseS4g
VXAgdG8gbm93CnN1cHBvcnQgZm9yICJmaXhlZC1wYXJ0aXRpb25zIiBEVCBjb21wYXRpYmlsaXR5
IHN0cmluZyB3YXMgd29ya2luZyBvbmx5CndpdGggZmxhc2ggZHJpdmVycyB0aGF0IHdlcmUgc3Bl
Y2lmeWluZyAib2ZwYXJ0IiAobWFudWFsbHkgb3IgYnkgbGV0dGluZwptdGQgdXNlIHRoZSBkZWZh
dWx0IHNldCBvZiBwYXJzZXJzKS4KClRoaXMgbWF0Y2hlcyBleGlzdGluZyBiaW5kaW5ncyBkb2N1
bWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgpSZXZpZXdlZC1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5j
b20+ClRlc3RlZC1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9tdGQvb2ZwYXJ0LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9vZnBhcnQuYyBiL2RyaXZl
cnMvbXRkL29mcGFydC5jCmluZGV4IDlmNDk3MzE1ZTY1ZC4uNjE1ZjhjMTczMTYyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9vZnBhcnQuYworKysgYi9kcml2ZXJzL210ZC9vZnBhcnQuYwpAQCAt
MTQwLDkgKzE0MCwxNiBAQCBzdGF0aWMgaW50IHBhcnNlX2ZpeGVkX3BhcnRpdGlvbnMoc3RydWN0
IG10ZF9pbmZvICptYXN0ZXIsCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcGFyc2Vfb2ZwYXJ0X21hdGNoX3RhYmxlW10gPSB7CisJeyAuY29tcGF0
aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIiB9LAorCXt9LAorfTsKK01PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHBhcnNlX29mcGFydF9tYXRjaF90YWJsZSk7CisKIHN0YXRpYyBzdHJ1Y3QgbXRkX3Bh
cnRfcGFyc2VyIG9mcGFydF9wYXJzZXIgPSB7CiAJLnBhcnNlX2ZuID0gcGFyc2VfZml4ZWRfcGFy
dGl0aW9ucywKIAkubmFtZSA9ICJmaXhlZC1wYXJ0aXRpb25zIiwKKwkub2ZfbWF0Y2hfdGFibGUg
PSBwYXJzZV9vZnBhcnRfbWF0Y2hfdGFibGUsCiB9OwogCiBzdGF0aWMgaW50IHBhcnNlX29mb2xk
cGFydF9wYXJ0aXRpb25zKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
