From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] ehci-platform: Change compatible string
 from usb-ehci to generic-ehci
Date: Tue, 11 Feb 2014 17:35:29 +0100
Message-ID: <1392136529-5060-3-git-send-email-hdegoede@redhat.com>
References: <1392136529-5060-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB3NC5GLQKGQEYA5QXTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1392136529-5060-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The initial versions of the devicetree enablement patches for ehci-platform
used "ehci-platform" as compatible string. However this was disliked by various
reviewers because the platform bus is a Linux invention and devicetree is
supposed to be OS agnostic. After much discussion I gave up, added a:
"depends on !PPC_OF" to Kconfig to avoid a known conflict with PPC-OF platforms
and went with the generic usb-ehci as requested.

In retro-spect I should have chosen something different, the dts files for many
existing boards already claim to be compatible with "usb-ehci", ie they have:

	compatible = "ti,ehci-omap", "usb-ehci";

In theory this should not be a problem since the "ti,ehci-omap" entry takes
presedence, but in practice using a conflicting compatible string is an issue,
because it makes which driver gets used depend on driver registration order.

This patch changes the compatible string claimed by ehci-platform to
"generic-ehci", avoiding the driver registration / module loading ordering
problems, and removes the "depends on !PPC_OF" workaround.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-ehci.txt | 4 ++--
 drivers/usb/host/Kconfig                           | 1 -
 drivers/usb/host/ehci-platform.c                   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
index 2c1aeeb..ff151ec 100644
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
@@ -1,7 +1,7 @@
 USB EHCI controllers
 
 Required properties:
-  - compatible : should be "usb-ehci".
+  - compatible : should be "generic-ehci".
   - reg : should contain at least address and length of the standard EHCI
     register set for the device. Optional platform-dependent registers
     (debug-port or other) can be also specified here, but only after
@@ -27,7 +27,7 @@ Example (Sequoia 440EPx):
 
 Example (Allwinner sun4i A10 SoC):
    ehci0: usb@01c14000 {
-	   compatible = "allwinner,sun4i-a10-ehci", "usb-ehci";
+	   compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
 	   reg = <0x01c14000 0x100>;
 	   interrupts = <39>;
 	   clocks = <&ahb_gates 1>;
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index e28cbe0..a9707da 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -255,7 +255,6 @@ config USB_EHCI_ATH79
 
 config USB_EHCI_HCD_PLATFORM
 	tristate "Generic EHCI driver for a platform device"
-	depends on !PPC_OF
 	default n
 	---help---
 	  Adds an EHCI host driver for a generic platform device, which
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 8fde649..1178730 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -333,7 +333,7 @@ static int ehci_platform_resume(struct device *dev)
 static const struct of_device_id vt8500_ehci_ids[] = {
 	{ .compatible = "via,vt8500-ehci", },
 	{ .compatible = "wm,prizm-ehci", },
-	{ .compatible = "usb-ehci", },
+	{ .compatible = "generic-ehci", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, vt8500_ehci_ids);
-- 
1.8.5.3
