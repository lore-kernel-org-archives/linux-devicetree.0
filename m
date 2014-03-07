From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH] Documentation: dt: Reduce fragmentation of <..> placeholders
Date: Fri,  7 Mar 2014 13:36:15 +0100
Message-ID: <1394195775-25043-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Placeholders <..> are sometimes used in the devicetree documentation
to define family-wide compatible strings (like fsl,<chip>-ipu where
chip can be any Freescale SoC).

These placeholders are loosly defined. This lead to some
fragmentation. Looking at the current placeholders, we have:

      3 <board>
     32 <chip>
      1 <chip name>
      1 <mcu-chip>
      1 <processor>
     30 <soc>
      1 <SOC>
      1 <soc-family>

This patch consolidates this to:

      3 <board>
     33 <chip>
      1 <mcu-chip>
      1 <processor>
     32 <soc>

Reported-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/samsung/sysreg.txt | 2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt | 2 +-
 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
index 0ab3251..b945b23 100644
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -1,7 +1,7 @@
 SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
 
 Properties:
- - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
+ - compatible : should contain "samsung,<chip>-sysreg", "syscon";
    For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
  - reg : offset and length of the register set.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
index 05bf82a..393a53a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
@@ -12,7 +12,7 @@ ST pinctrl driver controls PIO multiplexing block and also interacts with
 gpio driver to configure a pin.
 
 Required properties: (PIO multiplexing block)
-- compatible	: should be "st,<SOC>-<pio-block>-pinctrl"
+- compatible	: should be "st,<soc>-<pio-block>-pinctrl"
 	like st,stih415-sbc-pinctrl, st,stih415-front-pinctrl and so on.
 - gpio-controller : Indicates this device is a GPIO controller
 - #gpio-cells	  : Should be one. The first cell is the pin number.
diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index e39cb26..a7bee35 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -2,7 +2,7 @@ Allwinner SoCs Watchdog timer
 
 Required properties:
 
-- compatible : should be "allwinner,<soc-family>-wdt", the currently supported
+- compatible : should be "allwinner,<soc>-wdt", the currently supported
   SoC families being sun4i and sun6i
 - reg : Specifies base physical address and size of the registers.
 
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
