Return-Path: <SRS0=5SpS=FV=gmail.com=jassisinghbrar@kernel.org>
From: jassisinghbrar@gmail.com
Subject: [PATCHv4 1/3] dt-bindings: spi: Add DT bindings for Synquacer
Date: Tue, 27 Feb 2018 18:28:35 +0530
Message-Id: <1519736315-3931-1-git-send-email-jassisinghbrar@gmail.com>
In-Reply-To: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: tpiepho@impinj.com, broonie@kernel.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Jassi Brar <jaswinder.singh@linaro.org>

This patch adds documentation for Device-Tree bindings for the
Socionext Synquacer spi driver.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/spi-synquacer.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-synquacer.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-synquacer.txt b/Documentation/devicetree/bindings/spi/spi-synquacer.txt
new file mode 100644
index 0000000..d945a4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-synquacer.txt
@@ -0,0 +1,23 @@
+* Socionext Synquacer HS-SPI bindings
+
+Required Properties:
+- compatible: should be "socionext,synquacer-spi"
+- reg: physical base address of the controller and length of memory mapped
+       region.
+- clocks: core clock iHCLK. Optional rate clock iPCLK (default is iHCLK)
+- clock-names: Shall be "iHCLK" and "iPCLK" respectively
+
+Optional Properties:
+- socionext,use-rtm: boolean, if required to use "retimed clock" for RX
+- socionext,set-aces: boolean, if same active clock edges field to be set.
+
+Example:
+
+	spi0: spi@ff110000 {
+		compatible = "socionext,synquacer-spi";
+		reg = <0xff110000 0x1000>;
+		clocks = <&clk_fip006_spi>;
+		clock-names = "iHCLK";
+		socionext,use-rtm;
+		socionext,set-aces;
+	};
-- 
2.7.4
