From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 1/3] extcon: arizona: Add extcon specific device tree binding document
Date: Thu, 15 Oct 2015 14:47:06 +0100
Message-ID: <1444916828-8965-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Subystem specific bindings for the Arizona devices are being factored
out of the MFD binding document into seperate documents for each
subsystem. This patch adds a binding document that covers the existing
extcon specific bindings.

Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

Changes since v1:
 - Added more commit message

Thanks,
Charles

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
index fb2ba3d..915f9ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11380,6 +11380,7 @@ T:	git git://opensource.wolfsonmicro.com/linux-2.6-audioplus
 W:	http://opensource.wolfsonmicro.com/content/linux-drivers-wolfson-devices
 S:	Supported
 F:	Documentation/hwmon/wm83??
+F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
 F:	drivers/extcon/extcon-arizona.c
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
