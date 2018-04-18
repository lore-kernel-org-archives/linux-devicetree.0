Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 11/11] arm64: dts: renesas: r8a7795: salvator-xs: add OF graph for usb role switch
Date: Wed, 18 Apr 2018 17:10:05 +0900
Message-Id: <1524039005-30618-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds OF graph properties for usb role switch.

TODO:
 - Each node should be in salvator-common.dtsi.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index 8b50ceb..c815fca 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -36,6 +36,24 @@
 		device_type = "memory";
 		reg = <0x7 0x00000000 0x0 0x40000000>;
 	};
+
+	/* TODO: should be into salvator-common.dtsi */
+	usb3 {
+		compatible = "usb-a-connector";
+		label = "USB3_0";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				usb3_connector0: endpoint {
+					remote-endpoint = <&usb3_role_sw0_ep>;
+				};
+			};
+		};
+	};
 };
 
 &du {
@@ -107,3 +125,13 @@
 
 	status = "okay";
 };
+
+	&usb3_role_sw0 {
+		ports {
+			port@3 {
+				usb3_role_sw0_ep: endpoint {
+					remote-endpoint = <&usb3_connector0>;
+				};
+			};
+		};
+	};
-- 
1.9.1
