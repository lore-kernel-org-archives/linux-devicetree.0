From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 5/7] ARM: dts: keystone-k2g-evm: Add QSPI node
Date: Tue, 1 Aug 2017 10:24:32 +0530
Message-ID: <20170801045434.8733-6-vigneshr@ti.com>
References: <20170801045434.8733-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170801045434.8733-1-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

66AK2G EVM has a s25fl512s flash connected to QSPI CS0. Add pinmux for
QSPI and DT entries for the same.

Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 69 ++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 61883cb969d2..55d632977e8f 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -34,6 +34,18 @@
 			K2G_CORE_IOPAD(0x11d0) (BUFFER_CLASS_B | PIN_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
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
@@ -41,3 +53,60 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_pins>;
+	cdns,rclk-en;
+	status = "okay";
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
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "QSPI.u-boot";
+				reg = <0x00000000 0x00100000>;
+			};
+			partition@100000 {
+				label = "QSPI.u-boot-env";
+				reg = <0x00100000 0x00040000>;
+			};
+			partition@140000 {
+				label = "QSPI.skern";
+				reg = <0x00140000 0x0040000>;
+			};
+			partition@180000 {
+				label = "QSPI.sci-firmware";
+				reg = <0x00180000 0x0040000>;
+			};
+			partition@1c0000 {
+				label = "QSPI.kernel";
+				reg = <0x001c0000 0x0800000>;
+			};
+			partition@9c0000 {
+				label = "QSPI.u-boot-spl-os";
+				reg = <0x009c0000 0x0040000>;
+			};
+			partition@a00000 {
+				label = "QSPI.file-system";
+				reg = <0x00a00000 0x3600000>;
+			};
+		};
+	};
+};
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
