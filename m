From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC] MIPS: BCM63XX: add simple Device Tree includes for all SoCs
Date: Sun, 11 Nov 2012 13:50:36 +0100
Message-ID: <1352638249-29298-3-git-send-email-jonas.gorski@gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352638249-29298-1-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add simple Device Tree include files for all currently supported SoCs.
These will be populated with device definitions as driver support
gets added.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/bcm63xx/dts/bcm6328.dtsi |   30 ++++++++++++++++++++++++++++++
 arch/mips/bcm63xx/dts/bcm6338.dtsi |   30 ++++++++++++++++++++++++++++++
 arch/mips/bcm63xx/dts/bcm6345.dtsi |   30 ++++++++++++++++++++++++++++++
 arch/mips/bcm63xx/dts/bcm6348.dtsi |   30 ++++++++++++++++++++++++++++++
 arch/mips/bcm63xx/dts/bcm6358.dtsi |   33 +++++++++++++++++++++++++++++++++
 arch/mips/bcm63xx/dts/bcm6368.dtsi |   33 +++++++++++++++++++++++++++++++++
 6 files changed, 186 insertions(+), 0 deletions(-)
 create mode 100644 arch/mips/bcm63xx/dts/bcm6328.dtsi
 create mode 100644 arch/mips/bcm63xx/dts/bcm6338.dtsi
 create mode 100644 arch/mips/bcm63xx/dts/bcm6345.dtsi
 create mode 100644 arch/mips/bcm63xx/dts/bcm6348.dtsi
 create mode 100644 arch/mips/bcm63xx/dts/bcm6358.dtsi
 create mode 100644 arch/mips/bcm63xx/dts/bcm6368.dtsi

diff --git a/arch/mips/bcm63xx/dts/bcm6328.dtsi b/arch/mips/bcm63xx/dts/bcm6328.dtsi
new file mode 100644
index 0000000..a0e1835
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6328.dtsi
@@ -0,0 +1,30 @@
+/*
+ * Device Tree Include file for Broadcom BCM6328 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6328";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips4350", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@10000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x10000000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
diff --git a/arch/mips/bcm63xx/dts/bcm6338.dtsi b/arch/mips/bcm63xx/dts/bcm6338.dtsi
new file mode 100644
index 0000000..21772d9
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6338.dtsi
@@ -0,0 +1,30 @@
+/*
+ * Device Tree Include file for Broadcom BCM6338 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6338";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips3300", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@fffe0000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xfffe0000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
diff --git a/arch/mips/bcm63xx/dts/bcm6345.dtsi b/arch/mips/bcm63xx/dts/bcm6345.dtsi
new file mode 100644
index 0000000..f1e7153
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6345.dtsi
@@ -0,0 +1,30 @@
+/*
+ * Device Tree Include file for Broadcom BCM6345 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6345";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips3300", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@fffe0000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xfffe0000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
diff --git a/arch/mips/bcm63xx/dts/bcm6348.dtsi b/arch/mips/bcm63xx/dts/bcm6348.dtsi
new file mode 100644
index 0000000..8a5a2dc
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6348.dtsi
@@ -0,0 +1,30 @@
+/*
+ * Device Tree Include file for Broadcom BCM6348 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6348";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips3300", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@fffe0000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xfffe0000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
diff --git a/arch/mips/bcm63xx/dts/bcm6358.dtsi b/arch/mips/bcm63xx/dts/bcm6358.dtsi
new file mode 100644
index 0000000..1d3f20f
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6358.dtsi
@@ -0,0 +1,33 @@
+/*
+ * Device Tree Include file for Broadcom BCM6358 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6358";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips4350", "mips,mips4Kc";
+		};
+		cpu@1 {
+			compatible = "brcm,bmips4350", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@fffe0000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xfffe0000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
diff --git a/arch/mips/bcm63xx/dts/bcm6368.dtsi b/arch/mips/bcm63xx/dts/bcm6368.dtsi
new file mode 100644
index 0000000..a7624b9
--- /dev/null
+++ b/arch/mips/bcm63xx/dts/bcm6368.dtsi
@@ -0,0 +1,33 @@
+/*
+ * Device Tree Include file for Broadcom BCM6368 SoC
+ *
+ * Copyright (C) 2012 Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6368";
+
+	cpus {
+		cpu@0 {
+			compatible = "brcm,bmips4350", "mips,mips4Kc";
+		};
+		cpu@1 {
+			compatible = "brcm,bmips4350", "mips,mips4Kc";
+		};
+	};
+
+	memory { device_type = "memory"; reg = <0 0>; };
+
+	ubus@10000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x10000000 0x20000>;
+		compatible = "simple-bus";
+	};
+};
-- 
1.7.2.5
