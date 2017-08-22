From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH 2/3] ARM: dts: sun7i: Add dts file for A20-OLinuXino-MICRO-exGB
Date: Tue, 22 Aug 2017 14:43:12 +0300
Message-ID: <20170822114313.9038-3-stefan@olimex.com>
References: <20170822114313.9038-1-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170822114313.9038-1-stefan@olimex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

A20-OLinuXino-MICRO has option with onboard eMMC chip. For
now it's only shipped with 4BG chip, but in the future this
may change.

Currently the board is called "A20-OLinuXino-MICRO-e4GB".
The dts is named "-exGB" to represent all eMMC configurations -
e4GB, e8GB, etc.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/Makefile                         |  1 +
 .../boot/dts/sun7i-a20-olinuxino-micro-exgb.dts    | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4b17f35dc9a7..90cbfc57948e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -880,6 +880,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-olinuxino-lime2.dtb \
 	sun7i-a20-olinuxino-lime2-emmc.dtb \
 	sun7i-a20-olinuxino-micro.dtb \
+	sun7i-a20-olinuxino-micro-exgb.dtb \
 	sun7i-a20-orangepi.dtb \
 	sun7i-a20-orangepi-mini.dtb \
 	sun7i-a20-pcduino3.dtb \
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts
new file mode 100644
index 000000000000..2c592748e474
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro-exgb.dts
@@ -0,0 +1,81 @@
+/*
+ * Copyright 2017 Olimex Ltd.
+ *
+ * Stefan Mavrodiev <stefan@olimex.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "sun7i-a20-olinuxino-micro.dts"
+
+/ {
+	model = "Olimex A20-OLinuXino-MICRO-exGB";
+	compatible = "olimex,a20-olinuxino-micro-exgb", "allwinner,sun7i-a20";
+
+	mmc2_pwrseq: pwrseq {
+		pinctrl-0 = <&mmc2_pins_nrst>;
+		pinctrl-names = "default";
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&pio 2 16 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pio {
+	mmc2_pins_nrst: mmc2-rst-pin {
+		pins = "PC16";
+		function = "gpio_out";
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins_a>;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	non-removable;
+	mmc-pwrseq = <&mmc2_pwrseq>;
+	status = "okay";
+
+	emmc: emmc@0 {
+		reg = <0>;
+		compatible = "mmc-card";
+		broken-hpi;
+	};
+};
-- 
2.11.0
