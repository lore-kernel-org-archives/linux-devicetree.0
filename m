From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 26/29] drm/mediatek: add DSI2 support for mutex
Date: Wed, 20 Jun 2018 16:19:28 +0800
Message-ID: <1529482771-2153-27-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIERTSTIgc3VwcG9ydCBmb3IgbXV0ZXgKClNpZ25lZC1vZmYtYnk6
IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCA0YzIwM2QwMTNkN2MuLmEwYjUyNmIx
NmRhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTc3LDYgKzc3
LDcgQEAKICNkZWZpbmUgTVVURVhfU09GX0RTSTEJCQkyCiAjZGVmaW5lIE1VVEVYX1NPRl9EUEkw
CQkJMwogI2RlZmluZSBNVVRFWF9TT0ZfRFBJMQkJCTQKKyNkZWZpbmUgTVVURVhfU09GX0RTSTIJ
CQk1CiAKICNkZWZpbmUgT1ZMMF9NT1VUX0VOX0NPTE9SMAkJMHgxCiAjZGVmaW5lIE9EX01PVVRf
RU5fUkRNQTAJCTB4MQpAQCAtMzgzLDYgKzM4NCw5IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRk
X2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAljYXNlIEREUF9DT01QT05FTlRf
RFNJMToKIAkJcmVnID0gTVVURVhfU09GX0RTSTA7CiAJCWJyZWFrOworCWNhc2UgRERQX0NPTVBP
TkVOVF9EU0kyOgorCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMjsKKwkJYnJlYWs7CiAJY2FzZSBERFBf
Q09NUE9ORU5UX0RQSTA6CiAJCXJlZyA9IE1VVEVYX1NPRl9EUEkwOwogCQlicmVhazsKQEAgLTQy
MCw2ICs0MjQsNyBAQCB2b2lkIG10a19kaXNwX211dGV4X3JlbW92ZV9jb21wKHN0cnVjdCBtdGtf
ZGlzcF9tdXRleCAqbXV0ZXgsCiAJc3dpdGNoIChpZCkgewogCWNhc2UgRERQX0NPTVBPTkVOVF9E
U0kwOgogCWNhc2UgRERQX0NPTVBPTkVOVF9EU0kxOgorCWNhc2UgRERQX0NPTVBPTkVOVF9EU0ky
OgogCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkwOgogCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkxOgog
CQl3cml0ZWxfcmVsYXhlZChNVVRFWF9TT0ZfU0lOR0xFX01PREUsCi0tIAoyLjEyLjUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
