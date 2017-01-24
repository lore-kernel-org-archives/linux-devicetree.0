From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v4 5/6] dt-bindings: add power domain node for dw-mipi-rockchip
Date: Tue, 24 Jan 2017 10:38:05 +0800
Message-ID: <1485225486-669-6-git-send-email-zyw@rock-chips.com>
References: <1485225486-669-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1485225486-669-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: john@metanate.com, dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBpbiB2NDogTm9uZQpD
aGFuZ2VzIGluIHYzOiBOb25lCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2Nr
Y2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQgICAgICB8IDMgKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9k
c2lfcm9ja2NoaXAudHh0CmluZGV4IDBmODI1NjguLjE4OGY2ZjcgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNp
X3JvY2tjaGlwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKQEAgLTE1LDYgKzE1LDkgQEAg
UmVxdWlyZWQgcHJvcGVydGllczoKIC0gcG9ydHM6IGNvbnRhaW4gYSBwb3J0IG5vZGUgd2l0aCBl
bmRwb2ludCBkZWZpbml0aW9ucyBhcyBkZWZpbmVkIGluIFsyXS4KICAgRm9yIHZvcGIsc2V0IHRo
ZSByZWcgPSA8MD4gYW5kIHNldCB0aGUgcmVnID0gPDE+IGZvciB2b3BsLgogCitPcHRpb25hbCBw
cm9wZXJ0aWVzOgorLSBwb3dlci1kb21haW5zOiBhIHBoYW5kbGUgdG8gbWlwaSBkc2kgcG93ZXIg
ZG9tYWluIG5vZGUuCisKIFsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svY2xvY2stYmluZGluZ3MudHh0CiBbMl0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0CiAKLS0gCjIuNi4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
