From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v8 01/21] clk: divider: Correct parent clk round rate if
 no bestdiv is normally found
Date: Wed, 31 Dec 2014 16:23:19 +0800
Message-ID: <1420014219-915-2-git-send-email-Ying.Liu@freescale.com>
References: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

SWYgbm8gYmVzdCBkaXZpZGVyIGlzIG5vcm1hbGx5IGZvdW5kLCB3ZSB3aWxsIHRyeSB0byB1c2Ug
dGhlIG1heGltdW0gZGl2aWRlci4KV2Ugc2hvdWxkIG5vdCBzZXQgdGhlIHBhcmVudCBjbG9jayBy
YXRlIHRvIGJlIDFIeiBieSBmb3JjZSBmb3IgYmVpbmcgcm91bmRlZC4KSW5zdGVhZCwgd2Ugc2hv
dWxkIHRha2UgdGhlIG1heGltdW0gZGl2aWRlciBhcyBhIGJhc2UgYW5kIGNhbGN1bGF0ZSBhIGNv
cnJlY3QKcGFyZW50IGNsb2NrIHJhdGUgZm9yIGJlaW5nIHJvdW5kZWQuCgpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWluZyA8WWluZy5MaXVAZnJlZXNjYWxlLmNvbT4KLS0tCnY3LT52ODoKICogTm9uZS4K
CnY2LT52NzoKICogTm9uZS4KCnY1LT52NjoKICogTm9uZS4KCnY0LT52NToKICogTm9uZS4KCnYz
LT52NDoKICogTm9uZS4KCnYyLT52MzoKICogTm9uZS4KCnYxLT52MjoKICogTm9uZS4KCiBkcml2
ZXJzL2Nsay9jbGstZGl2aWRlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRl
ci5jIGIvZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYwppbmRleCBjMGE4NDJiLi5mNjQxZDRiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jCisrKyBiL2RyaXZlcnMvY2xrL2Ns
ay1kaXZpZGVyLmMKQEAgLTMxMSw3ICszMTEsOCBAQCBzdGF0aWMgaW50IGNsa19kaXZpZGVyX2Jl
c3RkaXYoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKIAogCWlmICghYmVz
dGRpdikgewogCQliZXN0ZGl2ID0gX2dldF9tYXhkaXYoZGl2aWRlcik7Ci0JCSpiZXN0X3BhcmVu
dF9yYXRlID0gX19jbGtfcm91bmRfcmF0ZShfX2Nsa19nZXRfcGFyZW50KGh3LT5jbGspLCAxKTsK
KwkJKmJlc3RfcGFyZW50X3JhdGUgPSBfX2Nsa19yb3VuZF9yYXRlKF9fY2xrX2dldF9wYXJlbnQo
aHctPmNsayksCisJCQkJCQlNVUxUX1JPVU5EX1VQKHJhdGUsIGJlc3RkaXYpKTsKIAl9CiAKIAly
ZXR1cm4gYmVzdGRpdjsKLS0gCjIuMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
