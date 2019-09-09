From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/6] arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-polled node
Date: Mon,  9 Sep 2019 19:01:22 +0400
Message-ID: <1568041287-7805-2-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

Fix DTC warnings:

arch/arm/dts/meson-gxl-s905x-khadas-vim.dtb: Warning (avoid_unnecessary_addr_size):
   /gpio-keys-polled: unnecessary #address-cells/#size-cells
      without "ranges" or child "reg" property

Fixes: e15d2774b8c ("ARM64: dts: meson-gxl: add support for the Khadas VIM board")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 5499e8d..41be2af 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -33,11 +33,9 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <100>;
 
-		button@0 {
+		power-button {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
-- 
2.7.4
