From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: Add the support for display5 equipped with Tianma (800x480) display
Date: Fri, 17 Nov 2017 11:24:04 +0100
Message-ID: <20171117102404.6678-2-lukma@denx.de>
References: <20171117102404.6678-1-lukma@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117102404.6678-1-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                         |  1 +
 .../dts/imx6q-display5-tianma-tm070-800x480.dts    | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-display5-tianma-tm070-800x480.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 10b3ad078dea..699c23b83b7f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -409,6 +409,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-dfi-fs700-m60.dtb \
 	imx6q-display5-mitsubishi-aa070-800x480.dtb \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
+	imx6q-display5-tianma-tm070-800x480.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-evi.dtb \
 	imx6q-gk802.dtb \
diff --git a/arch/arm/boot/dts/imx6q-display5-tianma-tm070-800x480.dts b/arch/arm/boot/dts/imx6q-display5-tianma-tm070-800x480.dts
new file mode 100644
index 000000000000..0c5655a08f3b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-display5-tianma-tm070-800x480.dts
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2017
+ * Lukasz Majewski, DENX Software Engineering, lukma-ynQEQJNshbs@public.gmane.org
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is licensed under the terms of the GNU General Public
+ *     License version 2.  This program is licensed "as is" without
+ *     any warranty of any kind, whether express or implied.
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
+ *     OTHER DEALINGS IN THE SOFTWARE
+ */
+
+/dts-v1/;
+
+#include "imx6q-display5.dtsi"
+
+&panel {
+	compatible = "tianma,tm070rvhg71";
+};
+
+&ldb {
+	lvds0: lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
