From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 11/11] arm64: dts: r8a77965-salvator-xs: Enable DU external
 clocks and HDMI
Date: Fri, 27 Apr 2018 17:57:22 +0100
Message-ID: <20180427165722.19445-12-kieran.bingham+renesas@ideasonboard.com>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, open list <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

VGhlIERVMSBleHRlcm5hbCBkb3QgY2xvY2sgaXMgcHJvdmlkZWQgYnkgdGhlIGZpeGVkIGZyZXF1
ZW5jeSBjbG9jawpnZW5lcmF0b3IgWDIxLCB3aGlsZSB0aGUgRFUwIGFuZCBEVTMgY2xvY2tzIGFy
ZSBwcm92aWRlZCBieSB0aGUKcHJvZ3JhbW1hYmxlIFZlcnNhY2xvY2s2IGNsb2NrIGdlbmVyYXRv
ci4KCkVuYWJsZSB0aGUgY2xvY2tzLCBhbmQgdGhlIEhETUkgZW5jb2RlciBmb3IgdGhlIE0zLU4g
U2FsdmF0b3ItWFMsIGFuZApob29rIGl0IHVwIHRvIHRoZSBIRE1JIGNvbm5lY3RvcgoKQmFzZWQg
b24gcGF0Y2hlcyBmcm9tIFRha2VzaGkgS2loYXJhIDx0YWtlc2hpLmtpaGFyYS5kZkByZW5lc2Fz
LmNvbT4KClNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5l
c2FzQGlkZWFzb25ib2FyZC5jb20+Ci0tLQogLi4uL2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUt
c2FsdmF0b3IteHMuZHRzIHwgMjkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjhhNzc5NjUtc2FsdmF0b3IteHMuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I4YTc3OTY1LXNhbHZhdG9yLXhzLmR0cwppbmRleCBhODNhMDBkZWVkOWUuLmRjZjE4NDlmMWE2
NyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LXNhbHZh
dG9yLXhzLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUtc2Fs
dmF0b3IteHMuZHRzCkBAIC0xOSwzICsxOSwzMiBAQAogCQlyZWcgPSA8MHgwIDB4NDgwMDAwMDAg
MHgwIDB4NzgwMDAwMDA+OwogCX07CiB9OworCismZHUgeworCWNsb2NrcyA9IDwmY3BnIENQR19N
T0QgNzI0PiwKKwkJIDwmY3BnIENQR19NT0QgNzIzPiwKKwkJIDwmY3BnIENQR19NT0QgNzIxPiwK
KwkJIDwmY3BnIENQR19NT0QgNzI3PiwKKwkJIDwmdmVyc2FjbG9jazYgMT4sCisJCSA8JngyMV9j
bGs+LAorCQkgPCZ2ZXJzYWNsb2NrNiAyPjsKKwljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEi
LCAiZHUuMyIsICJsdmRzLjAiLAorCQkgICAgICAiZGNsa2luLjAiLCAiZGNsa2luLjEiLCAiZGNs
a2luLjMiOworfTsKKworJmhkbWkwIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwlwb3J0cyB7CisJ
CXBvcnRAMSB7CisJCQlyZWcgPSA8MT47CisJCQlyY2FyX2R3X2hkbWkwX291dDogZW5kcG9pbnQg
eworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaTBfY29uPjsKKwkJCX07CisJCX07CisJfTsK
K307CisKKyZoZG1pMF9jb24geworCXJlbW90ZS1lbmRwb2ludCA9IDwmcmNhcl9kd19oZG1pMF9v
dXQ+OworfTsKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
