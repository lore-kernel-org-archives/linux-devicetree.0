From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/3] mtd: name the mtd device with an optional label property
Date: Mon, 16 Jan 2017 14:27:03 +0100
Message-ID: <1484573225-19095-2-git-send-email-clg@kaod.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

VGhpcyBjYW4gYmUgdXNlZCB0byBlYXNpbHkgaWRlbnRpZnkgYSBzcGVjaWZpYyBjaGlwIG9uIGEg
c3lzdGVtIHdpdGgKbXVsdGlwbGUgY2hpcHMuCgpTdWdnZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KU2lnbmVkLW9mZi1ieTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKaW5kZXggMDUy
NzcyZjdjYWVmLi5iZjYxNTU3YjU5OWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YworKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTY1NCw2ICs2NTQsMTMgQEAgc3RhdGlj
IGludCBtdGRfYWRkX2RldmljZV9wYXJ0aXRpb25zKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAogICov
CiBzdGF0aWMgdm9pZCBtdGRfc2V0X2Rldl9kZWZhdWx0cyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkK
IHsKKwkvKgorCSAqIElmIERUIHN1cHBvcnQgaXMgZW5hYmxlZCBhbmQgd2UgaGF2ZSBhIHZhbGlk
IG9mX25vZGUgcG9pbnRlciwgdHJ5IHRvCisJICogZXh0cmFjdCB0aGUgTVREIG5hbWUgZnJvbSB0
aGUgbGFiZWwgcHJvcGVydHkuCisJICovCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX09GKSAmJiBt
dGQtPmRldi5vZl9ub2RlKQorCQlvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhtdGQtPmRldi5vZl9u
b2RlLCAibGFiZWwiLCAmbXRkLT5uYW1lKTsKKwogCWlmIChtdGQtPmRldi5wYXJlbnQpIHsKIAkJ
aWYgKCFtdGQtPm93bmVyICYmIG10ZC0+ZGV2LnBhcmVudC0+ZHJpdmVyKQogCQkJbXRkLT5vd25l
ciA9IG10ZC0+ZGV2LnBhcmVudC0+ZHJpdmVyLT5vd25lcjsKLS0gCjIuNy40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
