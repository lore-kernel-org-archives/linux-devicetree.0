From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] ARM64: dts: Fix GXL periphs pinctrl pull-enable register base
Date: Tue, 23 May 2017 16:21:50 +0200
Message-ID: <1495549311-23660-3-git-send-email-narmstrong@baylibre.com>
References: <1495549311-23660-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495549311-23660-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The pull-enable register base was wrongly copied from the GXBB pinctrl node,
but was not used yet.

Fixes: fb0fe92294a9 ("ARM64: dts: meson-gxl: Add pinctrl nodes")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 4871ce5..57fe1f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -239,7 +239,7 @@
 		gpio: bank@4b0 {
 			reg = <0x0 0x004b0 0x0 0x28>,
 			      <0x0 0x004e8 0x0 0x14>,
-			      <0x0 0x00120 0x0 0x14>,
+			      <0x0 0x00520 0x0 0x14>,
 			      <0x0 0x00430 0x0 0x40>;
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
-- 
1.9.1
