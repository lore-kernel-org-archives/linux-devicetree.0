From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 15/20] ARM: sun5i: Move display blocks to A13
Date: Mon, 16 May 2016 14:47:15 +0200
Message-ID: <1463402840-17062-16-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Most of the display engine is shared between the R8 and the A13. Move t=
he
common parts to the =C3=8113 DTSI.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a13.dtsi | 112 +++++++++++++++++++++++++++++++=
+++++
 arch/arm/boot/dts/sun5i-r8.dtsi  | 120 ++-----------------------------=
--------
 2 files changed, 117 insertions(+), 115 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i=
-a13.dtsi
index 79b5d513c142..e012890e0cf2 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -207,7 +207,50 @@
 		};
 	};
=20
+	display-engine {
+		compatible =3D "allwinner,sun5i-a13-display-engine";
+		allwinner,pipelines =3D <&fe0>;
+	};
+
 	soc@01c00000 {
+		tcon0: lcd-controller@01c0c000 {
+			compatible =3D "allwinner,sun5i-a13-tcon";
+			reg =3D <0x01c0c000 0x1000>;
+			interrupts =3D <44>;
+			resets =3D <&tcon_ch0_clk 1>;
+			reset-names =3D "lcd";
+			clocks =3D <&ahb_gates 36>,
+				 <&tcon_ch0_clk>,
+				 <&tcon_ch1_clk>;
+			clock-names =3D "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names =3D "tcon-pixel-clock";
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				tcon0_in: port@0 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+					reg =3D <0>;
+
+					tcon0_in_be0: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&be0_out_tcon0>;
+					};
+				};
+
+				tcon0_out: port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+					reg =3D <1>;
+				};
+			};
+		};
+
 		pwm: pwm@01c20e00 {
 			compatible =3D "allwinner,sun5i-a13-pwm";
 			reg =3D <0x01c20e00 0xc>;
@@ -215,6 +258,75 @@
 			#pwm-cells =3D <3>;
 			status =3D "disabled";
 		};
+
+		fe0: display-frontend@01e00000 {
+			compatible =3D "allwinner,sun5i-a13-display-frontend";
+			reg =3D <0x01e00000 0x20000>;
+			interrupts =3D <47>;
+			clocks =3D <&ahb_gates 46>, <&de_fe_clk>,
+				 <&dram_gates 25>;
+			clock-names =3D "ahb", "mod",
+				      "ram";
+			resets =3D <&de_fe_clk>;
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				fe0_out: port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+					reg =3D <1>;
+
+					fe0_out_be0: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&be0_in_fe0>;
+					};
+				};
+			};
+		};
+
+		be0: display-backend@01e60000 {
+			compatible =3D "allwinner,sun5i-a13-display-backend";
+			reg =3D <0x01e60000 0x10000>;
+			clocks =3D <&ahb_gates 44>, <&de_be_clk>,
+				 <&dram_gates 26>;
+			clock-names =3D "ahb", "mod",
+				      "ram";
+			resets =3D <&de_be_clk>;
+			status =3D "disabled";
+
+			assigned-clocks =3D <&de_be_clk>;
+			assigned-clock-rates =3D <300000000>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				be0_in: port@0 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+					reg =3D <0>;
+
+					be0_in_fe0: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&fe0_out_be0>;
+					};
+				};
+
+				be0_out: port@1 {
+					#address-cells =3D <1>;
+					#size-cells =3D <0>;
+					reg =3D <1>;
+
+					be0_out_tcon0: endpoint@0 {
+						reg =3D <0>;
+						remote-endpoint =3D <&tcon0_in_be0>;
+					};
+				};
+			};
+		};
 	};
 };
=20
diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-=
r8.dtsi
index c04cf690b858..8b058f53b7dc 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -76,122 +76,12 @@
 				};
 			};
 		};
-
-		tcon0: lcd-controller@01c0c000 {
-			compatible =3D "allwinner,sun5i-a13-tcon";
-			reg =3D <0x01c0c000 0x1000>;
-			interrupts =3D <44>;
-			resets =3D <&tcon_ch0_clk 1>;
-			reset-names =3D "lcd";
-			clocks =3D <&ahb_gates 36>,
-				 <&tcon_ch0_clk>,
-				 <&tcon_ch1_clk>;
-			clock-names =3D "ahb",
-				      "tcon-ch0",
-				      "tcon-ch1";
-			clock-output-names =3D "tcon-pixel-clock";
-			status =3D "disabled";
-
-			ports {
-				#address-cells =3D <1>;
-				#size-cells =3D <0>;
-
-				tcon0_in: port@0 {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					reg =3D <0>;
-
-					tcon0_in_be0: endpoint@0 {
-						reg =3D <0>;
-						remote-endpoint =3D <&be0_out_tcon0>;
-					};
-				};
-
-				tcon0_out: port@1 {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					reg =3D <1>;
-
-					tcon0_out_tve0: endpoint@1 {
-						reg =3D <1>;
-						remote-endpoint =3D <&tve0_in_tcon0>;
-					};
-				};
-			};
-		};
-
-		fe0: display-frontend@01e00000 {
-			compatible =3D "allwinner,sun5i-a13-display-frontend";
-			reg =3D <0x01e00000 0x20000>;
-			interrupts =3D <47>;
-			clocks =3D <&ahb_gates 46>, <&de_fe_clk>,
-				 <&dram_gates 25>;
-			clock-names =3D "ahb", "mod",
-				      "ram";
-			resets =3D <&de_fe_clk>;
-			status =3D "disabled";
-
-			ports {
-				#address-cells =3D <1>;
-				#size-cells =3D <0>;
-
-				fe0_out: port@1 {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					reg =3D <1>;
-
-					fe0_out_be0: endpoint@0 {
-						reg =3D <0>;
-						remote-endpoint =3D <&be0_in_fe0>;
-					};
-				};
-			};
-		};
-
-		be0: display-backend@01e60000 {
-			compatible =3D "allwinner,sun5i-a13-display-backend";
-			reg =3D <0x01e60000 0x10000>;
-			clocks =3D <&ahb_gates 44>, <&de_be_clk>,
-				 <&dram_gates 26>;
-			clock-names =3D "ahb", "mod",
-				      "ram";
-			resets =3D <&de_be_clk>;
-			status =3D "disabled";
-
-			assigned-clocks =3D <&de_be_clk>;
-			assigned-clock-rates =3D <300000000>;
-
-			ports {
-				#address-cells =3D <1>;
-				#size-cells =3D <0>;
-
-				be0_in: port@0 {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					reg =3D <0>;
-
-					be0_in_fe0: endpoint@0 {
-						reg =3D <0>;
-						remote-endpoint =3D <&fe0_out_be0>;
-					};
-				};
-
-				be0_out: port@1 {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					reg =3D <1>;
-
-					be0_out_tcon0: endpoint@0 {
-						reg =3D <0>;
-						remote-endpoint =3D <&tcon0_in_be0>;
-					};
-				};
-			};
-		};
 	};
+};
=20
-	display-engine {
-		compatible =3D "allwinner,sun5i-a13-display-engine";
-		allwinner,pipelines =3D <&fe0>;
+&tcon0_out {
+	tcon0_out_tve0: endpoint@1 {
+		reg =3D <1>;
+		remote-endpoint =3D <&tve0_in_tcon0>;
 	};
 };
--=20
2.8.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
