From: York Sun <york.sun@nxp.com>
Subject: [Patch v3 11/11] arm64: Update device tree for Layerscape SoCs
Date: Thu, 4 Aug 2016 15:58:36 -0700
Message-ID: <1470351518-22404-12-git-send-email-york.sun@nxp.com>
References: <1470351518-22404-1-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470351518-22404-1-git-send-email-york.sun@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-edac@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Liu Gang <Gang.Liu@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Hou Zhiqiang <B48286@freescale.com>, York Sun <york.sun@nxp.com>, Li Yang <leoli@freescale.com>, yangbo lu <yangbo.lu@freescale.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, stuart.yoder@nxp.com, oss@buserror.net, Rob Herring <robh+dt@kernel.org>, bp@alien8.de, Yuan Yao <yao.yuan@nxp.com>, Mingkai Hu <Mingkai.Hu@freescale.com>, linux-arm-kernel@lists.infradead.org, Rajesh Bhagat <rajesh.bhagat@freescale.com>, morbidrsa@gmail.com, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Add DDR memory controller nodes to enable EDAC driver.

Signed-off-by: York Sun <york.sun@nxp.com>

---
Change log
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
