From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 25/29] drm/mediatek: add DPI1 support for mutex
Date: Wed, 20 Jun 2018 16:19:27 +0800
Message-ID: <1529482771-2153-26-git-send-email-stu.hsieh@mediatek.com>
References: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIERQSTEgc3VwcG9ydCBmb3IgbXV0ZXgKClNpZ25lZC1vZmYtYnk6
IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCAwYTFiOTY3Y2FiMWIuLjRjMjAzZDAx
M2Q3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTc2LDYgKzc2
LDcgQEAKICNkZWZpbmUgTVVURVhfU09GX0RTSTAJCQkxCiAjZGVmaW5lIE1VVEVYX1NPRl9EU0kx
CQkJMgogI2RlZmluZSBNVVRFWF9TT0ZfRFBJMAkJCTMKKyNkZWZpbmUgTVVURVhfU09GX0RQSTEJ
CQk0CiAKICNkZWZpbmUgT1ZMMF9NT1VUX0VOX0NPTE9SMAkJMHgxCiAjZGVmaW5lIE9EX01PVVRf
RU5fUkRNQTAJCTB4MQpAQCAtMzg1LDYgKzM4Niw5IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRk
X2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAljYXNlIEREUF9DT01QT05FTlRf
RFBJMDoKIAkJcmVnID0gTVVURVhfU09GX0RQSTA7CiAJCWJyZWFrOworCWNhc2UgRERQX0NPTVBP
TkVOVF9EUEkxOgorCQlyZWcgPSBNVVRFWF9TT0ZfRFBJMTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoK
IAkJaWYgKGRkcC0+bXV0ZXhfbW9kW2lkXSA8IDMyKSB7CiAJCQlvZmZzZXQgPSBESVNQX1JFR19N
VVRFWF9NT0QobXV0ZXgtPmlkKTsKQEAgLTQxNyw2ICs0MjEsNyBAQCB2b2lkIG10a19kaXNwX211
dGV4X3JlbW92ZV9jb21wKHN0cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgsCiAJY2FzZSBERFBf
Q09NUE9ORU5UX0RTSTA6CiAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTE6CiAJY2FzZSBERFBfQ09N
UE9ORU5UX0RQSTA6CisJY2FzZSBERFBfQ09NUE9ORU5UX0RQSTE6CiAJCXdyaXRlbF9yZWxheGVk
KE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKIAkJCSAgICAgICBkZHAtPnJlZ3MgKyBESVNQX1JFR19N
VVRFWF9TT0YobXV0ZXgtPmlkKSk7CiAJCWJyZWFrOwotLSAKMi4xMi41CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
