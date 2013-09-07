From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 3/4] ARM: shmobile: bockw-reference: add Ether DT support
Date: Sat, 7 Sep 2013 04:29:33 +0400
Message-ID: <201309070429.34126.sergei.shtylyov@cogentembedded.com>
References: <201309070423.30672.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201309070423.30672.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the BOCK-W board dependent part of the Ether device node. 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7778-bockw-reference.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7778-bockw-reference.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7778-bockw-reference.dts
+++ renesas/arch/arm/boot/dts/r8a7778-bockw-reference.dts
@@ -30,3 +30,14 @@
 		reg = <0x60000000 0x10000000>;
 	};
 };
+
+&ether {
+	status = "ok";
+	phy-mode = "rmii";
+	phy-handle = <&phy1>;
+	renesas,no-ether-link;
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};

