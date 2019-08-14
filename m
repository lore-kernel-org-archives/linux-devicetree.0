Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57690 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727685AbfHNNOd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:33 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
Date: Wed, 14 Aug 2019 06:14:08 -0700
Message-Id: <20190814131408.57162-7-tony@atomide.com>
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, moaz korena <moaz@korena.xyz>, Merlijn Wajer <merlijn@wizzup.org>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The following can be tested via sysfs with the following to ensure the SGX
module gets enabled and disabled properly:

# echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control
# rwmem 0x5600fe00		# revision register
0x5600fe00 = 0x40000000
# echo auto > /sys/bus/platform/devices/5600fe00.target-module/power/control
# rwmem 0x5000fe00
Bus error

Note that this patch depends on the PRM rstctrl driver that has
been recently posted. If the child device driver(s) need to prevent
rstctrl reset on PM runtime suspend, the drivers need to increase
the usecount for the shared rstctrl reset that can be mapped also
for the child device(s) or accessed via dev->parent.

Cc: Adam Ford <aford173@gmail.com>
Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -460,6 +460,31 @@
 			       <&edma 5 0>;
 			dma-names = "tx", "rx";
 		};
+
+		target-module@56000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&gfx_l3_clkctrl AM3_GFX_L3_GFX_CLKCTRL 0>;
+			clock-names = "fck";
+			resets = <&prm_gfx 0>;
+			reset-names = "rstctrl";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x56000000 0x1000000>;
+
+			/*
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 };
 
-- 
2.21.0
