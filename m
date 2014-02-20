From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 5/5] Add sample DTS and DTSS schema
Date: Thu, 20 Feb 2014 19:06:51 +0100
Message-ID: <1392919611-10746-6-git-send-email-t.figa@samsung.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1392919611-10746-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 sample.dts  | 70 +++++++++++++++++++++++++++++++++++++++++++++++++
 schema.dtss | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 sample.dts
 create mode 100644 schema.dtss

diff --git a/sample.dts b/sample.dts
new file mode 100644
index 0000000..f962051
--- /dev/null
+++ b/sample.dts
@@ -0,0 +1,70 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+	compatible = "foo,bar";
+	model = "Foo Bar board";
+
+	chosen {
+		bootargs = "console=ttySAC2,115200N8";
+	};
+
+	aliases {
+		i2c0 = &i2c_0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x40000000 0x40000000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gic: interrupt-controller@10490000 {
+			compatible = "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x10490000 0x1000>, <0x10480000 0x100>;
+			cpu-offset = <0x4000>;
+		};
+
+		i2c_0: i2c@13860000 {
+			compatible = "nvidia,tegra20-i2c";
+			reg = <0x13860000 0x100>;
+			interrupts = <0 57 0>;
+			clocks = <&clocks 43>, <&clocks 28>;
+			clock-names = "div-clk", "fast-clk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			audio-codec@33 {
+				compatible = "wlf,wm8903";
+				reg = <0x33>;
+				gpio-controller;
+				#gpio-cells = <1>;
+			};
+		};
+
+		gpio: pinctrl@11400000 {
+			compatible = "foo,bar-gpio";
+			reg = <0x11400000 0x1000>;
+			interrupts = <0 47 0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		clocks: clock-controller@15440000 {
+			compatible = "foo,bar-clocks";
+			reg = <0x15440000 0x1000>;
+			#clock-cells = <1>;
+		};
+	};
+};
diff --git a/schema.dtss b/schema.dtss
new file mode 100644
index 0000000..7a819fe
--- /dev/null
+++ b/schema.dtss
@@ -0,0 +1,86 @@
+/*
+ * schema.dtss - Sample Device Tree schema file.
+ *
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.
+ * Author: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dtss-v1/;
+
+root-node {
+	/match/ path = "/";
+	/require/ mmio-bus;
+
+	compatible;
+	/optional/ model;
+};
+
+wlf,wm8903 {
+	/match/ compatible = "wlf,wm8903";
+
+	/optional/ micdet-cfg;
+	/optional/ micdet-delay;
+	/optional/ gpio-cfg;
+
+	/require/ i2c-device;
+
+	/require/ gpio-provider {
+		cells = <1>;
+	};
+
+	/use/ interrupts {
+		count = <1>;
+	};
+};
+
+nvidia,tegra20-i2c {
+	/match/ compatible = "nvidia,tegra20-i2c", "nvidia,tegra30-i2c";
+
+	resets;
+	reset-names;
+	dmas;
+	dma-names;
+
+	/require/ i2c-bus;
+
+	/require/ mmio-device {
+		reg-count = <1>;
+	};
+
+	/require/ interrupts {
+		count = <1>;
+	};
+
+	/require/ clocks {
+		names = "div-clk", "fast-clk";
+	};
+};
+
+foo,bar-gpio {
+	/match/ compatible = "foo,bar-gpio";
+
+	/require/ interrupts {
+		count = <1>;
+	};
+
+	/require/ mmio-device {
+		reg-count = <1>;
+	};
+
+	/require/ gpio-provider {
+		cells = <2>;
+	};
+
+	/require/ interrupt-controller {
+		cells = <2>;
+	};
+};
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
