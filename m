From: Romain Perier <romain.perier@gmail.com>
Subject: [PATCH v1 2/3] ARM: dts: rockchip: Enable power off in pmic for Radxa Rock
Date: Sat, 27 Sep 2014 16:21:45 +0000
Message-ID: <1411834906-9533-2-git-send-email-romain.perier@gmail.com>
References: <1411834906-9533-1-git-send-email-romain.perier@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411834906-9533-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add "active-semi,system-power-controller" property to act8846 node.
shutdown/poweroff commands are now handled for this board.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/rk3188-radxarock.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index e04bf8f..5b6a937 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -115,6 +115,8 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&act8846_dvs0_ctl>;
 
+		active-semi,system-power-controller;
+
 		regulators {
 			vcc_ddr: REG1 {
 				regulator-name = "VCC_DDR";
-- 
1.9.1
