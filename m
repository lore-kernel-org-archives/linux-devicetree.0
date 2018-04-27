From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 10/11] arm64: dts: r8a77965-salvator-x: Enable DU external
 clocks and HDMI
Date: Fri, 27 Apr 2018 17:57:21 +0100
Message-ID: <20180427165722.19445-11-kieran.bingham+renesas@ideasonboard.com>
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
ZSBwcm92aWRlZCBieSB0aGUKcHJvZ3JhbW1hYmxlIFZlcnNhY2xvY2s1IGNsb2NrIGdlbmVyYXRv
ci4KCkVuYWJsZSB0aGUgY2xvY2tzLCBhbmQgdGhlIEhETUkgZW5jb2RlciBmb3IgdGhlIE0zLU4g
U2FsdmF0b3ItWCBib2FyZAphbmQgaG9vayBpdCB1cCB0byB0aGUgSERNSSBjb25uZWN0b3IuCgpC
YXNlZCBvbiBwYXRjaGVzIGZyb20gVGFrZXNoaSBLaWhhcmEgPHRha2VzaGkua2loYXJhLmRmQHJl
bmVzYXMuY29tPgoKU2lnbmVkLW9mZi1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFt
K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KCi0tLQp2MjoKIC0gUmVtb3ZlIExWRFMgY2xvY2tz
IGZyb20gRFUgbm9kZQogLSBNZXJnZSBEVSBDbG9ja3MgYW5kIEhETUkgZW5hYmxlbWVudAotLS0K
IC4uLi9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LXNhbHZhdG9yLXguZHRzICB8IDI4ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LXNhbHZhdG9yLXguZHRz
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LXNhbHZhdG9yLXguZHRzCmlu
ZGV4IDc1ZDg5MGQ5MWRmOS4uMzQwYTNjNzJiNjVhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUtc2FsdmF0b3IteC5kdHMKKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LXNhbHZhdG9yLXguZHRzCkBAIC0xOSwzICsxOSwzMSBA
QAogCQlyZWcgPSA8MHgwIDB4NDgwMDAwMDAgMHgwIDB4NzgwMDAwMDA+OwogCX07CiB9OworCism
ZHUgeworCWNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKKwkJIDwmY3BnIENQR19NT0QgNzIz
PiwKKwkJIDwmY3BnIENQR19NT0QgNzIxPiwKKwkJIDwmdmVyc2FjbG9jazUgMT4sCisJCSA8Jngy
MV9jbGs+LAorCQkgPCZ2ZXJzYWNsb2NrNSAyPjsKKwljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1
LjEiLCAiZHUuMyIsCisJCSAgICAgICJkY2xraW4uMCIsICJkY2xraW4uMSIsICJkY2xraW4uMyI7
Cit9OworCismaGRtaTAgeworCXN0YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJcG9ydEAx
IHsKKwkJCXJlZyA9IDwxPjsKKwkJCXJjYXJfZHdfaGRtaTBfb3V0OiBlbmRwb2ludCB7CisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pMF9jb24+OworCQkJfTsKKwkJfTsKKwl9OworfTsKKwor
JmhkbWkwX2NvbiB7CisJcmVtb3RlLWVuZHBvaW50ID0gPCZyY2FyX2R3X2hkbWkwX291dD47Cit9
OwotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
