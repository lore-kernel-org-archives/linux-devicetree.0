From: <dongchun.zhu@mediatek.com>
Subject: [V2, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Date: Tue, 10 Sep 2019 21:04:45 +0800
Message-ID: <20190910130446.26413-2-dongchun.zhu@mediatek.com>
References: <media: ov8856: DT bindings and sensor mode improvements>
 <20190910130446.26413-1-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mchehab@kernel.org, andriy.shevchenko@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, sakari.ailus@linux.intel.com, drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds device tree bindings documentation for the ov8856 CMOS
image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../devicetree/bindings/media/i2c/ov8856.txt       | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.txt b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
new file mode 100644
index 0000000..99c654a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
@@ -0,0 +1,51 @@
+* Omnivision OV8856 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: Shall be "ovti,ov8856"
+- reg: I2C bus address of the device. Depending on how the sensor is wired,
+       it shall be <0x10>.
+- clocks: Reference to the xvclk input clock.
+- clock-names: Shall be "xvclk".
+- clock-frequency: Frequency of the xclk clock.
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- avdd-supply: Analog voltage supply, 2.8 volts
+- dvdd-supply: Digital core voltage supply, 1.5 volts
+- reset-gpios: High active reset gpio
+
+The device node shall contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- link-frequencies: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+
+&i2c1 {
+	ov8856: camera-sensor@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&clk_24m_cam>;
+
+		clocks = <&cru SCLK_TESTCLKOUT1>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+
+		avdd-supply = <&mt6358_vcama2_reg>;
+		dvdd-supply = <&mt6358_vcamd_reg>;
+		dovdd-supply = <&mt6358_vcamio_reg>;
+		reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
+
+		port {
+			/* MIPI CSI-2 bus endpoint */
+			wcam_out: endpoint {
+				remote-endpoint = <&mipi_in_wcam>;
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000 180000000>;
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e..7746c6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11889,6 +11889,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.txt
 
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.9.2
