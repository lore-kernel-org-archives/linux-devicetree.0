From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Sun, 1 Sep 2013 03:15:48 +0400
Message-ID: <201309010315.49763.sergei.shtylyov@cogentembedded.com>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201309010311.05466.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the generic R8A777x part of the Ether device node. 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7778.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7778.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7778.dtsi
+++ renesas/arch/arm/boot/dts/r8a7778.dtsi
@@ -98,4 +98,15 @@
 		reg = <0xfffc000 0x118>;
 		#gpio-range-cells = <3>;
 	};
+
+	ether: ethernet@fde00000 {
+		device_type = "network";
+		compatible = "renesas,ether-r8a7779";
+		reg = <0xfde00000 0x400>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 105 0x4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
 };

