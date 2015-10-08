From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: shmobile: porter: add I2C2 DT support
Date: Fri, 09 Oct 2015 00:44:18 +0300
Message-ID: <84974694.25bFZffQKN@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the Porter board dependent part of the I2C2 device node.

This patch is  analogous to the commit 29a647c396a0 ("ARM: shmobile:
henninger: add I2C2 DT support") as there are no differences between
the boards in this respect.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against 'renesas-devel-20151008-v4.3-rc4' tag of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7791-porter.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7791-porter.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791-porter.dts
+++ renesas/arch/arm/boot/dts/r8a7791-porter.dts
@@ -109,6 +109,11 @@
 		renesas,groups = "sdhi2_data4", "sdhi2_ctrl";
 		renesas,function = "sdhi2";
 	};
+
+	i2c2_pins: i2c2 {
+		renesas,groups = "i2c2";
+		renesas,function = "i2c2";
+	};
 };
 
 &scif0 {
@@ -155,6 +160,14 @@
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+};
+
 &sata0 {
 	status = "okay";
 };

