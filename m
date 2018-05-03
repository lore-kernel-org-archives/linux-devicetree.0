From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v2 1/6] drm/tegra: Fix a device_node leak when the DRM panel
 is not found
Date: Thu,  3 May 2018 18:40:04 +0200
Message-ID: <20180503164009.14395-2-boris.brezillon@bootlin.com>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

b2Zfbm9kZV9wdXQocGFuZWwpIGlzIG5vdCBjYWxsZWQgd2hlbiBvZl9kcm1fZmluZF9wYW5lbChw
YW5lbCkgcmV0dXJucwpOVUxMLCB0aHVzIGxlYWtpbmcgdGhlIHJlZmVyZW5jZSB3ZSBob2xkIG9u
IHBhbmVsLgoKRml4ZXM6IDliZTdkODY0Y2YwNyAoImRybS90ZWdyYTogSW1wbGVtZW50IHBhbmVs
IHN1cHBvcnQiKQpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L291dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCmluZGV4IGZmZTM0YmQw
YmI5ZC4uNjc2ZmQzOTQ4MzZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0
cHV0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jCkBAIC0xMTAsMTAgKzEx
MCw5IEBAIGludCB0ZWdyYV9vdXRwdXRfcHJvYmUoc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0
KQogCXBhbmVsID0gb2ZfcGFyc2VfcGhhbmRsZShvdXRwdXQtPm9mX25vZGUsICJudmlkaWEscGFu
ZWwiLCAwKTsKIAlpZiAocGFuZWwpIHsKIAkJb3V0cHV0LT5wYW5lbCA9IG9mX2RybV9maW5kX3Bh
bmVsKHBhbmVsKTsKKwkJb2Zfbm9kZV9wdXQocGFuZWwpOwogCQlpZiAoIW91dHB1dC0+cGFuZWwp
CiAJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKLQotCQlvZl9ub2RlX3B1dChwYW5lbCk7CiAJfQog
CiAJb3V0cHV0LT5lZGlkID0gb2ZfZ2V0X3Byb3BlcnR5KG91dHB1dC0+b2Zfbm9kZSwgIm52aWRp
YSxlZGlkIiwgJnNpemUpOwotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
