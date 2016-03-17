From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] regmap: fix documentation to match code
Date: Thu, 17 Mar 2016 18:23:40 +0100
Message-ID: <1458235427-3856540-1-git-send-email-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Xiubo Li <Li.Xiubo-3arQi8VN3Tc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The regmap binding talks about one thing, which is register
endianess, and it gets almost every aspect of it wrong.

This replaces the current text of the file with a version
that makes more sense and that matches what we implement
now.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Fixes: a06c488da0b0 ("regmap: Add explict native endian flag to DT bindings")
Fixes: 275876e208e2 ("regmap: Add the DT binding documentation for endianness")
---
Hi Mark,

I think this got lost when you fixed the code for 4.6, and the current
documentation still has the initial text you wrote back in January
that doesn't actually explain what happens. 

 .../devicetree/bindings/regmap/regmap.txt          | 59 +++++++---------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/regmap/regmap.txt b/Documentation/devicetree/bindings/regmap/regmap.txt
index e98a9652ccc8..0127be360fe8 100644
--- a/Documentation/devicetree/bindings/regmap/regmap.txt
+++ b/Documentation/devicetree/bindings/regmap/regmap.txt
@@ -1,50 +1,29 @@
-Device-Tree binding for regmap
-
-The endianness mode of CPU & Device scenarios:
-Index     Device     Endianness properties
----------------------------------------------------
-1         BE         'big-endian'
-2         LE         'little-endian'
-3	  Native     'native-endian'
-
-For one device driver, which will run in different scenarios above
-on different SoCs using the devicetree, we need one way to simplify
-this.
+Devicetree binding for regmap
 
 Optional properties:
-- {big,little,native}-endian: these are boolean properties, if absent
-  then the implementation will choose a default based on the device
-  being controlled.  These properties are for register values and all
-  the buffers only.  Native endian means that the CPU and device have
-  the same endianness.
 
-Examples:
-Scenario 1 : CPU in LE mode & device in LE mode.
-dev: dev@40031000 {
-	      compatible = "name";
-	      reg = <0x40031000 0x1000>;
-	      ...
-};
+   little-endian,
+   big-endian,
+   native-endian:	See common-properties.txt for a definition
 
-Scenario 2 : CPU in LE mode & device in BE mode.
-dev: dev@40031000 {
-	      compatible = "name";
-	      reg = <0x40031000 0x1000>;
-	      ...
-	      big-endian;
-};
+Note:
+Regmap defaults to little-endian register access on MMIO based
+devices, this is by far the most common setting. On CPU
+architectures that typically run big-endian operating systems
+(e.g. PowerPC), registers can be defined as big-endian and must
+be marked that way in the devicetree.
 
-Scenario 3 : CPU in BE mode & device in BE mode.
-dev: dev@40031000 {
-	      compatible = "name";
-	      reg = <0x40031000 0x1000>;
-	      ...
-};
+On SoCs that can be operated in both big-endian and little-endian
+modes, with a single hardware switch controlling both the endianess
+of the CPU and a byteswap for MMIO registers (e.g. many Broadcom MIPS
+chips), "native-endian" is used to allow using the same device tree
+blob in both cases.
 
-Scenario 4 : CPU in BE mode & device in LE mode.
+Examples:
+Scenario 1 : a register set in big-endian mode.
 dev: dev@40031000 {
-	      compatible = "name";
+	      compatible = "syscon";
 	      reg = <0x40031000 0x1000>;
+	      big-endian;
 	      ...
-	      little-endian;
 };
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
