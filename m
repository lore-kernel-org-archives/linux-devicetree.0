From: AnilKumar Ch <anilkumar@ti.com>
Subject: [PATCH v2 1/2] arm/dts: AM33XX: Add D_CAN device tree data
Date: Wed, 25 Jul 2012 17:53:31 +0530
Message-ID: <1343219012-19472-2-git-send-email-anilkumar@ti.com>
References: <1343219012-19472-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1343219012-19472-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: tony@atomide.com, wg@grandegger.com, mkl@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, AnilKumar Ch <anilkumar@ti.com>
List-Id: devicetree@vger.kernel.org

Add Bosch D_CAN controller device tree data to AM33XX dtsi file
by adding d_can device node with all the necessary parameters.

Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 9b974dc..2db2ffb 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -163,5 +163,10 @@
 			#size-cells = <0>;
 			ti,hwmods = "i2c3";
 		};
+
+		dcan1: d_can@481D0000 {
+			compatible = "bosch,d_can";
+			ti,hwmods = "d_can1";
+		};
 	};
 };
-- 
1.7.9.5

