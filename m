From: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/2] dt-bindings: spi: Documentation for Hi6220 spi driver
Date: Thu, 19 Nov 2015 16:37:08 +0800
Message-ID: <1447922229-60552-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kkojima-ugdvmXx6nUh3+QwDJ9on6Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

dt-bindings: spi: Documentation for Hi6220 spi driver

Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/spi/spi-hi6220.txt         | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-hi6220.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-hi6220.txt b/Documentation/devicetree/bindings/spi/spi-hi6220.txt
new file mode 100644
index 0000000..91aa169
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-hi6220.txt
@@ -0,0 +1,45 @@
+Hi6220 SPI controller
+
+Required properties:
+- compatible : "arm,pl022", "arm,primecell"
+- reg : Offset and length of the register set for the device
+- interrupts : Should contain SPI controller interrupt
+- num-cs : total number of chipselects
+
+Required Board Specific Properties:
+
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+
+Optional properties:
+- cs-gpios : should specify GPIOs used for chipselects.
+  The gpios will be referred to as reg = <index> in the SPI child nodes.
+  If unspecified, a single SPI device without a chip select can be used.
+- dmas : Two or more DMA channel specifiers following the convention outlined
+         in bindings/dma/dma.txt
+- dma-names: Names for the dma channels, if present. There must be at
+	     least one channel named "tx" for transmit and named "rx" for
+             receive.
+
+Example:
+             spi_0: spi@f7106000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x0 0xf7106000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0 50 4>;
+			bus-id = <0>;
+			enable-dma = <1>;
+			dmas =	<&dma0 12 &dma0 13>;
+			dma-names = "rx", "tx";
+
+			clocks = <&clock_sys HI6220_SPI_CLK>;
+			clock-names = "apb_pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_pmx_func &spi0_cfg_func>;
+			num-cs = <4>;
+			cs-gpios = <&gpio6 2 0>, <&gpio6 3 0>, <&gpio6 4 0>, <&gpio6 5 0>;
+
+			status = "ok";
+		};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
