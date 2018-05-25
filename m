From: <stu.hsieh@mediatek.com>
Subject: [PATCH v3 8/8] drm/mediatek: add third ddp path
Date: Fri, 25 May 2018 10:34:25 +0800
Message-ID: <1527215665-11937-9-git-send-email-stu.hsieh@mediatek.com>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
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

RnJvbTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKVGhpcyBwYXRjaCBjcmVh
dGUgdGhpcmQgY3J0YyBieSB0aGlyZCBkZHAgcGF0aAoKU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVo
IDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggYjMyYzRjYzhkMDUxLi4z
YTg2NmUxZDZhZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0y
NjcsNiArMjY3LDExIEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtKQogCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycl9jb21wb25lbnRfdW5iaW5kOwog
CisJcmV0ID0gbXRrX2RybV9jcnRjX2NyZWF0ZShkcm0sIHByaXZhdGUtPmRhdGEtPnRoaXJkX3Bh
dGgsCisJCQkJICBwcml2YXRlLT5kYXRhLT50aGlyZF9sZW4pOworCWlmIChyZXQgPCAwKQorCQln
b3RvIGVycl9jb21wb25lbnRfdW5iaW5kOworCiAJLyogVXNlIE9WTCBkZXZpY2UgZm9yIGFsbCBE
TUEgbWVtb3J5IGFsbG9jYXRpb25zICovCiAJbnAgPSBwcml2YXRlLT5jb21wX25vZGVbcHJpdmF0
ZS0+ZGF0YS0+bWFpbl9wYXRoWzBdXSA/OgogCSAgICAgcHJpdmF0ZS0+Y29tcF9ub2RlW3ByaXZh
dGUtPmRhdGEtPmV4dF9wYXRoWzBdXTsKLS0gCjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
