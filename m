From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r8a77970: add LVDS support
Date: Fri, 19 Jan 2018 22:42:37 +0300
Message-ID: <20180119195439.145129729@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=arm64-dts-renesas-r8a77970-add-LVDS-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Define the generic R8A77970 part of the LVDS device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -654,6 +654,31 @@
 				port@1 {
 					reg = <1>;
 					du_out_lvds: endpoint {
+						remote-endpoint = <&lvds_in>;
+					};
+				};
+			};
+		};
+
+		lvds: lvds@feb90000 {
+			compatible = "renesas,r8a77970-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds_in: endpoint {
+						remote-endpoint = <&du_out_lvds>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds_out: endpoint {
 					};
 				};
 			};
