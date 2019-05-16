Return-Path: <SRS0=MLGG=TQ=nvidia.com=nkristam@kernel.org>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 6/8] arm64: tegra: Enable xudc on Jetson TX1
Date: Thu, 16 May 2019 12:09:30 +0530
Message-ID: <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
In-Reply-To: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Enable XUSB device mode driver for USB0 slot on Jetson TX1.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a7dc319..e0e67cd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1483,6 +1483,20 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	xudc@700d0000 {
+		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
+		phy-names = "usb2";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+		extcon = <&extcon_usb>;
+		status = "okay";
+	};
+
+	extcon_usb: extcon_vbus {
+		compatible = "linux,extcon-usb-gpio";
+		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.7.4
