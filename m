From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] uhci-platform: Change compatible string
 from platform-uhci to generic-uhci
Date: Tue, 11 Feb 2014 17:54:45 +0100
Message-ID: <1392137686-6562-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBYNL5GLQKGQELRESCQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This brings the uhci-platform bindings in sync with what we've done for
the ohci- and ehci-platform drivers. As discussed there using platform as a
prefix is a bit weird as the platform bus is a Linux specific thing and
the bindings are supposed to be OS agnostic.

Note that the old platform-uhci compatible string is kept around for, well,
compatibility reasons.

While at it rename the bindings txt file to match the name of all the
other ?hci-platform bindings docs.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/platform-uhci.txt | 15 ---------------
 Documentation/devicetree/bindings/usb/usb-uhci.txt      | 15 +++++++++++++++
 drivers/usb/host/uhci-platform.c                        |  1 +
 3 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/platform-uhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-uhci.txt

diff --git a/Documentation/devicetree/bindings/usb/platform-uhci.txt b/Documentation/devicetree/bindings/usb/platform-uhci.txt
deleted file mode 100644
index a4fb071..0000000
--- a/Documentation/devicetree/bindings/usb/platform-uhci.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Generic Platform UHCI Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "platform-uhci"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : UHCI controller interrupt
-
-Example:
-
-	uhci@d8007b00 {
-		compatible = "platform-uhci";
-		reg = <0xd8007b00 0x200>;
-		interrupts = <43>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb-uhci.txt b/Documentation/devicetree/bindings/usb/usb-uhci.txt
new file mode 100644
index 0000000..2981334
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-uhci.txt
@@ -0,0 +1,15 @@
+Generic Platform UHCI Controller
+-----------------------------------------------------
+
+Required properties:
+- compatible : "generic-uhci" (deprecated: "platform-uhci")
+- reg : Should contain 1 register ranges(address and length)
+- interrupts : UHCI controller interrupt
+
+Example:
+
+	uhci@d8007b00 {
+		compatible = "generic-uhci";
+		reg = <0xd8007b00 0x200>;
+		interrupts = <43>;
+	};
diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index 44e6c9d..01833ab 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -148,6 +148,7 @@ static void uhci_hcd_platform_shutdown(struct platform_device *op)
 }
 
 static const struct of_device_id platform_uhci_ids[] = {
+	{ .compatible = "generic-uhci", },
 	{ .compatible = "platform-uhci", },
 	{}
 };
-- 
1.8.5.3
