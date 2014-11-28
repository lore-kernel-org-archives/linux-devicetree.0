From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] usb: {ohci,ehci}-platform: Use new OF big-endian helper function
Date: Thu, 27 Nov 2014 20:43:43 -0800
Message-ID: <1417149823-4168-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This handles the existing "big-endian" case, and in addition, it also does
the right thing when "native-endian" is specified.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-ehci.txt | 2 ++
 Documentation/devicetree/bindings/usb/usb-ohci.txt | 2 ++
 drivers/usb/host/ehci-platform.c                   | 2 +-
 drivers/usb/host/ohci-platform.c                   | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)


V1->V2: Tweak documentation per feedback on the list

This depends on the new of_device_is_big_endian() function, which is being
handled through Grant's tree.


diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
index 43c1a4e06767..927757b13ff7 100644
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
@@ -12,6 +12,8 @@ Optional properties:
  - big-endian-regs : boolean, set this for hcds with big-endian registers
  - big-endian-desc : boolean, set this for hcds with big-endian descriptors
  - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
+ - native-endian : boolean, enables big-endian-regs + big-endian-desc
+   if the CPU is running in big-endian mode
  - clocks : a list of phandle + clock specifier pairs
  - phys : phandle + phy specifier pair
  - phy-names : "usb"
diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index 19233b7365e1..42f63b865b97 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -9,6 +9,8 @@ Optional properties:
 - big-endian-regs : boolean, set this for hcds with big-endian registers
 - big-endian-desc : boolean, set this for hcds with big-endian descriptors
 - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
+- native-endian : boolean, enables big-endian-regs + big-endian-desc
+  if the CPU is running in big-endian mode
 - no-big-frame-no : boolean, set if frame_no lives in bits [15:0] of HCCA
 - num-ports : u32, to override the detected port count
 - clocks : a list of phandle + clock specifier pairs
diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index 2f5b9ce3e042..0da9d7061108 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -187,7 +187,7 @@ static int ehci_platform_probe(struct platform_device *dev)
 		if (of_property_read_bool(dev->dev.of_node, "big-endian-desc"))
 			ehci->big_endian_desc = 1;
 
-		if (of_property_read_bool(dev->dev.of_node, "big-endian"))
+		if (of_device_is_big_endian(dev->dev.of_node))
 			ehci->big_endian_mmio = ehci->big_endian_desc = 1;
 
 		priv->phy = devm_phy_get(&dev->dev, "usb");
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 7793c3cfcf1f..029a606e4d4a 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -157,7 +157,7 @@ static int ohci_platform_probe(struct platform_device *dev)
 		if (of_property_read_bool(dev->dev.of_node, "big-endian-desc"))
 			ohci->flags |= OHCI_QUIRK_BE_DESC;
 
-		if (of_property_read_bool(dev->dev.of_node, "big-endian"))
+		if (of_device_is_big_endian(dev->dev.of_node))
 			ohci->flags |= OHCI_QUIRK_BE_MMIO | OHCI_QUIRK_BE_DESC;
 
 		if (of_property_read_bool(dev->dev.of_node, "no-big-frame-no"))
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
