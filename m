From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 14/29] drm/mediatek: add connection from RDMA0 to DSI2
Date: Wed, 20 Jun 2018 16:19:16 +0800
Message-ID: <1529482771-2153-15-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIGNvbm5lY3Rpb24gZnJvbSBSRE1BMCB0byBEU0kyCgpTaWduZWQt
b2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwppbmRleCAzYTNmMzdmNTIzZjIuLmY5
ODViYWQ2MWQ4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKQEAgLTgy
LDYgKzgyLDcgQEAKICNkZWZpbmUgT1ZMMV9NT1VUX0VOX0NPTE9SMQkJMHgxCiAjZGVmaW5lIEdB
TU1BX01PVVRfRU5fUkRNQTEJCTB4MQogI2RlZmluZSBSRE1BMF9TT1VUX0RQSTAJCQkweDIKKyNk
ZWZpbmUgUkRNQTBfU09VVF9EU0kyCQkJMHg0CiAjZGVmaW5lIFJETUExX1NPVVRfRFBJMAkJCTB4
MgogI2RlZmluZSBEUEkwX1NFTF9JTl9SRE1BMQkJMHgxCiAjZGVmaW5lIENPTE9SMV9TRUxfSU5f
T1ZMMQkJMHgxCkBAIC0xNjAsNiArMTYxLDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRw
X21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAogCX0gZWxzZSBpZiAoY3VyID09IERE
UF9DT01QT05FTlRfUkRNQTAgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsKIAkJKmFk
ZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9TT1VUX0VOOwogCQl2YWx1ZSA9IFJETUEw
X1NPVVRfRFBJMDsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9EU0kyKSB7CisJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RJ
U1BfUkRNQTBfU09VVF9FTjsKKwkJdmFsdWUgPSBSRE1BMF9TT1VUX0RTSTI7CiAJfSBlbHNlIGlm
IChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFBJ
MCkgewogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JETUExX1NPVVRfRU47CiAJCXZh
bHVlID0gUkRNQTFfU09VVF9EUEkwOwotLSAKMi4xMi41CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
