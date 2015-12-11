Return-Path: <mbrugger@linux-gy6r.site>
From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] arm: dts: rockchip: Fix typo in rk32288 sdmmc card detect pin name
Date: Fri, 11 Dec 2015 15:45:58 +0100
Message-Id: <1449845158-8284-1-git-send-email-mbrugger@suse.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, heiko@sntech.de
Cc: olof@lixom.net, lorenzo.pieralisi@arm.com, mbrugger@suse.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The card detect pin is currently called sdmcc-cd.
This patch fixes the typo and renames the pin to sdmmc-cd.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 04ea209..0d52008 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1144,7 +1144,7 @@
 				rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
-			sdmmc_cd: sdmcc-cd {
+			sdmmc_cd: sdmmc-cd {
 				rockchip,pins = <6 22 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
-- 
2.6.2
