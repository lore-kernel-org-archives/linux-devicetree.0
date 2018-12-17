From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 12/15] arm64: dts: rockchip: add dw-mipi-dsi controller on
 rk3368
Date: Mon, 17 Dec 2018 13:36:47 +0100
Message-ID: <20181217123650.6773-13-heiko@sntech.de>
References: <20181217123650.6773-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181217123650.6773-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSBjb3JlIG5vZGUgZm9yIHRoZSBtaXBpLWRzaSBjb250cm9sbGVyIGZvdW5kIG9uIHJr
MzM2OCBzb2NzLgoKU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5k
ZT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpIHwgMTMgKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazMzNjguZHRzaQppbmRleCBlMzBjYmYzMGMwMjYuLmYwM2Y1N2Q5
NjUxNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzNjguZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpCkBAIC04Njgs
NiArODY4LDE5IEBACiAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJfTsKIAorCW1pcGlfZHNpOiBt
aXBpQGZmOTYwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzNjgtbWlwaS1kc2ki
LCAic25wcyxkdy1taXBpLWRzaSI7CisJCXJlZyA9IDwweDAgMHhmZjk2MDAwMCAweDAgMHg0MDAw
PjsKKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQlj
bG9ja3MgPSA8JmNydSBTQ0xLX01JUElEU0lfMjRNPiwgPCZjcnUgUENMS19NSVBJX0RTSTA+Owor
CQljbG9jay1uYW1lcyA9ICJyZWYiLCAicGNsayI7CisJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2Vy
IFJLMzM2OF9QRF9WSU8+OworCQlyb2NrY2hpcCxncmYgPSA8JmdyZj47CisJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJc3RhdHVzID0gImRpc2FibGVkIjsK
Kwl9OworCiAJZWRwOiBkcEBmZjk3MDAwMCB7CiAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscmsz
MzY4LWRwIjsKIAkJcmVnID0gPDB4MCAweGZmOTcwMDAwIDB4MCAweDQwMDA+OwotLSAKMi4xOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
