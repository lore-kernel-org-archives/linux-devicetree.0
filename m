From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: [PATCH 4/6] ARM: dts: socfpga: Remove unneeded reg from stmpe_touchscreen
Date: Sat, 25 Feb 2017 06:54:27 +0100
Message-ID: <1488002069-22404-5-git-send-email-florian.vaussard@heig-vd.ch>
References: <1488002069-22404-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488002069-22404-1-git-send-email-florian.vaussard@heig-vd.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>
List-Id: devicetree@vger.kernel.org

The stmpe_touchscreen node in Cyclone5 MCV EVK has a reg property, but
this is not used by the driver. Moreover the binding documentation do
not define this property. Having a reg property without a unit name will
trigger the following warning when compiled with W=1:

Node /soc/i2c@ffc04000/stmpe811@41/stmpe_touchscreen has a reg or ranges
property, but no unit name

Remove the superfluous reg property.

Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
---
 arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts b/arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts
index e5a98e5..21e3972 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dts
@@ -71,7 +71,6 @@
 
 		stmpe_touchscreen {
 			compatible = "st,stmpe-ts";
-			reg = <0>;
 			ts,sample-time = <4>;
 			ts,mod-12b = <1>;
 			ts,ref-sel = <0>;
-- 
2.7.4
