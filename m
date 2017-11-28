From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH v2 15/16] ARM: dts: imx6qdl: SolidRun: add v1.5 som with eMMC
Date: Tue, 28 Nov 2017 15:03:11 +0000
Message-ID: <E1eJhPj-0006Of-Pc@rmk-PC.armlinux.org.uk>
References: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128150045.GV31757-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add Cubox-i and Hummingboard variants for v1.5 SOMs, where the SOM has
eMMC fitted.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                         |  4 ++
 arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts  | 52 ++++++++++++++++++
 .../boot/dts/imx6dl-hummingboard-emmc-som-v15.dts  | 53 +++++++++++++++++++
 arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts   | 60 +++++++++++++++++++++
 .../boot/dts/imx6q-hummingboard-emmc-som-v15.dts   | 61 ++++++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-hummingboard-emmc-som-v15.dts
 create mode 100644 arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts
 create mode 100644 arch/arm/boot/dts/imx6q-hummingboard-emmc-som-v15.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1f3d331c22c2..b5ba7ad6ae30 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -372,6 +372,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-aristainetos2_7.dtb \
 	imx6dl-colibri-eval-v3.dtb \
 	imx6dl-cubox-i.dtb \
+	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
 	imx6dl-dfi-fs700-m60.dtb \
 	imx6dl-gw51xx.dtb \
@@ -385,6 +386,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-gw5903.dtb \
 	imx6dl-gw5904.dtb \
 	imx6dl-hummingboard.dtb \
+	imx6dl-hummingboard-emmc-som-v15.dtb \
 	imx6dl-hummingboard-som-v15.dtb \
 	imx6dl-icore.dtb \
 	imx6dl-icore-rqs.dtb \
@@ -423,6 +425,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-b850v3.dtb \
 	imx6q-cm-fx6.dtb \
 	imx6q-cubox-i.dtb \
+	imx6q-cubox-i-emmc-som-v15.dtb \
 	imx6q-cubox-i-som-v15.dtb \
 	imx6q-dfi-fs700-m60.dtb \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
@@ -442,6 +445,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-gw5904.dtb \
 	imx6q-h100.dtb \
 	imx6q-hummingboard.dtb \
+	imx6q-hummingboard-emmc-som-v15.dtb \
 	imx6q-hummingboard-som-v15.dtb \
 	imx6q-icore.dtb \
 	imx6q-icore-ofcap10.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts b/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts
new file mode 100644
index 000000000000..2b2fc360b865
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-cubox-i-emmc-som-v15.dts
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2014 Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
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
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-cubox-i.dtsi"
+
+/ {
+	model = "SolidRun Cubox-i Solo/DualLite (1.5som+emmc)";
+	compatible = "solidrun,cubox-i/dl", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6dl-hummingboard-emmc-som-v15.dts b/arch/arm/boot/dts/imx6dl-hummingboard-emmc-som-v15.dts
new file mode 100644
index 000000000000..a63f742f20d9
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-hummingboard-emmc-som-v15.dts
@@ -0,0 +1,53 @@
+/*
+ * Copyright (C) 2014 Rabeeh Khoury (rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org)
+ * Based on dt work by Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
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
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-hummingboard.dtsi"
+
+/ {
+	model = "SolidRun HummingBoard Solo/DualLite (1.5som+emmc)";
+	compatible = "solidrun,hummingboard/dl", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts b/arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts
new file mode 100644
index 000000000000..3e59ebbb3608
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-cubox-i-emmc-som-v15.dts
@@ -0,0 +1,60 @@
+/*
+ * Copyright (C) 2014 Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
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
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-cubox-i.dtsi"
+
+/ {
+	model = "SolidRun Cubox-i Dual/Quad (1.5som+emmc)";
+	compatible = "solidrun,cubox-i/q", "fsl,imx6q";
+};
+
+&sata {
+	status = "okay";
+	fsl,transmit-level-mV = <1104>;
+	fsl,transmit-boost-mdB = <0>;
+	fsl,transmit-atten-16ths = <9>;
+	fsl,no-spread-spectrum;
+};
diff --git a/arch/arm/boot/dts/imx6q-hummingboard-emmc-som-v15.dts b/arch/arm/boot/dts/imx6q-hummingboard-emmc-som-v15.dts
new file mode 100644
index 000000000000..c51b4e4fd71e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-hummingboard-emmc-som-v15.dts
@@ -0,0 +1,61 @@
+/*
+ * Copyright (C) 2014 Rabeeh Khoury (rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org)
+ * Based on dt work by Russell King
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License
+ *     version 2 as published by the Free Software Foundation.
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
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-ti.dtsi"
+#include "imx6qdl-sr-som-emmc.dtsi"
+#include "imx6qdl-hummingboard.dtsi"
+
+/ {
+	model = "SolidRun HummingBoard Dual/Quad (1.5som+emmc)";
+	compatible = "solidrun,hummingboard/q", "fsl,imx6q";
+};
+
+&sata {
+	status = "okay";
+	fsl,transmit-level-mV = <1025>;
+	fsl,transmit-boost-mdB = <3330>;
+	fsl,transmit-atten-16ths = <9>;
+	fsl,receive-eq-mdB = <3000>;
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
