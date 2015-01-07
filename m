From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun8i: Add dts file for Ippo Q8H
 v1.2 tablets
Date: Wed,  7 Jan 2015 21:16:15 +0100
Message-ID: <1420661775-20424-3-git-send-email-hdegoede@redhat.com>
References: <1420661775-20424-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBGFIW2SQKGQE4ENWMQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1420661775-20424-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ippo Q8H v1.2 is almost identical to the v5, still it needs a separate
dtb file since some gpio-s surrounding the wlan/bluetooth are different,
it uses different camera sensors, and different DRAM timings.

Note that atm neither the wlan/bluetooth nor the camera are supported, so
atm their is no difference between the dts files, but because of the different
DRAM timings there are already separate u-boot configs for the 2 different
versions, and the 1.2 config refers to sun8i-a23-ippo-q8h-v1.2.dtb to be
future proof, so we need to provide a sun8i-a23-ippo-q8h-v1.2.dtb file.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                    |  3 +-
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts | 58 +++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4142831..7f66bab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -478,7 +478,8 @@ dtb-$(CONFIG_MACH_SUN7I) += \
 	sun7i-a20-olinuxino-micro.dtb \
 	sun7i-a20-pcduino3.dtb
 dtb-$(CONFIG_MACH_SUN8I) += \
-	sun8i-a23-ippo-q8h-v5.dtb
+	sun8i-a23-ippo-q8h-v5.dtb \
+	sun8i-a23-ippo-q8h-v1.2.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb
 dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
diff --git a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts
new file mode 100644
index 0000000..7056fc2
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
+ *     You should have received a copy of the GNU General Public
+ *     License along with this file; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
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
+/*
+ * The Ippo Q8H v1.2 is almost identical to the v5, still it needs a separate
+ * dtb file since some gpio-s surrounding the wlan/bluetooth are different,
+ * and it uses different camera sensors.
+ */
+
+#include "sun8i-a23-ippo-q8h-v5.dts"
+
+/ {
+	model = "Ippo Q8H Dual Core Tablet (v1.2)";
+};
-- 
2.1.0
