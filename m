From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: [PATCH 16/17] qcom: ipq4019: add crypto nodes to ipq4019 SoC and DK01 device tree
Date: Wed, 23 Mar 2016 17:05:11 -0500
Message-ID: <1458770712-10880-17-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com, Matthew McClintock <mmcclint@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This adds the crypto nodes to the ipq4019 device tree, it also adds the
BAM node used by crypto as well which the driver currently requires to
operate properly

The crypto driver itself depends on some other patches to qcom_bam_dma
to function properly:

https://lkml.org/lkml/2015/12/1/113

CC: Stanimir Varbanov <svarbanov@mm-sol.com>
Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi |  8 ++++++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 21032a8..2c347ad 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -93,6 +93,14 @@
 			status = "ok";
 		};
 
+		cryptobam: dma@8e04000 {
+			status = "ok";
+		};
+
+		crypto@8e3a000 {
+			status = "ok";
+		};
+
 		watchdog@b017000 {
 			status = "ok";
 		};
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index db48fd3..3cd42c0 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -147,6 +147,31 @@
 			status = "disabled";
 		};
 
+
+		cryptobam: dma@8e04000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x08e04000 0x20000>;
+			interrupts = <GIC_SPI 207 0>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely;
+			status = "disabled";
+		};
+
+		crypto@8e3a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x08e3a000 0x6000>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 2>, <&cryptobam 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
                 acc0: clock-controller@b088000 {
                         compatible = "qcom,kpss-acc-v1";
                         reg = <0x0b088000 0x1000>, <0xb008000 0x1000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
