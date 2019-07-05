Return-Path: <SRS0=6UxY=VC=nvidia.com=nkristam@kernel.org>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V5 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date: Fri, 5 Jul 2019 17:11:49 +0530
Message-ID: <1562326911-26855-7-git-send-email-nkristam@nvidia.com>
In-Reply-To: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
References: <1562326911-26855-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Enable XUSB device mode driver for USB0 slot on Jetson TX1.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a7dc319..f3f3704 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1483,6 +1483,21 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	xudc@700d0000 {
+		status = "okay";
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
+		phy-names = "usb2";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+		usb-role-switch;
+
+		port {
+			usb_role_switch: endpoint@0 {
+				remote-endpoint = <&usb_b_conn_ep>;
+			};
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1641,4 +1656,18 @@
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+
+	usb_type_b: connector {
+		compatible = "linux,typeb-conn-gpio", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+
+		port {
+			usb_b_conn_ep: endpoint@0 {
+				remote-endpoint = <&usb_role_switch>;
+			};
+		};
+	};
+
 };
-- 
2.7.4
