From: Romain Perier <romain.perier@gmail.com>
Subject: [RFC PATCH v3 3/5] ARM: dts: rockchip: Enable power off in pmic for Radxa Rock
Date: Tue, 14 Oct 2014 06:31:11 +0000
Message-ID: <1413268273-15151-3-git-send-email-romain.perier@gmail.com>
References: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, heiko@sntech.de, grant.likely@linaro.org, robh@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Add "poweroff-source" property to act8846 node.
shutdown/poweroff commands are now handled for this board.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/rk3188-radxarock.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index 15910c9..2affff0 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -141,6 +141,8 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&act8846_dvs0_ctl>;
 
+		poweroff-source;
+
 		regulators {
 			vcc_ddr: REG1 {
 				regulator-name = "VCC_DDR";
-- 
1.9.1
