From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: shmobile: porter: add CAN0 DT support
Date: Wed, 28 Oct 2015 00:03:22 +0300
Message-ID: <5706086.RKBCVZugI4@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the Porter board dependent part of the CAN0 device node.

This patch is  analogous to the commit 457acc4a6ce8 (ARM: shmobile:
henninger: add CAN0 DT support) as there are no differences between the
boards in this respect.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against 'renesas-devel-20151026-v4.3-rc7' tag of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7791-porter.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7791-porter.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-porter.dts
+++ renesas/arch/arm/boot/dts/r8a7791-porter.dts
@@ -134,6 +134,11 @@
 		renesas,groups = "vin0_data8", "vin0_clk";
 		renesas,function = "vin0";
 	};
+
+	can0_pins: can0 {
+		renesas,groups = "can0_data";
+		renesas,function = "can0";
+	};
 };
 
 &scif0 {
@@ -288,3 +293,10 @@
 &pciec {
 	status = "okay";
 };
+
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};

