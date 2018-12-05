From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 03/45] ARM: dts: logicpd-somlv: Fix interrupt on mmc3_dat1
Date: Wed,  5 Dec 2018 04:46:24 -0500
Message-ID: <20181205094706.7225-3-sashal@kernel.org>
References: <20181205094706.7225-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205094706.7225-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Adam Ford <aford173@gmail.com>

[ Upstream commit 3d8b804bc528d3720ec0c39c212af92dafaf6e84 ]

The interrupt on mmc3_dat1 is wrong which prevents this from
appearing in /proc/interrupts.

Fixes: ab8dd3aed011 ("ARM: DTS: Add minimal Support for Logic PD
DM3730 SOM-LV") #Kernel 4.9+

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/logicpd-som-lv.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/logicpd-som-lv.dtsi b/arch/arm/boot/dts/logicpd-som-lv.dtsi
index e262fa9ef334..876ed5f2922c 100644
--- a/arch/arm/boot/dts/logicpd-som-lv.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv.dtsi
@@ -122,7 +122,7 @@
 };
 
 &mmc3 {
-	interrupts-extended = <&intc 94 &omap3_pmx_core2 0x46>;
+	interrupts-extended = <&intc 94 &omap3_pmx_core 0x136>;
 	pinctrl-0 = <&mmc3_pins &wl127x_gpio>;
 	pinctrl-names = "default";
 	vmmc-supply = <&wl12xx_vmmc>;
-- 
2.17.1
