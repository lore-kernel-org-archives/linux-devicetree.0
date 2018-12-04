Return-Path: <SRS0=Is9l=ON=nvidia.com=spujar@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] arm64: dts: tegra: Add HDA node to Jetson Xavier
Date: Tue, 4 Dec 2018 17:44:22 +0530
Message-ID: <1543925662-18677-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Device tree node for hda is populated with relevant fields

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index f274562..93f9163 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -957,4 +957,20 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	hda@3510000 {
+		compatible = "nvidia,tegra194-hda", "nvidia,tegra30-hda";
+		reg = <0x0 0x3510000 0x0 0x10000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA194_CLK_HDA>,
+			<&bpmp TEGRA194_CLK_HDA2CODEC_2X>,
+			<&bpmp TEGRA194_CLK_HDA2HDMICODEC>;
+		clock-names = "hda", "hda2codec_2x", "hda2hdmi";
+		resets = <&bpmp TEGRA194_RESET_HDA>,
+			<&bpmp TEGRA194_RESET_HDA2CODEC_2X>,
+			<&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
+		reset-names = "hda", "hda2codec_2x", "hda2hdmi";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+		status = "disabled";
+	};
 };
-- 
2.7.4
