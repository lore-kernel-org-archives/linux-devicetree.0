From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/4] ARM: dts: stm32: fix memory nodes to match with DT validation tool
Date: Mon, 7 Oct 2019 16:33:59 +0200
Message-ID: <20191007143402.13266-2-alexandre.torgue@st.com>
References: <20191007143402.13266-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007143402.13266-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DT validation ("make dtbs_check") has shown that some memory nodes were not
correctly written. This commit fixes this kind of issue:

"stm32f746-disco.dt.yaml: /: memory: False schema does not allow
{'device_type': ['memory'], 'reg': [[3221225472, 8388608]]}"

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index ba08624c6237..36ac61d0828c 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -60,7 +60,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@00000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 2b1664884ae7..d7bb2027cfaa 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -55,7 +55,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xc0000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index e19d0fe7dbda..30c0f6717871 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -59,7 +59,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@90000000 {
 		device_type = "memory";
 		reg = <0x90000000 0x800000>;
 	};
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index a3ff04940aec..539aa5903fdd 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -60,7 +60,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@00000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x1000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index 0ba9c5b08ab9..569d23cc61e5 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -55,7 +55,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x800000>;
 	};
diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 6f1d0ac8c31c..1626e00bb2cb 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -55,7 +55,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xC0000000 0x1000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
index 3acd2e9c434e..e446d311c520 100644
--- a/arch/arm/boot/dts/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/stm32h743i-disco.dts
@@ -53,7 +53,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@d0000000 {
 		device_type = "memory";
 		reg = <0xd0000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index e4d3c58f3d97..8f398178f5e5 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -53,7 +53,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@d0000000 {
 		device_type = "memory";
 		reg = <0xd0000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 0615d1c8a6fc..e2aa45e9ba57 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -25,6 +25,7 @@
 	};
 
 	memory@c0000000 {
+		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
 	};
 
-- 
2.17.1
