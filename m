From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 25/28] drm/mediatek: add DSI3 support for mutex
Date: Mon, 11 Jun 2018 11:26:17 +0800
Message-ID: <1528687580-549-26-git-send-email-stu.hsieh@mediatek.com>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgdGhlIERTSTMgc3VwcG9ydCBmb3IgbXV0ZXgKClNpZ25lZC1vZmYtYnk6
IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDFlN2Uz
ODcyZWNjYy4uMjhkZDg1MzFhN2RlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYwpAQCAtNzgsNiArNzgsNyBAQAogI2RlZmluZSBNVVRFWF9TT0ZfRFBJMAkJCTMKICNkZWZp
bmUgTVVURVhfU09GX0RQSTEJCQk0CiAjZGVmaW5lIE1VVEVYX1NPRl9EU0kyCQkJNQorI2RlZmlu
ZSBNVVRFWF9TT0ZfRFNJMwkJCTYKIAogI2RlZmluZSBPVkwwX01PVVRfRU5fQ09MT1IwCQkweDEK
ICNkZWZpbmUgT0RfTU9VVF9FTl9SRE1BMAkJMHgxCkBAIC0zODcsNiArMzg4LDkgQEAgdm9pZCBt
dGtfZGlzcF9tdXRleF9hZGRfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAogCWNh
c2UgRERQX0NPTVBPTkVOVF9EU0kyOgogCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMjsKIAkJYnJlYWs7
CisJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTM6CisJCXJlZyA9IE1VVEVYX1NPRl9EU0kzOworCQli
cmVhazsKIAljYXNlIEREUF9DT01QT05FTlRfRFBJMDoKIAkJcmVnID0gTVVURVhfU09GX0RQSTA7
CiAJCWJyZWFrOwpAQCAtNDI1LDYgKzQyOSw3IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfcmVtb3Zl
X2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAljYXNlIEREUF9DT01QT05FTlRf
RFNJMDoKIAljYXNlIEREUF9DT01QT05FTlRfRFNJMToKIAljYXNlIEREUF9DT01QT05FTlRfRFNJ
MjoKKwljYXNlIEREUF9DT01QT05FTlRfRFNJMzoKIAljYXNlIEREUF9DT01QT05FTlRfRFBJMDoK
IAljYXNlIEREUF9DT01QT05FTlRfRFBJMToKIAkJd3JpdGVsX3JlbGF4ZWQoTVVURVhfU09GX1NJ
TkdMRV9NT0RFLAotLSAKMi4xMi41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
