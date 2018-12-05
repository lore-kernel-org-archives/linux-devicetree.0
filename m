From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 009/123] ARM: dts: LogicPD Torpedo: Fix mmc3_dat1 interrupt
Date: Wed,  5 Dec 2018 04:34:01 -0500
Message-ID: <20181205093555.5386-9-sashal@kernel.org>
References: <20181205093555.5386-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205093555.5386-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Adam Ford <aford173@gmail.com>

[ Upstream commit 6809564d64ff1301d44c13334cc0e8369e825a20 ]

When the Torpedo was first introduced back at Kernel 4.2,
the interrupt extended flag has been set incorrectly.

It was subsequently moved, so this patch corrects Kernel
4.18+

Fixes: a38867305203 ("ARM: dts: Move move WiFi bindings to
logicpd-torpedo-37xx-devkit") # v4.18+

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
index 9d5d53fbe9c0..c39cf2ca54da 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -35,7 +35,7 @@
  * jumpering combinations for the long run.
  */
 &mmc3 {
-	interrupts-extended = <&intc 94 &omap3_pmx_core2 0x46>;
+	interrupts-extended = <&intc 94 &omap3_pmx_core 0x136>;
 	pinctrl-0 = <&mmc3_pins &mmc3_core2_pins>;
 	pinctrl-names = "default";
 	vmmc-supply = <&wl12xx_vmmc>;
-- 
2.17.1
