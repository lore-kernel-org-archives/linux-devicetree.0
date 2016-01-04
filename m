From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 11/13] clk: mediatek: Add hdmi_ref HDMI PHY PLL reference
 clock output
Date: Mon,  4 Jan 2016 18:36:43 +0100
Message-ID: <1451929005-16372-12-git-send-email-p.zabel@pengutronix.de>
References: <1451929005-16372-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1451929005-16372-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

VGhlIGNvbmZpZ3VyYWJsZSBoZG1pX3JlZiBvdXRwdXQgb2YgdGhlIFBMTCBibG9jayBpcyBkZXJp
dmVkIGZyb20KdGhlIHR2ZHBsbF81OTRtIGNsb2NrIHNpZ25hbCB2aWEgYSBjb25maWd1cmFibGUg
UExMIHBvc3QtZGl2aWRlci4KSXQgaXMgdXNlZCBhcyB0aGUgUExMIHJlZmVyZW5jZSBpbnB1dCB0
byB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4KQWNrZWQtYnk6IEphbWVzIExpYW8gPGphbWVzamoubGlhb0Bt
ZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jICAgICAg
fCA1ICsrKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaCB8IDMgKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyBiL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDgxNzMuYwppbmRleCA2ODJiMjc1Li4zYWUwYjg4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMKKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLW10ODE3My5jCkBAIC0xMDkxLDYgKzEwOTEsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0
IG10a19hcG1peGVkc3lzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCQljbGtfZGF0
YS0+Y2xrc1tja3UtPmlkXSA9IGNsazsKIAl9CiAKKwljbGsgPSBjbGtfcmVnaXN0ZXJfZGl2aWRl
cihOVUxMLCAiaGRtaV9yZWYiLCAidHZkcGxsXzU5NG0iLCAwLAorCQkJCSAgIGJhc2UgKyAweDQw
LCAxNiwgMywgQ0xLX0RJVklERVJfUE9XRVJfT0ZfVFdPLAorCQkJCSAgIE5VTEwpOworCWNsa19k
YXRhLT5jbGtzW0NMS19BUE1JWEVEX0hETUlfUkVGXSA9IGNsazsKKwogCXIgPSBvZl9jbGtfYWRk
X3Byb3ZpZGVyKG5vZGUsIG9mX2Nsa19zcmNfb25lY2VsbF9nZXQsIGNsa19kYXRhKTsKIAlpZiAo
cikKIAkJcHJfZXJyKCIlcygpOiBjb3VsZCBub3QgcmVnaXN0ZXIgY2xvY2sgcHJvdmlkZXI6ICVk
XG4iLApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxNzMtY2xrLmgg
Yi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaAppbmRleCA3OTU2YmExLi42
MDk0YmY3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsu
aAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL210ODE3My1jbGsuaApAQCAtMTc2LDcg
KzE3Niw4IEBACiAjZGVmaW5lIENMS19BUE1JWEVEX0xWRFNQTEwJCTEzCiAjZGVmaW5lIENMS19B
UE1JWEVEX01TRENQTEwyCQkxNAogI2RlZmluZSBDTEtfQVBNSVhFRF9SRUYyVVNCX1RYCQkxNQot
I2RlZmluZSBDTEtfQVBNSVhFRF9OUl9DTEsJCTE2CisjZGVmaW5lIENMS19BUE1JWEVEX0hETUlf
UkVGCQkxNgorI2RlZmluZSBDTEtfQVBNSVhFRF9OUl9DTEsJCTE3CiAKIC8qIElORlJBX1NZUyAq
LwogCi0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
