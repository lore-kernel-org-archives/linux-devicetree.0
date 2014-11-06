From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/3] ARM: dts: AM437x-SK-EVM: Fix DCDC3 voltage
Date: Thu, 6 Nov 2014 16:20:04 +0530
Message-ID: <1415271004-10935-4-git-send-email-j-keerthy@ti.com>
References: <1415271004-10935-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1415271004-10935-1-git-send-email-j-keerthy@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org, j-keerthy@ti.com, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
List-Id: devicetree@vger.kernel.org

DCDC3 supplies voltage to DDR. Fix DCDC3 volatge to 1.5V which is the reset 
value. Programming to a non-reset value while executing from DDR will result
in random hangs.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am437x-sk-evm.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 859ff3d..87aa4f3 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -363,8 +363,8 @@
 		dcdc3: regulator-dcdc3 {
 			compatible = "ti,tps65218-dcdc3";
 			regulator-name = "vdds_ddr";
-			regulator-min-microvolt = <1350000>;
-			regulator-max-microvolt = <1350000>;
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <1500000>;
 			regulator-boot-on;
 			regulator-always-on;
 		};
-- 
1.7.9.5

