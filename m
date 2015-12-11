Return-Path: <mbrugger@linux-gy6r.site>
From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] arm64: dts: Fix typo in rk3368 card detect binding
Date: Fri, 11 Dec 2015 14:22:19 +0100
Message-Id: <1449840139-32420-1-git-send-email-mbrugger@suse.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, heiko@sntech.de
Cc: olof@lixom.net, lorenzo.pieralisi@arm.com, mbrugger@suse.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The card detect pin is called sdmcc-cd.
This patch fixes the typo and renames the pin to sdmmc-cd.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index cc093a4..936542f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -762,7 +762,7 @@
 				rockchip,pins = <2 10 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
-			sdmmc_cd: sdmcc-cd {
+			sdmmc_cd: sdmmc-cd {
 				rockchip,pins = <2 11 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
-- 
2.6.2
