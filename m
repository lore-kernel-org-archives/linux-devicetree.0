From: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 0/2] add support rk3126 vop support
Date: Tue, 14 Nov 2017 19:27:31 +0800
Message-ID: <1510658851-90160-1-git-send-email-hjc@rock-chips.com>
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

VGhlIGZvbGxvd2luZyBwYXRjaCBhZGQgc3VwcG9ydCBSSzMxMjYgdm9wIHN1cHBvcnQsIHRoZXJl
IGlzIG9ubHkgb25lClZPUCBhdCBSSzMxMjYsIGFuZCB0aGUgUkszMTI2IFZPUCByZWdpc3RlciBs
YXlvdXQgaXMgc2ltaWxhciB3aXRoIFJLMzAzNiwKc28gc29tZSBmZWF0dXJlIGNhbiByZXVzZSB3
aXRoIFJLMzAzNi4KClNhbmR5IEh1YW5nICgyKToKICBkdC1iaW5kaW5nczogYWRkIGRvY3VtZW50
IGZvciByazMxMjYtdm9wCiAgZHJtL3JvY2tjaGlwOiB2b3A6IGFkZCByazMxMjYgdm9wIHN1cHBv
cnQKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0ICAgICB8
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMgICAgICAg
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX3ZvcF9yZWcuaCAgICAgICAgfCAgNiArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
