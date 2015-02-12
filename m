From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate if
 no bestdiv is normally found
Date: Thu, 12 Feb 2015 14:01:24 +0800
Message-ID: <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SWYgbm8gYmVzdCBkaXZpZGVyIGlzIG5vcm1hbGx5IGZvdW5kLCB3ZSB3aWxsIHRyeSB0byB1c2Ug
dGhlIG1heGltdW0gZGl2aWRlci4KV2Ugc2hvdWxkIG5vdCBzZXQgdGhlIHBhcmVudCBjbG9jayBy
YXRlIHRvIGJlIDFIeiBieSBmb3JjZSBmb3IgYmVpbmcgcm91bmRlZC4KSW5zdGVhZCwgd2Ugc2hv
dWxkIHRha2UgdGhlIG1heGltdW0gZGl2aWRlciBhcyBhIGJhc2UgYW5kIGNhbGN1bGF0ZSBhIGNv
cnJlY3QKcGFyZW50IGNsb2NrIHJhdGUgZm9yIGJlaW5nIHJvdW5kZWQuCgpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWluZyA8WWluZy5MaXVAZnJlZXNjYWxlLmNvbT4KLS0tCnY4LT52OToKICogUmViYXNl
IG9udG8gdGhlIGlteC1kcm0vbmV4dCBicmFuY2ggb2YgUGhpbGlwcCBaYWJlbCdzIG9wZW4gZ2l0
IHJlcG9zaXRvcnkuCgp2Ny0+djg6CiAqIE5vbmUuCgp2Ni0+djc6CiAqIE5vbmUuCgp2NS0+djY6
CiAqIE5vbmUuCgp2NC0+djU6CiAqIE5vbmUuCgp2My0+djQ6CiAqIE5vbmUuCgp2Mi0+djM6CiAq
IE5vbmUuCgp2MS0+djI6CiAqIE5vbmUuCgogZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZp
ZGVyLmMKaW5kZXggYzBhODQyYi4uZjY0MWQ0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xr
LWRpdmlkZXIuYworKysgYi9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jCkBAIC0zMTEsNyArMzEx
LDggQEAgc3RhdGljIGludCBjbGtfZGl2aWRlcl9iZXN0ZGl2KHN0cnVjdCBjbGtfaHcgKmh3LCB1
bnNpZ25lZCBsb25nIHJhdGUsCiAKIAlpZiAoIWJlc3RkaXYpIHsKIAkJYmVzdGRpdiA9IF9nZXRf
bWF4ZGl2KGRpdmlkZXIpOwotCQkqYmVzdF9wYXJlbnRfcmF0ZSA9IF9fY2xrX3JvdW5kX3JhdGUo
X19jbGtfZ2V0X3BhcmVudChody0+Y2xrKSwgMSk7CisJCSpiZXN0X3BhcmVudF9yYXRlID0gX19j
bGtfcm91bmRfcmF0ZShfX2Nsa19nZXRfcGFyZW50KGh3LT5jbGspLAorCQkJCQkJTVVMVF9ST1VO
RF9VUChyYXRlLCBiZXN0ZGl2KSk7CiAJfQogCiAJcmV0dXJuIGJlc3RkaXY7Ci0tIAoyLjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
