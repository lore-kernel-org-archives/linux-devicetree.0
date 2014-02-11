From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] xhci-platform: Change compatible string
 from xhci-platform to generic-xhci
Date: Tue, 11 Feb 2014 17:54:46 +0100
Message-ID: <1392137686-6562-2-git-send-email-hdegoede@redhat.com>
References: <1392137686-6562-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBZNL5GLQKGQER3CNDOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1392137686-6562-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This brings the xhci-platform bindings in sync with what we've done for
the ohci- and ehci-platform drivers. As discussed there using platform as a
postfix is a bit weird as the platform bus is a Linux specific thing and
the bindings are supposed to be OS agnostic.

Note that the old xhci-platform compatible string is kept around for, well,
compatibility reasons.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 4 ++--
 drivers/usb/host/xhci-plat.c                       | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 5752df0..90f8f60 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -1,14 +1,14 @@
 USB xHCI controllers
 
 Required properties:
-  - compatible: should be "xhci-platform".
+  - compatible: should be "generic-xhci" (deprecated: "xhci-platform").
   - reg: should contain address and length of the standard XHCI
     register set for the device.
   - interrupts: one XHCI interrupt should be described here.
 
 Example:
 	usb@f0931000 {
-		compatible = "xhci-platform";
+		compatible = "generic-xhci";
 		reg = <0xf0931000 0x8c8>;
 		interrupts = <0x0 0x4e 0x0>;
 	};
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 8abda5c..8affef9 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -226,6 +226,7 @@ static const struct dev_pm_ops xhci_plat_pm_ops = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id usb_xhci_of_match[] = {
+	{ .compatible = "generic-xhci" },
 	{ .compatible = "xhci-platform" },
 	{ },
 };
-- 
1.8.5.3
