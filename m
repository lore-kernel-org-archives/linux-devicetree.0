From: Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND controller bindings
Date: Tue, 25 Jun 2019 14:10:56 +0800
Message-ID: <1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: miquel.raynal@bootlin.com, marek.vasut@gmail.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, paul.burton@mips.com, liang.yang@amlogic.com, richard@nod.at, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, jianxin.pan@amlogic.com, stefan@agner.ch, devicetree@vger.kernel.org
Cc: juliensu@mxic.com.tw, lee.jones@linaro.org, masonccyang@mxic.com.tw, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Document the bindings used by the Macronix raw NAND controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/mtd/mxic-nand.txt          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
new file mode 100644
index 0000000..3d198e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
@@ -0,0 +1,26 @@
+Macronix Raw NAND Controller Device Tree Bindings
+-------------------------------------------------
+
+Required properties:
+- compatible: should be "mxic,raw-nand-ctlr"
+- reg: should contain 1 entrie for the registers
+- reg-names: should contain "regs"
+- interrupts: interrupt line connected to this NAND controller
+- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
+- clocks: should contain 3 entries for the "ps_clk", "send_clk" and
+	 "send_dly_clk" clocks
+
+Example:
+
+	nand: mxic-nfc@43c30000 {
+		compatible = "mxic,raw-nand-ctlr";
+		reg = <0x43c30000 0x10000>;
+		reg-names = "regs";
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+
+		nand-ecc-mode = "soft";
+		nand-ecc-algo = "bch";
+		nand-ecc-step-size = <512>;
+		nand-ecc-strength = <8>;
+	};
-- 
1.9.1
