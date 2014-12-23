From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v4 01/21] clk: divider: Correct parent clk round rate if
 no bestdiv is normally found
Date: Tue, 23 Dec 2014 18:01:59 +0800
Message-ID: <1419328939-22758-2-git-send-email-Ying.Liu@freescale.com>
References: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

SWYgbm8gYmVzdCBkaXZpZGVyIGlzIG5vcm1hbGx5IGZvdW5kLCB3ZSB3aWxsIHRyeSB0byB1c2Ug
dGhlIG1heGltdW0gZGl2aWRlci4KV2Ugc2hvdWxkIG5vdCBzZXQgdGhlIHBhcmVudCBjbG9jayBy
YXRlIHRvIGJlIDFIeiBieSBmb3JjZSBmb3IgYmVpbmcgcm91bmRlZC4KSW5zdGVhZCwgd2Ugc2hv
dWxkIHRha2UgdGhlIG1heGltdW0gZGl2aWRlciBhcyBhIGJhc2UgYW5kIGNhbGN1bGF0ZSBhIGNv
cnJlY3QKcGFyZW50IGNsb2NrIHJhdGUgZm9yIGJlaW5nIHJvdW5kZWQuCgpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWluZyA8WWluZy5MaXVAZnJlZXNjYWxlLmNvbT4KLS0tCnYzLT52NDoKICogTm9uZS4K
CnYyLT52MzoKICogTm9uZS4KCnYxLT52MjoKICogTm9uZS4KCiBkcml2ZXJzL2Nsay9jbGstZGl2
aWRlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIGIvZHJpdmVycy9j
bGsvY2xrLWRpdmlkZXIuYwppbmRleCBjMGE4NDJiLi5mNjQxZDRiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Nsay9jbGstZGl2aWRlci5jCisrKyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMKQEAg
LTMxMSw3ICszMTEsOCBAQCBzdGF0aWMgaW50IGNsa19kaXZpZGVyX2Jlc3RkaXYoc3RydWN0IGNs
a19odyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKIAogCWlmICghYmVzdGRpdikgewogCQliZXN0
ZGl2ID0gX2dldF9tYXhkaXYoZGl2aWRlcik7Ci0JCSpiZXN0X3BhcmVudF9yYXRlID0gX19jbGtf
cm91bmRfcmF0ZShfX2Nsa19nZXRfcGFyZW50KGh3LT5jbGspLCAxKTsKKwkJKmJlc3RfcGFyZW50
X3JhdGUgPSBfX2Nsa19yb3VuZF9yYXRlKF9fY2xrX2dldF9wYXJlbnQoaHctPmNsayksCisJCQkJ
CQlNVUxUX1JPVU5EX1VQKHJhdGUsIGJlc3RkaXYpKTsKIAl9CiAKIAlyZXR1cm4gYmVzdGRpdjsK
LS0gCjIuMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
