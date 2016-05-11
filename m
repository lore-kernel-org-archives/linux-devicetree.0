From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] ARM64: dts: rockchip: enable eMMC for rk3399 EVB
Date: Tue, 10 May 2016 17:02:55 -0700
Message-ID: <1462924975-69072-2-git-send-email-briannorris@chromium.org>
References: <1462924975-69072-1-git-send-email-briannorris@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462924975-69072-1-git-send-email-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, dianders@chromium.org, Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

The 'mmc-hs400-enhanced-strobe' property has been acked by Rob Herring,
though it's still not merged.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
index 1a3eb1482050..ccfd2bcf02e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
@@ -89,6 +89,18 @@
 	status = "okay";
 };
 
+&emmc_phy {
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	non-removable;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
 &uart2 {
 	status = "okay";
 };
-- 
2.8.0.rc3.226.g39d4020
