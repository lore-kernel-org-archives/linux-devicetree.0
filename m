From: y@pengutronix.de
Subject: [PATCH 05/11] gpio/gpio-omap.c: add a const qualifier
Date: Fri, 13 Jul 2012 14:32:08 +0200
Message-ID: <16300.9267570034$1342183823@news.gmane.org>
References: <1342182734-321-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342182734-321-1-git-send-email-y>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@stericsson.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, kernel@pengutronix.de, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoaXMgcHJlcGFyZXMgb2ZfZGV2aWNlX2lkLmRhdGEgYmVjb21pbmcgY29uc3QuIFdpdGhvdXQg
dGhpcyBjaGFuZ2UKdGhlIGZvbGxvd2luZyB3YXJuaW5nIHdvdWxkIG9jY3VyOgoKCWRyaXZlcnMv
Z3Bpby9ncGlvLW9tYXAuYzogSW4gZnVuY3Rpb24gJ29tYXBfZ3Bpb19wcm9iZSc6Cglkcml2ZXJz
L2dwaW8vZ3Bpby1vbWFwLmM6MTA2MDogd2FybmluZzogYXNzaWdubWVudCBkaXNjYXJkcyBxdWFs
aWZpZXJzIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZQoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAc3Rlcmljc3Nvbi5jb20+Ci0tLQogZHJpdmVycy9ncGlvL2dwaW8t
b21hcC5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tb21hcC5jIGIvZHJpdmVycy9n
cGlvL2dwaW8tb21hcC5jCmluZGV4IGM0ZWQxNzIuLjAxOWNiN2IgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3Bpby9ncGlvLW9tYXAuYworKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmMKQEAgLTEw
NTAsNyArMTA1MCw3IEBAIHN0YXRpYyBpbnQgX19kZXZpbml0IG9tYXBfZ3Bpb19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7CiAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOwogCWNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOwotCXN0cnVjdCBvbWFwX2dwaW9fcGxhdGZvcm1fZGF0
YSAqcGRhdGE7CisJY29uc3Qgc3RydWN0IG9tYXBfZ3Bpb19wbGF0Zm9ybV9kYXRhICpwZGF0YTsK
IAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlzdHJ1Y3QgZ3Bpb19iYW5rICpiYW5rOwogCWludCBy
ZXQgPSAwOwotLSAKMS43LjEwLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
