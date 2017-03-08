From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 8/9] drm/imx: enable/disable PRG on CRTC enable/disable
Date: Wed,  8 Mar 2017 12:13:20 +0100
Message-ID: <20170308111321.3035-8-l.stach@pengutronix.de>
References: <20170308111321.3035-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170308111321.3035-1-l.stach@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

T24gaS5NWDYgUXVhZFBsdXMgdGhlIFBSRyBuZWVkcyB0byBiZSBjbG9ja2VkIGluIG9yZGVyIHRv
IHBhc3MKdGhyb3VnaCB0aGUgZGF0YSBhY2Nlc3MgcmVxdWVzdHMgZnJvbSB0aGUgSURNQUMuIFRo
aXMgY2FsbCBpcyBhCm5vLW9wIGZvciBvdGhlciBhbGwgb3RoZXIgU29Dcy4KClNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pbXgvaXB1djMtY3J0Yy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIGIvZHJp
dmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKaW5kZXggMGYxNWYxMWYyNmUwLi4wOTczZDU2
YTI4ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCkBAIC01NSw2ICs1NSw3IEBAIHN0YXRp
YyB2b2lkIGlwdV9jcnRjX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0IGlw
dV9jcnRjICppcHVfY3J0YyA9IHRvX2lwdV9jcnRjKGNydGMpOwogCXN0cnVjdCBpcHVfc29jICpp
cHUgPSBkZXZfZ2V0X2RydmRhdGEoaXB1X2NydGMtPmRldi0+cGFyZW50KTsKIAorCWlwdV9wcmdf
ZW5hYmxlKGlwdSk7CiAJaXB1X2RjX2VuYWJsZShpcHUpOwogCWlwdV9kY19lbmFibGVfY2hhbm5l
bChpcHVfY3J0Yy0+ZGMpOwogCWlwdV9kaV9lbmFibGUoaXB1X2NydGMtPmRpKTsKQEAgLTk1LDYg
Kzk2LDcgQEAgc3RhdGljIHZvaWQgaXB1X2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9j
cnRjICpjcnRjLAogCSAqLwogCWlwdV9jcnRjX2Rpc2FibGVfcGxhbmVzKGlwdV9jcnRjLCBvbGRf
Y3J0Y19zdGF0ZSk7CiAJaXB1X2RjX2Rpc2FibGUoaXB1KTsKKwlpcHVfcHJnX2Rpc2FibGUoaXB1
KTsKIAogCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7CiAJaWYgKGNydGMt
PnN0YXRlLT5ldmVudCkgewotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
