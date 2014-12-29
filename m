From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v6 01/21] clk: divider: Correct parent clk round rate if
 no bestdiv is normally found
Date: Mon, 29 Dec 2014 14:39:08 +0800
Message-ID: <1419835168-9034-2-git-send-email-Ying.Liu@freescale.com>
References: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
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
OiBMaXUgWWluZyA8WWluZy5MaXVAZnJlZXNjYWxlLmNvbT4KLS0tCnY1LT52NjoKICogTm9uZS4K
CnY0LT52NToKICogTm9uZS4KCnYzLT52NDoKICogTm9uZS4KCnYyLT52MzoKICogTm9uZS4KCnYx
LT52MjoKICogTm9uZS4KCiBkcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIGIvZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYwppbmRl
eCBjMGE4NDJiLi5mNjQxZDRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5j
CisrKyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMKQEAgLTMxMSw3ICszMTEsOCBAQCBzdGF0
aWMgaW50IGNsa19kaXZpZGVyX2Jlc3RkaXYoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxv
bmcgcmF0ZSwKIAogCWlmICghYmVzdGRpdikgewogCQliZXN0ZGl2ID0gX2dldF9tYXhkaXYoZGl2
aWRlcik7Ci0JCSpiZXN0X3BhcmVudF9yYXRlID0gX19jbGtfcm91bmRfcmF0ZShfX2Nsa19nZXRf
cGFyZW50KGh3LT5jbGspLCAxKTsKKwkJKmJlc3RfcGFyZW50X3JhdGUgPSBfX2Nsa19yb3VuZF9y
YXRlKF9fY2xrX2dldF9wYXJlbnQoaHctPmNsayksCisJCQkJCQlNVUxUX1JPVU5EX1VQKHJhdGUs
IGJlc3RkaXYpKTsKIAl9CiAKIAlyZXR1cm4gYmVzdGRpdjsKLS0gCjIuMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
