From: Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/5] ARM: STi: Add STiH407 SoC support
Date: Fri, 28 Feb 2014 13:17:17 +0100
Message-ID: <1393589841-6634-2-git-send-email-maxime.coquelin@st.com>
References: <1393589841-6634-1-git-send-email-maxime.coquelin@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393589841-6634-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support to STiH407 SoC.

Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
---
 Documentation/arm/sti/stih407-overview.txt    | 18 ++++++++++++++++++
 Documentation/devicetree/bindings/arm/sti.txt | 15 +++++++++++++++
 arch/arm/mach-sti/Kconfig                     |  9 +++++++++
 arch/arm/mach-sti/board-dt.c                  |  1 +
 4 files changed, 43 insertions(+)
 create mode 100644 Documentation/arm/sti/stih407-overview.txt
 create mode 100644 Documentation/devicetree/bindings/arm/sti.txt

diff --git a/Documentation/arm/sti/stih407-overview.txt b/Documentation/arm/sti/stih407-overview.txt
new file mode 100644
index 0000000..3343f32
--- /dev/null
+++ b/Documentation/arm/sti/stih407-overview.txt
@@ -0,0 +1,18 @@
+			STiH407 Overview
+			================
+
+Introduction
+------------
+
+    The STiH407 is the new generation of SoC for Multi-HD, AVC set-top boxes
+    and server/connected client application for satellite, cable, terrestrial
+    and IP-STB markets.
+
+    Features
+    - ARM Cortex-A9 1.5 GHz dual core CPU (28nm)
+    - SATA2, USB 3.0, PCIe, Gbit Ethernet
+
+  Document Author
+  ---------------
+
+  Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, (c) 2014 ST Microelectronics
diff --git a/Documentation/devicetree/bindings/arm/sti.txt b/Documentation/devicetree/bindings/arm/sti.txt
new file mode 100644
index 0000000..92f16c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sti.txt
@@ -0,0 +1,15 @@
+ST STi Platforms Device Tree Bindings
+---------------------------------------
+
+Boards with the ST STiH415 SoC shall have the following properties:
+Required root node property:
+compatible = "st,stih415";
+
+Boards with the ST STiH416 SoC shall have the following properties:
+Required root node property:
+compatible = "st,stih416";
+
+Boards with the ST STiH407 SoC shall have the following properties:
+Required root node property:
+compatible = "st,stih407";
+
diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index d71654b..e596373 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -43,4 +43,13 @@ config SOC_STIH416
 	  and other digital audio/video applications using Flattened Device
 	  Trees.
 
+config SOC_STIH407
+	bool "STiH407 STMicroelectronics Consumer Electronics family"
+	default y
+	help
+	  This enables support for STMicroelectronics Digital Consumer
+	  Electronics family StiH407 parts, primarily targeted at set-top-box
+	  and other digital audio/video applications using Flattened Device
+	  Trees.
+
 endif
diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
index 1217fb5..df731f2 100644
--- a/arch/arm/mach-sti/board-dt.c
+++ b/arch/arm/mach-sti/board-dt.c
@@ -36,6 +36,7 @@ static void __init stih41x_machine_init(void)
 static const char *stih41x_dt_match[] __initdata = {
 	"st,stih415",
 	"st,stih416",
+	"st,stih407",
 	NULL
 };
 
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
