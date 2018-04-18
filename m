Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 10/11] arm64: dts: renesas: r8a7795: add OF graph for usb role switch
Date: Wed, 18 Apr 2018 17:10:04 +0900
Message-Id: <1524039005-30618-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds OF graph properties for usb role switch in r8a7795.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1d5e3ac..61c1fa0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1746,6 +1746,12 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_host_ep0: endpoint {
+					remote-endpoint = <&usb3_host_ep0>;
+				};
+			};
 		};
 
 		usb3_peri0: usb@ee020000 {
@@ -1757,6 +1763,44 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_peri_ep0: endpoint {
+					remote-endpoint = <&usb3_peri_sw0>;
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
+					port@1 {
+						reg = <1>;
+
+						usb3_host_sw0: endpoint {
+							remote-endpoint = <&usb3_host_ep0>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+						usb3_peri_sw0: endpoint {
+							remote-endpoint = <&usb3_peri_ep0>;
+							device-connection-id = "usb-role-switch";
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+						usb3_role_sw0_ep: endpoint {
+						};
+					};
+				};
+			};
 		};
 
 		usb_dmac0: dma-controller@e65a0000 {
-- 
1.9.1
