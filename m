From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 4/5] dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory controller
Date: Thu, 20 Jun 2019 22:52:49 +0530
Message-ID: <20190620172250.9102-5-vigneshr@ti.com>
References: <20190620172250.9102-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620172250.9102-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for TI's HyperBus memory controller present on
AM654 SoC.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

v7: Fix example to move HyperBus node out of syscon
v6: Use generic names for bindings

 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 52 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
new file mode 100644
index 000000000000..d424a0b88ab6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
@@ -0,0 +1,52 @@
+Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
+
+Required properties:
+- compatible : "ti,am654-hbmc" for AM654 SoC
+- reg : Two entries:
+	First entry pointed to the register space of HBMC controller
+	Second entry pointing to the memory map region dedicated for
+	MMIO access to attached flash devices
+- ranges : Address translation from offset within CS to allocated MMIO
+	   space in SoC
+
+Optional properties:
+- mux-controls : phandle to the multiplexer that controls selection of
+		 HBMC vs OSPI inside Flash SubSystem (FSS). Default is OSPI,
+		 if property is absent.
+		 See Documentation/devicetree/bindings/mux/reg-mux.txt
+		 for mmio-mux binding details
+
+Example:
+
+	system-controller@47000000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x47000000 0x0 0x100>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		hbmc_mux: multiplexer {
+			compatible = "mmio-mux";
+			#mux-control-cells = <1>;
+			mux-reg-masks = <0x4 0x2>; /* 0: reg 0x4, bit 1 */
+		};
+
+	};
+
+	hbmc: hyperbus@47034000 {
+		compatible = "ti,am654-hbmc";
+		reg = <0x0 0x47034000 0x0 0x100>,
+			<0x5 0x00000000 0x1 0x0000000>;
+		power-domains = <&k3_pds 55>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
+			 <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
+		mux-controls = <&hbmc_mux 0>;
+
+			/* Slave flash node */
+		flash@0,0 {
+			compatible = "cypress,hyperflash", "cfi-flash";
+			reg = <0x0 0x0 0x4000000>;
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 58c6ad3dae66..0d5a8c36682d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7359,6 +7359,7 @@ S:	Supported
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 
 HYPERVISOR VIRTUAL CONSOLE DRIVER
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.22.0
