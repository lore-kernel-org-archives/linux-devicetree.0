From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC v5 11/12] clk: mediatek: Add hdmi_ref HDMI PHY PLL reference
 clock output
Date: Wed,  4 Nov 2015 12:45:08 +0100
Message-ID: <1446637509-6418-12-git-send-email-p.zabel@pengutronix.de>
References: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

VGhlIGNvbmZpZ3VyYWJsZSBoZG1pX3JlZiBvdXRwdXQgb2YgdGhlIFBMTCBibG9jayBpcyBkZXJp
dmVkIGZyb20KdGhlIHR2ZHBsbF81OTRtIGNsb2NrIHNpZ25hbCB2aWEgYSBjb25maWd1cmFibGUg
UExMIHBvc3QtZGl2aWRlci4KSXQgaXMgdXNlZCBhcyB0aGUgUExMIHJlZmVyZW5jZSBpbnB1dCB0
byB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTcz
LmMgICAgICB8IDUgKysrKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTczLWNsay5o
IHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jIGIvZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jCmluZGV4IGU3YjM5OTcuLmZlN2E5MWIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYworKysgYi9kcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ4MTczLmMKQEAgLTkwMSw2ICs5MDEsMTEgQEAgc3RhdGljIHZvaWQg
X19pbml0IG10a19hcG1peGVkc3lzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCQlj
bGtfZGF0YS0+Y2xrc1tja3UtPmlkXSA9IGNsazsKIAl9CiAKKwljbGsgPSBjbGtfcmVnaXN0ZXJf
ZGl2aWRlcihOVUxMLCAiaGRtaV9yZWYiLCAidHZkcGxsXzU5NG0iLCAwLAorCQkJCSAgIGJhc2Ug
KyAweDQwLCAxNiwgMywgQ0xLX0RJVklERVJfUE9XRVJfT0ZfVFdPLAorCQkJCSAgIE5VTEwpOwor
CWNsa19kYXRhLT5jbGtzW0NMS19BUE1JWEVEX0hETUlfUkVGXSA9IGNsazsKKwogCXIgPSBvZl9j
bGtfYWRkX3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsK
IAlpZiAocikKIAkJcHJfZXJyKCIlcygpOiBjb3VsZCBub3QgcmVnaXN0ZXIgY2xvY2sgcHJvdmlk
ZXI6ICVkXG4iLApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMt
Y2xrLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaAppbmRleCBiZjEz
MDJlLi43ODRlOTg3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3
My1jbGsuaAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaApAQCAt
MTczLDcgKzE3Myw4IEBACiAjZGVmaW5lIENMS19BUE1JWEVEX0xWRFNQTEwJCTEzCiAjZGVmaW5l
IENMS19BUE1JWEVEX01TRENQTEwyCQkxNAogI2RlZmluZSBDTEtfQVBNSVhFRF9SRUYyVVNCX1RY
CQkxNQotI2RlZmluZSBDTEtfQVBNSVhFRF9OUl9DTEsJCTE2CisjZGVmaW5lIENMS19BUE1JWEVE
X0hETUlfUkVGCQkxNgorI2RlZmluZSBDTEtfQVBNSVhFRF9OUl9DTEsJCTE3CiAKIC8qIElORlJB
X1NZUyAqLwogCi0tIAoyLjYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
