From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 07/13] arm64: dts: rockchip: move px30-evb console output to uart 5
Date: Tue, 17 Sep 2019 10:26:53 +0200
Message-ID: <20190917082659.25549-7-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The px30-evb exposes uart2 through a uart-to-usb converter on the board
but these pins are shared with the sdmmc controller. With both activated
this results in a race condition depending in the probe order.
Whichever of the two probes first will break the other peripheral.

The px30-evb also exposes uart5 through pin its pin headers, so it's way
saner to use these pins for serial output and keep the sdmmc working in
all cases.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 6d50f6abcb48..80524afe94da 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -14,7 +14,7 @@
 	compatible = "rockchip,px30-evb", "rockchip,px30";
 
 	chosen {
-		stdout-path = "serial2:1500000n8";
+		stdout-path = "serial5:115200n8";
 	};
 
 	adc-keys {
@@ -454,7 +454,7 @@
 	status = "okay";
 };
 
-&uart2 {
+&uart5 {
 	status = "okay";
 };
 
-- 
2.20.1
