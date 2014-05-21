From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [Patch] ARM: dts: keystone: add device state control syscon entry
Date: Wed, 21 May 2014 17:16:00 +0300
Message-ID: <1400681760-24351-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: santosh.shilimkar@ti.com
Cc: galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, grygorii.strashko@ti.com, m-karicheri2@ti.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

Device state control registers has register regions with different
purposes so add syscon entry in order to be able to correctly access
them from appropriate places.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---

Based on linux-next/master

 arch/arm/boot/dts/keystone.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 5e67c5b..8b899ba 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -71,6 +71,11 @@
 			reg = <0x2310000 0x200>;
 		};
 
+		devctrl: device_state_control {
+			compatible = "ti,keystone-devctrl", "syscon";
+			reg = <0x2620000 0x1000>;
+		};
+
 		rstctrl: reset-controller {
 			compatible = "ti,keystone-reset";
 			reg = <0x023100e8 4>;	/* pll reset control reg */
-- 
1.8.3.2
