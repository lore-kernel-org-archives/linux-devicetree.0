Return-Path: <j-keerthy@ti.com>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/4] arm: dts: am57xx-beagle-x15-common: Add overide powerhold property
Date: Thu, 27 Oct 2016 14:40:13 +0530
Message-ID: <1477559414-12520-4-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1477559414-12520-1-git-send-email-j-keerthy@ti.com>
References: <1477559414-12520-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, lee.jones@linaro.org, robh+dt@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, nm@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>

The PMICs have POWERHOLD set by default which prevents PMIC shutdown
even on DEV_CTRL On bit set to 0 as the Powerhold has higher priority.
So to enable pmic power off this property lets one over ride the default
value and enable pmic power off.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 6de163c..1b5e776 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -216,6 +216,7 @@
 		interrupt-controller;
 
 		ti,system-power-controller;
+		ti,palmas-override-powerhold;
 
 		tps659038_pmic {
 			compatible = "ti,tps659038-pmic";
-- 
1.9.1
