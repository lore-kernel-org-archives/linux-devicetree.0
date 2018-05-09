From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 2/2] mtd: bcm47xxpart: add of_match_table with a new DT
 binding
Date: Wed,  9 May 2018 10:17:29 +0200
Message-ID: <20180509081729.28347-2-zajec5@gmail.com>
References: <20180509081729.28347-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180509081729.28347-1-zajec5@gmail.com>
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
bmcgYmNtNDd4eHBhcnQgcGFyc2VyIHRvIGZpbmQgcGFydGl0aW9ucyBvbiBmbGFzaApkZXNjcmli
ZWQgaW4gRFQgdXNpbmcgdGhlICJicmNtLGJjbTk0N3h4LWNmZS1wYXJ0aXRpb25zIiBjb21wYXRp
YmxlCnByb3BlcnR5LiBJdCBtZWFucyB0aGlzIHBhcnNlciBkb2Vzbid0IGhhdmUgdG8gYmUgZXhw
bGljaXRseSBzZWxlY3RlZCBieQphIGZsYXNoIGRyaXZlciBhbnltb3JlLiBJdCBjYW4gYmUgdXNl
ZCBlLmcuIHRvZ2V0aGVyIHdpdGggYSBnZW5lcmljCm0yNXA4MCAvIHNwaS1ub3IgaWYgZGV2aWNl
IGlzIGp1c3QgcHJvcGVybHkgZGVzY3JpYmVkLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KVjI6IFNsaWdodGx5IHVwZGF0ZSBjb21taXQgbWVz
c2FnZS4KLS0tCiBkcml2ZXJzL210ZC9iY200N3h4cGFydC5jIHwgNyArKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvYmNtNDd4
eHBhcnQuYyBiL2RyaXZlcnMvbXRkL2JjbTQ3eHhwYXJ0LmMKaW5kZXggMWYwMjM5ODQ4ZWJlLi4w
ZjkzZDIyMzkzNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2JjbTQ3eHhwYXJ0LmMKKysrIGIv
ZHJpdmVycy9tdGQvYmNtNDd4eHBhcnQuYwpAQCAtMzA0LDkgKzMwNCwxNiBAQCBzdGF0aWMgaW50
IGJjbTQ3eHhwYXJ0X3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAogCXJldHVybiBjdXJy
X3BhcnQ7CiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBiY200N3h4cGFy
dF9vZl9tYXRjaF90YWJsZVtdID0geworCXsgLmNvbXBhdGlibGUgPSAiYnJjbSxiY205NDd4eC1j
ZmUtcGFydGl0aW9ucyIgfSwKKwl7fSwKK307CitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBiY200
N3h4cGFydF9vZl9tYXRjaF90YWJsZSk7CisKIHN0YXRpYyBzdHJ1Y3QgbXRkX3BhcnRfcGFyc2Vy
IGJjbTQ3eHhwYXJ0X210ZF9wYXJzZXIgPSB7CiAJLnBhcnNlX2ZuID0gYmNtNDd4eHBhcnRfcGFy
c2UsCiAJLm5hbWUgPSAiYmNtNDd4eHBhcnQiLAorCS5vZl9tYXRjaF90YWJsZSA9IGJjbTQ3eHhw
YXJ0X29mX21hdGNoX3RhYmxlLAogfTsKIG1vZHVsZV9tdGRfcGFydF9wYXJzZXIoYmNtNDd4eHBh
cnRfbXRkX3BhcnNlcik7CiAKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
