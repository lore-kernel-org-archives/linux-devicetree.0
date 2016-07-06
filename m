From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 1/3] arm: dts: berlin2: enable all wdt nodes unconditionally
Date: Wed, 6 Jul 2016 14:41:39 +0800
Message-ID: <1467787301-3728-2-git-send-email-jszhang@marvell.com>
References: <1467787301-3728-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467787301-3728-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

After commit f29a72c24ad4 ("watchdog: dw_wdt: Convert to use watchdog
infrastructure"), the dw_wdt driver can support multiple variants, so
unconditionally enable all dw_wdt nodes now.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index ae81009..15c857a 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -447,7 +447,6 @@
 				reg = <0x2000 0x100>;
 				clocks = <&refclk>;
 				interrupts = <1>;
-				status = "disabled";
 			};
 
 			wdt2: watchdog@3000 {
@@ -455,7 +454,6 @@
 				reg = <0x3000 0x100>;
 				clocks = <&refclk>;
 				interrupts = <2>;
-				status = "disabled";
 			};
 
 			sm_gpio1: gpio@5000 {
-- 
2.8.1
