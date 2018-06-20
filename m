From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 27/29] drm/mediatek: add DSI3 support for mutex
Date: Wed, 20 Jun 2018 16:19:29 +0800
Message-ID: <1529482771-2153-28-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIERTSTMgc3VwcG9ydCBmb3IgbXV0ZXgKClNpZ25lZC1vZmYtYnk6
IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCBhMGI1MjZiMTZkYTEuLjE1ZTQzNmQ0
ZThhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTc4LDYgKzc4
LDcgQEAKICNkZWZpbmUgTVVURVhfU09GX0RQSTAJCQkzCiAjZGVmaW5lIE1VVEVYX1NPRl9EUEkx
CQkJNAogI2RlZmluZSBNVVRFWF9TT0ZfRFNJMgkJCTUKKyNkZWZpbmUgTVVURVhfU09GX0RTSTMJ
CQk2CiAKICNkZWZpbmUgT1ZMMF9NT1VUX0VOX0NPTE9SMAkJMHgxCiAjZGVmaW5lIE9EX01PVVRf
RU5fUkRNQTAJCTB4MQpAQCAtMzg3LDYgKzM4OCw5IEBAIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRk
X2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAljYXNlIEREUF9DT01QT05FTlRf
RFNJMjoKIAkJcmVnID0gTVVURVhfU09GX0RTSTI7CiAJCWJyZWFrOworCWNhc2UgRERQX0NPTVBP
TkVOVF9EU0kzOgorCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMzsKKwkJYnJlYWs7CiAJY2FzZSBERFBf
Q09NUE9ORU5UX0RQSTA6CiAJCXJlZyA9IE1VVEVYX1NPRl9EUEkwOwogCQlicmVhazsKQEAgLTQy
NSw2ICs0MjksNyBAQCB2b2lkIG10a19kaXNwX211dGV4X3JlbW92ZV9jb21wKHN0cnVjdCBtdGtf
ZGlzcF9tdXRleCAqbXV0ZXgsCiAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTA6CiAJY2FzZSBERFBf
Q09NUE9ORU5UX0RTSTE6CiAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTI6CisJY2FzZSBERFBfQ09N
UE9ORU5UX0RTSTM6CiAJY2FzZSBERFBfQ09NUE9ORU5UX0RQSTA6CiAJY2FzZSBERFBfQ09NUE9O
RU5UX0RQSTE6CiAJCXdyaXRlbF9yZWxheGVkKE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKLS0gCjIu
MTIuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
