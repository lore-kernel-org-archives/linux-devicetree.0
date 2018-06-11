From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 26/28] drm/mediatek: add DPI1/DSI1/DSI2/DSI3 in comp_init
Date: Mon, 11 Jun 2018 11:26:18 +0800
Message-ID: <1528687580-549-27-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgY29tcG9uZW50cyBEUEkxL0RTSTEvRFNJMi9EU0kzIGluIGNvbXBfaW5p
dC4KQmVjYXVzZSB0aGUgc29tZSBwYXJhbWV0ZXIgZm9yIHRoZXNlIGNvbXBvbmVudHMgaW5pdGlh
bGl6ZWQKaW4gdGhlaXIgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNp
ZWhAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwppbmRleCAyMmY0YzcyZmE3
ODUuLmZmOTc0ZDgyYTRhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jCkBAIC0yNzgsNyArMjc4LDExIEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKIAogCWlmIChjb21wX2lk
ID09IEREUF9DT01QT05FTlRfQkxTIHx8CiAJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9E
UEkwIHx8CisJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9EUEkxIHx8CiAJICAgIGNvbXBf
aWQgPT0gRERQX0NPTVBPTkVOVF9EU0kwIHx8CisJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVO
VF9EU0kxIHx8CisJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9EU0kyIHx8CisJICAgIGNv
bXBfaWQgPT0gRERQX0NPTVBPTkVOVF9EU0kzIHx8CiAJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBP
TkVOVF9QV00wKSB7CiAJCWNvbXAtPnJlZ3MgPSBOVUxMOwogCQljb21wLT5jbGsgPSBOVUxMOwot
LSAKMi4xMi41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
