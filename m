From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: STi: Move sound related nodes without reg property out of soc
Date: Wed, 10 Jan 2018 09:21:08 +0100
Message-ID: <1515572469-19276-9-git-send-email-patrice.chotard@st.com>
References: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515572469-19276-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patrice.chotard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Move sti_sasg_codec and sound nodes outside from soc node, this allows
to fix the following warning when compiling dtb with W=1 option:

arch/arm/boot/dts/stih407-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@0 has a unit name, but no reg property
arch/arm/boot/dts/stih407-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@1 has a unit name, but no reg property
arch/arm/boot/dts/stih407-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@2 has a unit name, but no reg property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /soc/sti-sasg-codec missing or empty reg/ranges property

arch/arm/boot/dts/stih410-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@0 has a unit name, but no reg property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@1 has a unit name, but no reg property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@2 has a unit name, but no reg property
arch/arm/boot/dts/stih407-b2120.dtb: Warning (simple_bus_reg):
Node /soc/sound missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /soc/sti-sasg-codec missing or empty reg/ranges property

arch/arm/boot/dts/stih410-b2260.dtb: Warning (unit_address_vs_reg):
Node /soc/sound/simple-audio-card,dai-link@0 has a unit name, but no reg property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /soc/sti-sasg-codec missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /soc/sound missing or empty reg/ranges property

arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /soc/sti-sasg-codec missing or empty reg/ranges property

Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi |  14 ++---
 arch/arm/boot/dts/stih410-b2260.dts   |  38 ++++++-------
 arch/arm/boot/dts/stihxxx-b2120.dtsi  | 100 +++++++++++++++++-----------------
 3 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 1608c70..e62dfb8 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -118,6 +118,13 @@
 		status = "okay";
 	};
 
+	sti_sasg_codec: sti-sasg-codec {
+		compatible = "st,stih407-sas-codec";
+		#sound-dai-cells = <1>;
+		status = "disabled";
+		st,syscfg = <&syscfg_core>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -885,13 +892,6 @@
 			status = "disabled";
 		};
 
-		sti_sasg_codec: sti-sasg-codec {
-			compatible = "st,stih407-sas-codec";
-			#sound-dai-cells = <1>;
-			status = "disabled";
-			st,syscfg = <&syscfg_core>;
-		};
-
 		sti_uni_player0: sti-uni-player@8d80000 {
 			compatible = "st,stih407-uni-player-hdmi";
 			#sound-dai-cells = <0>;
diff --git a/arch/arm/boot/dts/stih410-b2260.dts b/arch/arm/boot/dts/stih410-b2260.dts
index a2d1e54..007a028 100644
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@ -65,6 +65,25 @@
 		status = "okay";
 	};
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "STI-B2260";
+		status = "okay";
+
+		simple-audio-card,dai-link {
+			/* DAC */
+			format = "i2s";
+			mclk-fs = <128>;
+			cpu {
+				sound-dai = <&sti_uni_player0>;
+			};
+
+			codec {
+				sound-dai = <&sti_hdmi>;
+			};
+		};
+	};
+
 	soc {
 		/* Low speed expansion connector */
 		uart0: serial@9830000 {
@@ -181,25 +200,6 @@
 			status = "okay";
 		};
 
-		sound {
-			compatible = "simple-audio-card";
-			simple-audio-card,name = "STI-B2260";
-			status = "okay";
-
-			simple-audio-card,dai-link@0 {
-				/* DAC */
-				format = "i2s";
-				mclk-fs = <128>;
-				cpu {
-					sound-dai = <&sti_uni_player0>;
-				};
-
-				codec {
-					sound-dai = <&sti_hdmi>;
-				};
-			};
-		};
-
 		miphy28lp_phy: miphy28lp {
 
 			phy_port1: port@9b2a000 {
diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 1fd3a2b..9e3f1b5 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -23,6 +23,56 @@
 		};
 	};
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "STI-B2120";
+		status = "okay";
+
+		simple-audio-card,dai-link0 {
+			/* HDMI */
+			format = "i2s";
+			mclk-fs = <128>;
+			cpu {
+				sound-dai = <&sti_uni_player0>;
+			};
+
+			codec {
+				sound-dai = <&sti_hdmi>;
+			};
+		};
+		simple-audio-card,dai-link1 {
+			/* DAC */
+			format = "i2s";
+			mclk-fs = <256>;
+			frame-inversion = <1>;
+			cpu {
+				sound-dai = <&sti_uni_player2>;
+			};
+
+			codec {
+				sound-dai = <&sti_sasg_codec 1>;
+			};
+		};
+		simple-audio-card,dai-link2 {
+			/* SPDIF */
+			format = "left_j";
+			mclk-fs = <128>;
+			cpu {
+				sound-dai = <&sti_uni_player3>;
+			};
+
+			codec {
+				sound-dai = <&sti_sasg_codec 0>;
+			};
+		};
+	};
+
+	sti_sasg_codec: sti-sasg-codec {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spdif_out>;
+	};
+
 	soc {
 		sbc_serial0: serial@9530000 {
 			status = "okay";
@@ -146,55 +196,5 @@
 		sti_uni_player3: sti-uni-player@8d85000 {
 			status = "okay";
 		};
-
-		sti_sasg_codec: sti-sasg-codec {
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_spdif_out>;
-		};
-
-		sound {
-			compatible = "simple-audio-card";
-			simple-audio-card,name = "STI-B2120";
-			status = "okay";
-
-			simple-audio-card,dai-link@0 {
-				/* HDMI */
-				format = "i2s";
-				mclk-fs = <128>;
-				cpu {
-					sound-dai = <&sti_uni_player0>;
-				};
-
-				codec {
-					sound-dai = <&sti_hdmi>;
-				};
-			};
-			simple-audio-card,dai-link@1 {
-				/* DAC */
-				format = "i2s";
-				mclk-fs = <256>;
-				frame-inversion = <1>;
-				cpu {
-					sound-dai = <&sti_uni_player2>;
-				};
-
-				codec {
-					sound-dai = <&sti_sasg_codec 1>;
-				};
-			};
-			simple-audio-card,dai-link@2 {
-				/* SPDIF */
-				format = "left_j";
-				mclk-fs = <128>;
-				cpu {
-					sound-dai = <&sti_uni_player3>;
-				};
-
-				codec {
-					sound-dai = <&sti_sasg_codec 0>;
-				};
-			};
-		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
