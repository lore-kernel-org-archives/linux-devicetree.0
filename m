Return-Path: <SRS0=1FkI=T6=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH RFC 1/2] dt-bindings: mfd: document Renesas RPC-IF bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
Message-ID: <ef926f7b-fb0e-19f3-1ab4-f8a0763a0a3b@cogentembedded.com>
Date: Thu, 30 May 2019 23:01:52 +0300
MIME-Version: 1.0
In-Reply-To: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Mason Yang <masonccyang@mxic.com.tw>, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
HyperFlash connected to the SoC to be accessed via the external address
space read mode or the manual mode.

Document the device tree bindings for the Renesas RPC-IF found in the R-Car
gen3 SoCs.

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/mfd/rpc-if.txt |   52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

Index: mfd/Documentation/devicetree/bindings/mfd/rpc-if.txt
===================================================================
--- /dev/null
+++ mfd/Documentation/devicetree/bindings/mfd/rpc-if.txt
@@ -0,0 +1,52 @@
+Renesas Reduced Pin Count Interface (RPC-IF)
+--------------------------------------------
+
+Renesas RPC-IF allows a SPI flash or HyperFlash connected to the SoC to
+be accessed via the external address space read mode or the manual mode.
+
+Required properties:
+- compatible: should be an SoC-specific compatible value, followed by
+		"renesas,rcar-gen3-rpcif" as a fallback.
+		supported SoC-specific values are:
+		"renesas,r8a77980-rpcif" (R-Car V3H),
+		"renesas,r8a77995-rpcif" (R-Car D3).
+- reg: should list 3 register areas:
+	1st for the RPC-IF registers,
+	2nd for the direct mapping read mode,
+	3rd for the write buffer area.
+- reg-names: should contain "regs", "dirmap", and "wbuf".
+- clocks: should contain the clock phandle/specifier pair for the module clock.
+- power-domains: should contain the power domain phandle/specifier pair.
+- resets: should contain the reset controller phandle/specifier pair.
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+
+The flash chip itself should be represented by a subnode of the RPC-IF node.
+The flash interface is selected based on the "compatible" property of this
+subnode:
+- if it contains "jedec,spi-nor", then SPI is used;
+- if it contains "cfi-flash", then HyperFlash is used.
+
+Example:
+
+	rpc: spi@ee200000 {
+		compatible = "renesas,r8a77995-rpcif",
+			     "renesas,rcar-gen3-rpcif";
+		reg = <0 0xee200000 0 0x200>,
+		      <0 0x08000000 0 0x4000000>,
+		      <0 0xee208000 0 0x100>;
+		reg-names = "regs", "dirmap", "wbuf";
+		clocks = <&cpg CPG_MOD 917>;
+		power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+		resets = <&cpg 917>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <40000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <1>;
+		};
+	};
