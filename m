From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 01/10] mtd: st_spi_fsm: dt-bindings: Deprecate generic compatible string
Date: Wed, 21 Jan 2015 15:24:19 +0000
Message-ID: <1421853868-8262-2-git-send-email-lee.jones@linaro.org>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421853868-8262-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver now obtains platform information via DT matching, which requires
a compatible string per platform.  This change introduces the new specific
strings and deprecates the old generic one.

We also take out all of the old, unused properties which are no longer
required.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/st-fsm.txt | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c248939..389e43d 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -1,26 +1,19 @@
 * ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
 
 Required properties:
-  - compatible : Should be "st,spi-fsm"
+  - compatible : Should be one of;
+		   "st,stid127-spi-fsm"
+		   "st,stih407-spi-fsm"
+		   "st,stih416-spi-fsm"
   - reg        : Contains register's location and length.
-  - reg-names  : Should contain the reg names "spi-fsm"
   - interrupts : The interrupt number
   - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-
-Optional properties:
-  - st,syscfg          : Phandle to boot-device system configuration registers
-  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
-  - st,boot-device-spi : Expected boot-device value if booted via this device
+  - st,syscfg  : Phandle to boot-device system configuration registers
 
 Example:
 	spifsm: spifsm@fe902000{
-	        compatible         = "st,spi-fsm";
+		compatible         = "st,stih407-spi-fsm";
 	        reg                =  <0xfe902000 0x1000>;
-	        reg-names          = "spi-fsm";
 	        pinctrl-0          = <&pinctrl_fsm>;
 		st,syscfg	   = <&syscfg_rear>;
-	        st,boot-device-reg = <0x958>;
-	        st,boot-device-spi = <0x1a>;
-		status = "okay";
 	};
-
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
