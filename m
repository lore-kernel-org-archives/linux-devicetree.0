From: York Sun <york.sun@nxp.com>
Subject: [Patch v4 9/9] arm64: Update device tree for Layerscape SoCs
Date: Tue, 9 Aug 2016 14:59:39 -0700
Message-ID: <1470780000-16750-1-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-edac@vger.kernel.org
Cc: morbidrsa@gmail.com, oss@buserror.net, stuart.yoder@nxp.com, bp@alien8.de, York Sun <york.sun@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>, Liu Gang <Gang.Liu@nxp.com>, Mingkai Hu <Mingkai.Hu@freescale.com>, Rajesh Bhagat <rajesh.bhagat@freescale.com>, Yuan Yao <yao.yuan@nxp.com>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Li Yang <leoli@freescale.com>, yangbo lu <yangbo.lu@freescale.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DDR memory controller nodes to enable EDAC driver.

Signed-off-by: York Sun <york.sun@nxp.com>

---
Change log
  v4: no change
  v3: no change
  v2: no change

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  7 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index de0323b..cb33f23 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -196,6 +196,13 @@
 			bus-width = <4>;
 		};
 
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <0 144 0x4>;
+			big-endian;
+		};
+
 		dspi0: dspi@2100000 {
 			compatible = "fsl,ls1043a-dspi", "fsl,ls1021a-v1.0-dspi";
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 3187c82..3221e5c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -689,4 +689,18 @@
 			interrupts = <0 12 4>;
 		};
 	};
+
+	ddr1: memory-controller@1080000 {
+		compatible = "fsl,qoriq-memory-controller";
+		reg = <0x0 0x1080000 0x0 0x1000>;
+		interrupts = <0 17 0x4>;
+		little-endian;
+	};
+
+	ddr2: memory-controller@1090000 {
+		compatible = "fsl,qoriq-memory-controller";
+		reg = <0x0 0x1090000 0x0 0x1000>;
+		interrupts = <0 18 0x4>;
+		little-endian;
+	};
 };
-- 
2.7.4
