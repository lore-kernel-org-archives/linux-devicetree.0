Return-Path: <SRS0=dGTv=GC=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Subject: [PATCH V8 2/9] arm64: tegra: Add SATA node for Tegra210
Date: Mon, 12 Mar 2018 17:10:31 +0530
Message-ID: <1520854838-21779-3-git-send-email-pchandru@nvidia.com>
In-Reply-To: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com
Cc: preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com, Preetham Ramchandra <pchandru@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Preetham Ramchandra <pchandru@nvidia.com>

Populate the SATA node for Tegra210.

Signed-off-by: Preetham Ramchandra <pchandru@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 9c2402108772..3be920efee82 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -798,6 +798,22 @@
 		#iommu-cells = <1>;
 	};
 
+	sata@70020000 {
+		compatible = "nvidia,tegra210-ahci";
+		reg = <0x0 0x70027000 0x0 0x2000>, /* AHCI */
+		      <0x0 0x70020000 0x0 0x7000>, /* SATA */
+		      <0x0 0x70001100 0x0 0x1000>; /* SATA AUX */
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_SATA>,
+			 <&tegra_car TEGRA210_CLK_SATA_OOB>;
+		clock-names = "sata", "sata-oob";
+		resets = <&tegra_car 124>,
+			 <&tegra_car 123>,
+			 <&tegra_car 129>;
+		reset-names = "sata", "sata-oob", "sata-cold";
+		status = "disabled";
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra210-hda", "nvidia,tegra30-hda";
 		reg = <0x0 0x70030000 0x0 0x10000>;
-- 
2.7.4
