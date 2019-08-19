From: Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v7 2/2] dt-bindings: mtd: Document Macronix raw NAND controller bindings
Date: Mon, 19 Aug 2019 15:19:09 +0800
Message-ID: <1566199149-5669-3-git-send-email-masonccyang@mxic.com.tw>
References: <1566199149-5669-1-git-send-email-masonccyang@mxic.com.tw>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566199149-5669-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com, dwmw2@infradead.org, bbrezillon@kernel.org, computersforpeace@gmail.com, vigneshr@ti.com, robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com
Cc: lee.jones@linaro.org, juliensu@mxic.com.tw, linux-kernel@vger.kernel.org, paul.burton@mips.com, liang.yang@amlogic.com, linux-mtd@lists.infradead.org, masonccyang@mxic.com.tw, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the bindings used by the Macronix raw NAND controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
new file mode 100644
index 0000000..46c5529
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
@@ -0,0 +1,36 @@
+Macronix Raw NAND Controller Device Tree Bindings
+-------------------------------------------------
+
+Required properties:
+- compatible: should be "mxic,multi-itfc-v009-nand-controller"
+- reg: should contain 1 entry for the registers
+- #address-cells: should be set to 1
+- #size-cells: should be set to 0
+- interrupts: interrupt line connected to this raw NAND controller
+- clock-names: should contain "ps", "send" and "send_dly"
+- clocks: should contain 3 phandles for the "ps", "send" and
+	 "send_dly" clocks
+
+Children nodes:
+- children nodes represent the available NAND chips.
+
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml
+for more details on generic bindings.
+
+Example:
+
+	nand: nand-controller@43c30000 {
+		compatible = "mxic,multi-itfc-v009-nand-controller";
+		reg = <0x43c30000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts = <GIC_SPI 0x1d IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send", "send_dly", "ps";
+
+		nand@0 {
+			reg = <0>;
+			nand-ecc-mode = "soft";
+			nand-ecc-algo = "bch";
+		};
+	};
-- 
1.9.1
