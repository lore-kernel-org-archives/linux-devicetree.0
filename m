From: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 0/3] Add support rockchip RGB output interface
Date: Thu, 14 Sep 2017 11:43:14 +0800
Message-ID: <1505360594-196508-1-git-send-email-hjc@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaGVzIGFkZCBzdXBwb3J0IHNvbWUgcm9ja2NoaXAgU29jIGxpa2UgcnYxMTA4LCB0
aGUgVk9QIGNhbiBkaXJlY3RseQpvdXRwdXQgcGFyYWxsZWwgYW5kIHNlcmlhbCBSR0IgZGF0YSB0
byBwYW5lbCBvciB0byBjb252ZXJzaW9uIGNoaXAuIFNvIHdlIGFkZAp0aGlzIGRyaXZlciB0byBw
cm9iZSBlbmNvZGVyIGFuZCBjb25uZWN0b3IgdG8gc3VwcG9ydCB0aGlzIGNhc2UuCgpTYW5keSBI
dWFuZyAoMyk6CiAgZHQtYmluZGluZ3M6IEFkZCBkb2N1bWVudCBmb3Igcm9ja2NoaXAgUkdCIG91
dHB1dCBpbnRlcmZhY2UKICBkcm0vcm9ja2NoaXA6IEFkZCBzdXBwb3J0IGZvciBSb2NrY2hpcCBT
b2MgUkdCIG91dHB1dCBpbnRlcmZhY2UKICBkcm0vcm9ja2NoaXA6IHZvcDogQWRkIG1vcmUgUkdC
IG91dHB1dCBpbnRlcmZhY2UgdHlwZQoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3Jv
Y2tjaGlwLXJnYi50eHQgICAgIHwgIDgwICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5oICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfcmdiLmMgICAgICAgICAgICB8IDMyNyArKysrKysrKysr
KysrKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgNDIyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2Nr
Y2hpcC9yb2NrY2hpcC1yZ2IudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX3JnYi5jCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
