Return-Path: <SRS0=PuHC=M6=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: condor: switch from EtherAVB to GEther
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <4f9e79ca-5d61-8dd4-fe79-42e8f7562f90@cogentembedded.com>
Date: Thu, 18 Oct 2018 19:48:53 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Valentine Barshak <valentine.barshak@cogentembedded.com>
List-ID: <devicetree@vger.kernel.org>

The "official" Condor boards have always been wired to mount NFS via
GEther, not EtherAVB -- the boards resoldered for EtherAVB were local
to Cogent Embedded, so we've been having an unpleasant situation where
a "normal" Condor board still can't mount NFS (unless an EtherAVB PHY
extension board is plugged in). Switch from EtherAVB to GEther at last!

Fixes: 8091788f3d38 ("arm64: dts: renesas: condor: add EtherAVB support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Linus' 'linux.git' repo -- coulan't find a fitting
brancxh in Simon Horman's 'renesas.git' repo...

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   47 ++++++++++++------------
 1 file changed, 24 insertions(+), 23 deletions(-)

Index: linux/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- linux.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ linux/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -15,7 +15,7 @@
 
 	aliases {
 		serial0 = &scif0;
-		ethernet0 = &avb;
+		ethernet0 = &gether;
 	};
 
 	chosen {
@@ -47,23 +47,6 @@
 	};
 };
 
-&avb {
-	pinctrl-0 = <&avb_pins>;
-	pinctrl-names = "default";
-
-	phy-mode = "rgmii-id";
-	phy-handle = <&phy0>;
-	renesas,no-ether-link;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		rxc-skew-ps = <1500>;
-		reg = <0>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-	};
-};
-
 &canfd {
 	pinctrl-0 = <&canfd0_pins>;
 	pinctrl-names = "default";
@@ -82,6 +65,23 @@
 	clock-frequency = <32768>;
 };
 
+&gether {
+	pinctrl-0 = <&gether_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy0>;
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -118,16 +118,17 @@
 };
 
 &pfc {
-	avb_pins: avb {
-		groups = "avb_mdio", "avb_rgmii";
-		function = "avb";
-	};
-
 	canfd0_pins: canfd0 {
 		groups = "canfd0_data_a";
 		function = "canfd0";
 	};
 
+	gether_pins: gether {
+		groups = "gether_mdio_a", "gether_rgmii",
+			 "gether_txcrefclk", "gether_txcrefclk_mega";
+		function = "gether";
+	};
+
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
