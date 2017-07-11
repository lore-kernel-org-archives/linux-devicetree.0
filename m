From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH 0/5] drm/rockchip: add all full framework vop support
Date: Tue, 11 Jul 2017 20:41:47 +0800
Message-ID: <1499776908-16811-1-git-send-email-mark.yao@rock-chips.com>
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
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

VGhlc2UgcGF0Y2hlcyB0cnkgdG8gbWFrZSBhbGwgY3VycmVudCByb2NrY2hpcCBmdWxsIGZyYW1l
d29yayB2b3Agd29ya3MKb24gZHJtLCBUaGUgbmV3ZXIgdm9wIGRlc2lnbiBhbHdheXMgaGF2ZSBz
b21lIGRpZmZlcmVudCB0byB0aGUgb2xkIG9uZSwKU28gd2UgYWRkIGEgcmVnaXN0ZXIgdmVyaWZ5
IG1lY2hhbmlzbSB0byBkaXN0aW5ndWlzaCB0aG9zZSByZWdpc3RlciwgdGhlbgp0aGUgcmVnaXN0
ZXJzIHRhYmxlIGNhbiBiZSByZXVzZWQuCgpBbmQgcGVvcGxlIGNhbiBlYXN5IHRvIGtub3cgdGhl
IGRpZmZlcmVudCBmb3IgdGhlIHZvcHMgZnJvbSByZWdpc3RlciB0YWJsZS4KCk1hcmsgWWFvICg1
KToKICBkcm0vcm9ja2NoaXA6IHZvcDogZ2V0IHJpZCBvZiByZWdpc3RlciBpbml0IHRhYmxlCiAg
ZHJtL3JvY2tjaGlwOiB2b3A6IHN1cHBvcnQgdmVyaWZ5IHJlZ2lzdGVycyB3aXRoIHZvcCB2ZXJz
aW9uCiAgZHJtL3JvY2tjaGlwOiB2b3A6IG1vdmUgbGluZV9mbGFnX251bSB0byBpbnRlcnJ1cHQg
cmVnaXN0ZXJzCiAgZHJtL3JvY2tjaGlwOiB2b3A6IGFkZCBhIHNlcmllcyBvZiB2b3Agc3VwcG9y
dAogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBmaWxsIERvY3VtZW50cyBmb3Igc2VyaWVzIG9mIHZv
cAoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQgICAgIHwg
ICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgICAgICAg
IHwgIDc0ICstCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oICAg
ICAgICB8ICAzMiArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcu
YyAgICAgICAgfCAyNTkgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
dm9wX3JlZy5oICAgICAgICB8IDkwNSArKysrKysrKysrKysrKysrLS0tLS0KIDUgZmlsZXMgY2hh
bmdlZCwgOTUyIGluc2VydGlvbnMoKyksIDMyMiBkZWxldGlvbnMoLSkKCi0tIAoxLjkuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
