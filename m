From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v2 2/2] arm64: dts: ls1043a: add the DTS node for QSPI support
Date: Wed, 13 Apr 2016 18:08:27 +0800
Message-ID: <1460542107-45807-3-git-send-email-yao.yuan@freescale.com>
References: <1460542107-45807-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460542107-45807-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, pawel.moll@arm.com, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yuan Yao <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v2:
	Remove unused property.
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 13 +++++++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi    | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index 80688ac..9d3e9fe 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -166,3 +166,16 @@
 &lpuart0 {
 	status = "okay";
 };
+
+&qspi {
+	bus-num = <0>;
+	status = "okay";
+
+	qflash0: s25fl128s@0 {
+		compatible = "spansion,m25p80";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index be72bf5..e70b7f2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -171,6 +171,20 @@
 			interrupts = <0 43 0x4>;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1043a-qspi", "fsl,ls1021a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+				<0x0 0x40000000 0x0 0x4000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <0 99 0x4>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clockgen 4 0>, <&clockgen 4 0>;
+			big-endian;
+			status = "disabled";
+		};
+
 		esdhc: esdhc@1560000 {
 			compatible = "fsl,ls1043a-esdhc", "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
-- 
2.1.0.27.g96db324
