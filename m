From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] ohci-platform: Change compatible string
 from usb-ohci to ohci-platform
Date: Tue, 11 Feb 2014 15:10:25 +0100
Message-ID: <1392127826-31290-2-git-send-email-hdegoede@redhat.com>
References: <1392127826-31290-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB6G65CLQKGQELANMQFQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1392127826-31290-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The initial versions of the devicetree enablement patches for ohci-platform
used "ohci-platform" as compatible string. However this was disliked by various
reviewers because the platform bus is a Linux invention and devicetree is
supposed to be OS agnostic. After much discussion I gave up and went with
the generic usb-ohci as requested.

In retro-spect I should have stuck to my guns, because the dts files for many
existing boards already claim to be compatible with "usb-ohci", ie they have:

	compatible = "ti,ohci-omap3", "usb-ohci";

In theory this should not be a problem since the "ti,ohci-omap3" entry takes
presedence, but in practice using a conflicting compatible string is an issue,
because it makes which driver gets used depent on driver registration order.

This patch changes the compatible string claimed by ohci-platform (back) to
"ohci-platform", avoiding the driver registration / module loading ordering
problems. Note that there already is a precedent for using ?hci-platform, in
the form of xhci-platform.c using "xhci-platfrom" as compatible string.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-ohci.txt | 4 ++--
 drivers/usb/host/ohci-platform.c                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index 6933b0c..a8e576a 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -1,7 +1,7 @@
 USB OHCI controllers
 
 Required properties:
-- compatible : "usb-ohci"
+- compatible : "ohci-platform"
 - reg : ohci controller register range (address and length)
 - interrupts : ohci controller interrupt
 
@@ -16,7 +16,7 @@ Optional properties:
 Example:
 
 	ohci0: usb@01c14400 {
-		compatible = "allwinner,sun4i-a10-ohci", "usb-ohci";
+		compatible = "allwinner,sun4i-a10-ohci", "ohci-platform";
 		reg = <0x01c14400 0x100>;
 		interrupts = <64>;
 		clocks = <&usb_clk 6>, <&ahb_gates 2>;
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index e2c28fd..59f3551 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -319,7 +319,7 @@ static int ohci_platform_resume(struct device *dev)
 #endif /* CONFIG_PM */
 
 static const struct of_device_id ohci_platform_ids[] = {
-	{ .compatible = "usb-ohci", },
+	{ .compatible = "ohci-platform", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ohci_platform_ids);
-- 
1.8.5.3
