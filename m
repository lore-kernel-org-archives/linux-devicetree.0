From: Russ Dill <Russ.Dill@ti.com>
Subject: [PATCH v4 3/4] ARM: dts: add AM33XX vdd core opp50 suspend for AM335X GP EVM.
Date: Tue, 13 Aug 2013 15:20:11 -0700
Message-ID: <1376432412-8509-4-git-send-email-Russ.Dill@ti.com>
References: <1376432412-8509-1-git-send-email-Russ.Dill@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1376432412-8509-1-git-send-email-Russ.Dill@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Hebbar, Gururaja <gururaja.hebbar@ti.com>

This adds a sleep and wake sequence to set the VDD core voltage to the
OPP50 level, 0.950V. This saves power during suspend. The sequences are
specific to the EVM layout and PMIC, the TPS65910. The sequences
are written out by the Cortex-M3.

Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
Signed-off-by: Russ Dill <Russ.Dill@ti.com>
---
 arch/arm/boot/dts/am335x-evm.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 3aee1a4..81ce169 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -166,6 +166,16 @@
 			status = "okay";
 			clock-frequency = <400000>;
 
+			/* Set OPP50 (0.95V) for VDD core */
+			sleep_sequence = /bits/ 8 <
+				0x02 0x2d 0x25 0x1f /* Set VDD2 to 0.95V */
+			>;
+
+			/* Set OPP100 (1.10V) for VDD core */
+			wake_sequence = /bits/ 8 <
+				0x02 0x2d 0x25 0x2b /* Set VDD2 to 1.1V */
+			>;
+
 			tps: tps@2d {
 				reg = <0x2d>;
 			};
-- 
1.8.3.2

