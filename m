From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v7 10/29] drm/mediatek: add the DSI1 for component init
 condition
Date: Wed, 20 Jun 2018 16:19:12 +0800
Message-ID: <1529482771-2153-11-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgdGhlIERTSTEgZm9yIGNvbXBvbmVudCBpbml0IGNvbmRpdGlvbgoKU2ln
bmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1i
eTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwppbmRleCAx
N2I2ODE2ODY0NzEuLmZmOTc0ZDgyYTRhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jCkBAIC0yODAsNiArMjgwLDcgQEAgaW50IG10a19kZHBfY29tcF9p
bml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpub2RlLAogCSAgICBj
b21wX2lkID09IEREUF9DT01QT05FTlRfRFBJMCB8fAogCSAgICBjb21wX2lkID09IEREUF9DT01Q
T05FTlRfRFBJMSB8fAogCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMCB8fAorCSAg
ICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMSB8fAogCSAgICBjb21wX2lkID09IEREUF9D
T01QT05FTlRfRFNJMiB8fAogCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMyB8fAog
CSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfUFdNMCkgewotLSAKMi4xMi41CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
