From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH 2/3] ARM: dts: rockchip: add simple sound card for RK3036 SoCs
Date: Wed, 15 Jun 2016 21:28:45 +0800
Message-ID: <1465997325-17830-1-git-send-email-ykk@rock-chips.com>
References: <1465997312-17777-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465997312-17777-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Zheng Yang <zhengyang@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ken Mixte <kmixter@google.com>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

VXNpbmcgSTJTIGFzIHRoZSBhdWRpbyBpbnB1dCBzb3VyY2UsIGFuZCBmb3JjZSB0aGUgbWNsa19m
cyB0byAyNTYuCgpTaWduZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmszMDM2LmR0c2kgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3JrMzAzNi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMDM2LmR0
c2kKaW5kZXggODQzZDJiZS4uZWNmZjA3MSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
cmszMDM2LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMDM2LmR0c2kKQEAgLTMzNSw2
ICszMzUsOSBAQAogCQlyb2NrY2hpcCxncmYgPSA8JmdyZj47CiAJCXBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7CiAJCXBpbmN0cmwtMCA9IDwmaGRtaV9jdGw+OworCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisJCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47CiAJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAKIAkJaGRtaV9pbjogcG9ydCB7CkBAIC0zNDcsNiArMzUw
LDI1IEBACiAJCX07CiAJfTsKIAorCWhkbWlfc291bmQ6IGhkbWktc291bmQgeworCQljb21wYXRp
YmxlID0gInNpbXBsZS1hdWRpby1jYXJkIjsKKwkJc2ltcGxlLWF1ZGlvLWNhcmQsbmFtZSA9ICJy
b2NrY2hpcCxoZG1pIjsKKwkJc2ltcGxlLWF1ZGlvLWNhcmQsd2lkZ2V0cyA9ICJIZWFkcGhvbmUi
LCAiT3V0IEphY2siLAorCQkJCQkgICAgIkxpbmUiLCAiSW4gSmFjayI7CisJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CisKKwkJc2ltcGxlLWF1ZGlvLWNhcmQsZGFpLWxpbmsgeworCQkJZm9ybWF0ID0g
ImkycyI7CisJCQltY2xrLWZzID0gPDI1Nj47CisJCQljcHUgeworCQkJCXNvdW5kLWRhaSA9IDwm
aTJzPjsKKwkJCX07CisJCQljb2RlYyB7CisJCQkJc291bmQtZGFpID0gPCZoZG1pPjsKKwkJCX07
CisJCX07CisJfTsKKwogCXRpbWVyOiB0aW1lckAyMDA0NDAwMCB7CiAJCWNvbXBhdGlibGUgPSAi
cm9ja2NoaXAscmszMDM2LXRpbWVyIiwgInJvY2tjaGlwLHJrMzI4OC10aW1lciI7CiAJCXJlZyA9
IDwweDIwMDQ0MDAwIDB4MjA+OwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
