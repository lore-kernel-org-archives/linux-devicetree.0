From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: [PATCHv4] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Thu,  5 May 2016 11:08:52 +0200
Message-ID: <1462439332-26215-1-git-send-email-oliver@schinagl.nl>
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBNE3VS4QKGQEDICHUVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Tsvetan Usunov <tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: info-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are 3 kinds of OLinuXino Lime2 boards.
One without any on board storage, one with NAND storage and one with
eMMC storage. This patch adds the eMMC variant of boards.

eMMC storage is different from a regular SD card in that it is soldered
on the board and cannot be changed. Additionally, it shares pins with
the NAND module and with the second SPI port.

Changeslog:

v4:
  Add board compatibles

v3:
  Add pwr-seq-emmc with the reset gpio

v2:
  Remove unsupported no-1.8-v property, add vqmmc property

v1:
  Initial bare bone version

Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
---
 .../boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts    | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
new file mode 100644
index 0000000..5ea4915
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
@@ -0,0 +1,82 @@
+ /*
+ * Copyright 2015 - Ultimaker B.V.
+ * Author Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
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
+#include "sun7i-a20-olinuxino-lime2.dts"
+
+/ {
+	model = "Olimex A20-OLinuXino-LIME2-eMMC";
+	compatible = "olimex,a20-olinuxino-lime2-emmc", "allwinner,sun7i-a20";
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
+	mmc2_pins_nrst: mmc2@0 {
+		allwinner,pins = "PC16";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
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
2.8.1
