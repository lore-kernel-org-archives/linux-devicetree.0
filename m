From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v2 4/6] drm/of: Make drm_of_find_panel_or_bridge() fail when
 the device is disabled
Date: Thu,  3 May 2018 18:40:07 +0200
Message-ID: <20180503164009.14395-5-boris.brezillon@bootlin.com>
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
List-Id: devicetree@vger.kernel.org

VGhlcmUncyBubyBwb2ludCBzZWFyY2hpbmcgZm9yIGEgZHJtX2JyaWRnZSBvciBkcm1fcGFuZWwg
aWYgdGhlIE9GIG5vZGUKd2UncmUgcG9pbnRpbmcgaGFzIGEgc3RhdHVzIHByb3BlcnR5IHRoYXQg
aXMgbm90ICJva2F5IiBvciAib2siLiBKdXN0CnJldHVybiAtRU5PREVWIGluIHRoaXMgY2FzZS4K
ClNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGJvb3RsaW4u
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX29m
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKaW5kZXggZjQxM2ZhZTZmNmRjLi5mOGMxZGE5
NWM2M2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX29mLmMKQEAgLTIzOCw2ICsyMzgsMTEgQEAgaW50IGRybV9vZl9maW5kX3Bh
bmVsX29yX2JyaWRnZShjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCWlmICghcmVtb3Rl
KQogCQlyZXR1cm4gLUVOT0RFVjsKIAorCWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShyZW1v
dGUpKSB7CisJCW9mX25vZGVfcHV0KHJlbW90ZSk7CisJCXJldHVybiAtRU5PREVWOworCX0KKwog
CWlmIChwYW5lbCkgewogCQlzdHJ1Y3QgZHJtX3BhbmVsICp0bXBfcGFuZWw7CiAKLS0gCjIuMTQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
