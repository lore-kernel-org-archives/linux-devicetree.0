From: Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [RESEND V2 1/2] dt-bindings: Document the DesignWare IP reset bindings
Date: Tue, 23 Jul 2019 17:17:27 +0200
Message-ID: <1563895048-30038-2-git-send-email-luis.oliveira@synopsys.com>
References: <1563895048-30038-1-git-send-email-luis.oliveira@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563895048-30038-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the
DesignWare IP reset controller.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changelog
-no changes

 .../devicetree/bindings/reset/snps,dw-reset.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/snps,dw-reset.txt b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
new file mode 100644
index 0000000..f94f911
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
+	dw_rst_1: reset-controller@0000 {
+		compatible = "snps,dw-high-reset";
+		reg = <0x0000 0x4>;
+		#reset-cells = <1>;
+	};
+
+	dw_rst_2: reset-controller@1000 {i
+		compatible = "snps,dw-low-reset";
+		reg = <0x1000 0x8>;
+		#reset-cells = <1>;
+	};
-- 
2.7.4
