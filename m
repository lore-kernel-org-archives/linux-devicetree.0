Return-Path: <SRS0=MR/7=F4=linaro.org=shawn.guo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: mmc: add bindings for hi3798cv200-dw-mshc
Date: Tue,  6 Mar 2018 14:58:50 +0800
Message-Id: <1520319531-24661-2-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1520319531-24661-1-git-send-email-shawn.guo@linaro.org>
References: <1520319531-24661-1-git-send-email-shawn.guo@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: tianshuliang <tianshuliang@hisilicon.com>

Hisilicon hi3798cv200 SoC extends the dw-mshc controller
for additional clock control. Add device tree bindings for
hi3798cv200-dw-mshc.

Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/mmc/hi3798cv200-dw-mshc.txt           | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt

diff --git a/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
new file mode 100644
index 000000000000..a0693b7145f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/hi3798cv200-dw-mshc.txt
@@ -0,0 +1,40 @@
+* Hisilicon Hi3798CV200 specific extensions to the Synopsys Designware Mobile
+  Storage Host Controller
+
+Read synopsys-dw-mshc.txt for more details
+
+The Synopsys designware mobile storage host controller is used to interface
+a SoC with storage medium such as eMMC or SD/MMC cards. This file documents
+differences between the core Synopsys dw mshc controller properties described
+by synopsys-dw-mshc.txt and the properties used by the Hisilicon Hi3798CV200
+specific extensions to the Synopsys Designware Mobile Storage Host Controller.
+
+Required Properties:
+- compatible: Should contain "hisilicon,hi3798cv200-dw-mshc".
+- clocks: A list of phandle + clock-specifier pairs for the clocks listed
+  in clock-names.
+- clock-names: Should contain the following:
+	"ciu" - The ciu clock described in synopsys-dw-mshc.txt.
+	"biu" - The biu clock described in synopsys-dw-mshc.txt.
+	"ciu-sample" - Hi3798CV200 extended phase clock for ciu sampling.
+	"ciu-drive"  - Hi3798CV200 extended phase clock for ciu driving.
+
+Example:
+
+	emmc: mmc@9830000 {
+		compatible = "hisilicon,hi3798cv200-dw-mshc";
+		reg = <0x9830000 0x10000>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&crg HISTB_MMC_CIU_CLK>,
+			 <&crg HISTB_MMC_BIU_CLK>,
+			 <&crg HISTB_MMC_SAMPLE_CLK>,
+			 <&crg HISTB_MMC_DRV_CLK>;
+		clock-names = "ciu", "biu", "ciu-sample", "ciu-drive";
+		fifo-depth = <256>;
+		clock-frequency = <200000000>;
+		cap-mmc-highspeed;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		non-removable;
+		bus-width = <8>;
+	};
-- 
1.9.1
