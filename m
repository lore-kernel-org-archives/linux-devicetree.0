Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 6/6] arm64: dts: renesas: r8a7795: add OF graph for usb role switch
Date: Thu, 26 Apr 2018 20:26:46 +0900
Message-Id: <1524742006-17984-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524742006-17984-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds OF graph properties for usb role switch in r8a7795.

TODO:
 - separate a few patches to add new properties into each node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 5ae85d8..2e52835 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2206,6 +2206,12 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_host_ep: endpoint {
+					remote-endpoint = <&usb3_host_ep>;
+				};
+			};
 		};
 
 		usb3_peri0: usb@ee020000 {
@@ -2217,6 +2223,38 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_peri_ep: endpoint {
+					remote-endpoint = <&usb3_peri_sw>;
+				};
+			};
+
+			usb3_role_sw0: usb3-role-sw {
+				compatible = "renesas,rcar-usb3-role-switch";
+				renesas,host = <&xhci0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb3_host_sw: endpoint {
+							remote-endpoint = <&usb3_host_ep>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb3_peri_sw: endpoint {
+							remote-endpoint = <&usb3_peri_ep>;
+						};
+					};
+				};
+			};
 		};
 
 		ohci0: usb@ee080000 {
-- 
1.9.1
