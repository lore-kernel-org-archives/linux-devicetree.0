From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH 2/2] dt-bindings: Document the DesignWare IP reset bindings
Date: Mon, 13 May 2019 17:41:28 +0200
Message-ID: <57b3e24f85b0838fc7fafe35abab00e19993d458.1557759340.git.gustavo.pimentel@synopsys.com>
References: <cover.1557759340.git.gustavo.pimentel@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557759340.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1557759340.git.gustavo.pimentel@synopsys.com>
References: <cover.1557759340.git.gustavo.pimentel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Luis Oliveira <Luis.Oliveira@synopsys.com>
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the
DesignWare IP reset controller.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
 .../devicetree/bindings/reset/snps,dw-reset.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/snps,dw-reset.txt b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
new file mode 100644
index 0000000..5316212
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
@@ -0,0 +1,30 @@
+Synopsys DesignWare Reset controller
+=======================================
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+
+- compatible: should be one of the following.
+	"snps,dw-high-reset" - for active high configuration
+	"snps,dw-low-reset" - for active low configuration
+
+- reg: physical base address of the controller and length of memory mapped
+	region.
+
+- #reset-cells: must be 1.
+
+example:
+
+	dw_rst: reset-controller@0000 {
+		compatible = "dw,dw-high-reset";
+		reg = <0x0000 0x4>;
+		#reset-cells = <1>;
+	};
+
+	dw_rst: reset-controller@1000 {
+		compatible = "dw,dw-low-reset";
+		reg = <0x1000 0x4>;
+		#reset-cells = <1>;
+	};
-- 
2.7.4
