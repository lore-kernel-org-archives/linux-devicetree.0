From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/3] extcon: arizona: Add extcon specific device tree binding document
Date: Wed, 14 Oct 2015 15:12:22 +0100
Message-ID: <1444831944-4655-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  |   15 +++++++++++++++
 MAINTAINERS                                        |    1 +
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-arizona.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
new file mode 100644
index 0000000..e1705fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -0,0 +1,15 @@
+Cirrus Logic Arizona class audio SoCs
+
+These devices are audio SoCs with extensive digital capabilities and a range
+of analogue I/O.
+
+This document lists Extcon specific bindings, see the primary binding document:
+  ../mfd/arizona.txt
+
+Optional properties:
+
+  - wlf,hpdet-channel : Headphone detection channel.
+    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to HPDETL
+    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
+    If this node is not mentioned or if the value is unknown, then
+    headphone detection mode is set to HPDETL.
diff --git a/MAINTAINERS b/MAINTAINERS
index 9f6685f..08c804a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11393,6 +11393,7 @@ T:	git https://github.com/CirrusLogic/linux-drivers.git
 W:	https://github.com/CirrusLogic/linux-drivers/wiki
 S:	Supported
 F:	Documentation/hwmon/wm83??
+F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
 F:	drivers/extcon/extcon-arizona.c
-- 
1.7.2.5
