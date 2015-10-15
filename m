From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 3/3] mfd: arizona: Remove bindings covered in new subsystem specific docs
Date: Thu, 15 Oct 2015 14:47:08 +0100
Message-ID: <1444916828-8965-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1444916828-8965-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444916828-8965-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Binding documentation has been added in new subsystem specific binding
documents. This patch removes the now duplicate documentation from the
MFD documentation. Also whilst we are at it add a missing maintainers
entry for the MFD binding document.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

No change since v1.

Thanks,
Charles

 Documentation/devicetree/bindings/mfd/arizona.txt |   30 ++------------------
 MAINTAINERS                                       |    1 +
 2 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a8fee60..077c4fe 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -30,21 +30,9 @@ Required properties:
   - #gpio-cells : Must be 2. The first cell is the pin number and the
     second cell is used to specify optional parameters (currently unused).
 
-  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
-    as covered in Documentation/devicetree/bindings/regulator/regulator.txt
-
-  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies (wm5102,
-    wm5110, wm8280, wm8998, wm1814)
-
-  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (wm5102,
-    wm5110, wm8280, wm8998, wm1814)
-
-  - SPKVDD-supply : Speaker driver power supply (wm8997)
-
 Optional properties:
 
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
-  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
 
   - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
     for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
@@ -67,21 +55,9 @@ Optional properties:
     present, the number of values should be less than or equal to the
     number of inputs, unspecified inputs will use the chip default.
 
-  - wlf,hpdet-channel : Headphone detection channel.
-    ARIZONA_ACCDET_MODE_HPL or 1 - Headphone detect mode is set to HPDETL
-    ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
-    If this node is not mentioned or if the value is unknown, then
-    headphone detection mode is set to HPDETL.
-
-  - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
-    they are being externally supplied. As covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt
-
-Optional subnodes:
-  - ldo1 : Initial data for the LDO1 regulator, as covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt
-  - micvdd : Initial data for the MICVDD regulator, as covered in
-    Documentation/devicetree/bindings/regulator/regulator.txt
+Also see child specific device properties:
+  Regulator - ../regulator/arizona-regulator.txt
+  Extcon    - ../extcon/extcon-arizona.txt
 
 Example:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 0e0889b..047f5d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11382,6 +11382,7 @@ S:	Supported
 F:	Documentation/hwmon/wm83??
 F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
 F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
+F:	Documentation/devicetree/bindings/mfd/arizona.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
 F:	drivers/extcon/extcon-arizona.c
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
