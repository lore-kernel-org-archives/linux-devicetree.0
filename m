From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 4/5] ARM: dts: armada388-clearfog: move ethernet related nodes
Date: Mon, 02 Jan 2017 15:27:26 +0000
Message-ID: <E1cO4WE-00006H-UI@rmk-PC.armlinux.org.uk>
References: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO4UH-0008SR-GW-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the ethernet, buffer manager, and mdio nodes over to use label form
to reference the devices rather than replicating the device path.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dtsi         | 44 +++++++------
 .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 76 +++++++++++-----------
 2 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index eeb845bbe3f3..6149699eefc2 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -71,27 +71,6 @@
 
 	soc {
 		internal-regs {
-			ethernet@30000 {
-				phy-mode = "sgmii";
-				buffer-manager = <&bm>;
-				bm,pool-long = <2>;
-				bm,pool-short = <1>;
-				status = "okay";
-			};
-
-			ethernet@34000 {
-				phy-mode = "sgmii";
-				buffer-manager = <&bm>;
-				bm,pool-long = <3>;
-				bm,pool-short = <1>;
-				status = "okay";
-
-				fixed-link {
-					speed = <1000>;
-					full-duplex;
-				};
-			};
-
 			sata@a8000 {
 				/* pinctrl? */
 				status = "okay";
@@ -147,6 +126,29 @@
 	};
 };
 
+&eth1 {
+	/* ethernet@30000 */
+	bm,pool-long = <2>;
+	bm,pool-short = <1>;
+	buffer-manager = <&bm>;
+	phy-mode = "sgmii";
+	status = "okay";
+};
+
+&eth2 {
+	/* ethernet@34000 */
+	bm,pool-long = <3>;
+	bm,pool-short = <1>;
+	buffer-manager = <&bm>;
+	phy-mode = "sgmii";
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
 &i2c0 {
 	/* Is there anything on this? */
 	clock-frequency = <100000>;
diff --git a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
index e397421d1531..681962a6395b 100644
--- a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
+++ b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
@@ -62,38 +62,6 @@
 			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
 
 		internal-regs {
-			ethernet@70000 {
-				pinctrl-0 = <&ge0_rgmii_pins>;
-				pinctrl-names = "default";
-				phy = <&phy_dedicated>;
-				phy-mode = "rgmii-id";
-				buffer-manager = <&bm>;
-				bm,pool-long = <0>;
-				bm,pool-short = <1>;
-				status = "okay";
-			};
-
-			mdio@72004 {
-				/*
-				 * Add the phy clock here, so the phy can be
-				 * accessed to read its IDs prior to binding
-				 * with the driver.
-				 */
-				pinctrl-0 = <&mdio_pins &microsom_phy_clk_pins>;
-				pinctrl-names = "default";
-
-				phy_dedicated: ethernet-phy@0 {
-					/*
-					 * Annoyingly, the marvell phy driver
-					 * configures the LED register, rather
-					 * than preserving reset-loaded setting.
-					 * We undo that rubbish here.
-					 */
-					marvell,reg-init = <3 16 0 0x101e>;
-					reg = <0>;
-				};
-			};
-
 			rtc@a3800 {
 				/*
 				 * If the rtc doesn't work, run "date reset"
@@ -107,16 +75,46 @@
 				pinctrl-names = "default";
 				status = "okay";
 			};
-
-			bm@c8000 {
-				status = "okay";
-			};
 		};
+	};
+};
 
-		bm-bppi {
-			status = "okay";
-		};
+&bm {
+	status = "okay";
+};
+
+&bm_bppi {
+	status = "okay";
+};
+
+&eth0 {
+	/* ethernet@70000 */
+	pinctrl-0 = <&ge0_rgmii_pins>;
+	pinctrl-names = "default";
+	phy = <&phy_dedicated>;
+	phy-mode = "rgmii-id";
+	buffer-manager = <&bm>;
+	bm,pool-long = <0>;
+	bm,pool-short = <1>;
+	status = "okay";
+};
+
+&mdio {
+	/*
+	 * Add the phy clock here, so the phy can be accessed to read its
+	 * IDs prior to binding with the driver.
+	 */
+	pinctrl-0 = <&mdio_pins &microsom_phy_clk_pins>;
+	pinctrl-names = "default";
 
+	phy_dedicated: ethernet-phy@0 {
+		/*
+		 * Annoyingly, the marvell phy driver configures the LED
+		 * register, rather than preserving reset-loaded setting.
+		 * We undo that rubbish here.
+		 */
+		marvell,reg-init = <3 16 0 0x101e>;
+		reg = <0>;
 	};
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
