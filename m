From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 4/6] ARM: dts: keystone-k2g-evm: Add QSPI DT node.
Date: Thu, 23 Nov 2017 13:21:52 +0530
Message-ID: <20171123075154.3938-5-vigneshr@ti.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171123075154.3938-1-vigneshr@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

66AK2G EVM has a s25fl512s flash connected to QSPI. Add DT nodes for the
same.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 03b3e7c5dc8e..8d100217e38f 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -103,6 +103,18 @@
 			K2G_CORE_IOPAD(0x11b4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_mosi.spi1_mosi */
 		>;
 	};
+
+	qspi_pins: pinmux_qspi_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1204) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_clk.qspi_clk */
+			K2G_CORE_IOPAD(0x1208) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_rclk.qspi_rclk */
+			K2G_CORE_IOPAD(0x120c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d0.qspi_d0 */
+			K2G_CORE_IOPAD(0x1210) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d1.qspi_d1 */
+			K2G_CORE_IOPAD(0x1214) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d2.qspi_d2 */
+			K2G_CORE_IOPAD(0x1218) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_d3.qspi_d3 */
+			K2G_CORE_IOPAD(0x121c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* qspi_csn0.qspi_csn0 */
+		>;
+	};
 };
 
 &uart0 {
@@ -204,3 +216,50 @@
 		};
 	};
 };
+
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_pins>;
+	cdns,rclk-en;
+
+	flash0: m25p80@0 {
+		compatible = "s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <96000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		cdns,read-delay = <5>;
+		cdns,tshsl-ns = <500>;
+		cdns,tsd2d-ns = <500>;
+		cdns,tchsh-ns = <119>;
+		cdns,tslch-ns = <119>;
+
+		partition@0 {
+			label = "QSPI.u-boot-spl-os";
+			reg = <0x00000000 0x00100000>;
+		};
+		partition@1 {
+			label = "QSPI.u-boot-env";
+			reg = <0x00100000 0x00040000>;
+		};
+		partition@2 {
+			label = "QSPI.skern";
+			reg = <0x00140000 0x0040000>;
+		};
+		partition@3 {
+			label = "QSPI.pmmc-firmware";
+			reg = <0x00180000 0x0040000>;
+		};
+		partition@4 {
+			label = "QSPI.kernel";
+			reg = <0x001C0000 0x0800000>;
+		};
+		partition@5 {
+			label = "QSPI.file-system";
+			reg = <0x009C0000 0x3640000>;
+		};
+	};
+};
-- 
2.15.0
