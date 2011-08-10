From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Enabling OLPC XO-1.5 HDD LED through device tree
Date: Wed, 10 Aug 2011 21:41:33 +0100 (BST)
Message-ID: <20110810204133.61B209D401C@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

We'd like to use devicetree and gpio-leds magic to enable the HDD LED
on the XO-1.5 laptop. There are 3 steps needed. Review would be
appreciated:

1. The vx855-gpio driver patch just resubmitted:
http://marc.info/?l=linux-kernel&m=131300843332366&w=2

2. Addition of the gpio-leds device to the list of DT nodes probed as platform
devices on OLPC laptops (see patch included at end of mail), which will be
submitted to x86 tree for inclusion.

3. The following code which we plan to include in OpenFirmware for XO-1.5.
As advised, the gpio-leds node has been moved to the root of the tree, which
avoids the problems discussed in the thread titled
"Same parts of DT being probed twice."



\ to be placed in new file via/gpio.fth
\ floaded by via/devices.fth
\ This implements the HDD LED in the form expected by Linux.
\ See Documentation/devicetree/bindings/gpio/led.txt
0 0  " i44b"  " /isa"  begin-package
   " gpios" device-name
   " via,vx855-gpio" +compatible
   0 0 " gpio-controller" property
   2 " #gpio-cells" integer-property
   my-address my-space 8 reg
end-package

0 0  " "  " /" begin-package
   " gpio-leds" device-name
   " gpio-leds" +compatible

   new-device
      " hdd" device-name
      " mmc2" " linux,default-trigger" string-property
      \ gpios property will be added later to avoid relocation/byte-order issues
      \ with embedding phandles in property values
   finish-device
end-package

\ Create a "gpios" property in the child node.  The 
: make-gpios-property  ( flags gpio# child-node$ -- )
   find-device                                               ( n1 n0 )
      " /isa/gpios" locate-device abort" Can't find gpios"   ( n1 n0 phandle )
      encode-int  rot encode-int encode+   rot encode-int encode+  " gpios" property
   device-end
;

stand-init: gpios properties
   \ HDD LED is on GPIO38 as seen by Linux
   \ which is GPIO11 in VIA docs. It is active low.
   1  d# 38 " /gpio-leds/hdd" make-gpios-property
;


Thanks,
Daniel


diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index d6ee929..63f8903 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -291,6 +291,7 @@ static struct of_device_id __initdata of_ids[] = {
 	{ .compatible = "olpc,xo1-battery" },
 	{ .compatible = "olpc,xo1-dcon" },
 	{ .compatible = "olpc,xo1-rtc" },
+	{ .compatible = "gpio-leds" },
 	{},
 };
 
-- 
1.7.6
