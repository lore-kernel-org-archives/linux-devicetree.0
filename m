From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: silk: add DU pins
Date: Wed, 13 Apr 2016 22:36:21 +0300
Message-ID: <2415333.mtLdVEoB2G@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the (previously omitted) DU pin data to the SILK board's device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160411-v4.6-rc3' tag of Simon
Horman's 'renesas.git' repo. It depends on the R8A7794 DU PFC driver patch
just posted for the pins to be configured...

 arch/arm/boot/dts/r8a7794-silk.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
+++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
@@ -183,6 +183,16 @@
 		groups = "usb1";
 		function = "usb1";
 	};
+
+	du0_pins: du0 {
+		groups = "du0_rgb888", "du0_sync", "du0_disp", "du0_clk0_out";
+		function = "du0";
+	};
+
+	du1_pins: du1 {
+		groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_clk0_out";
+		function = "du1";
+	};
 };
 
 &scif2 {
@@ -360,6 +370,8 @@
 };
 
 &du {
+	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	clocks = <&mstp7_clks R8A7794_CLK_DU0>,
