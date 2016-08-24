From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] phy: rcar-gen3-usb2: Add a compatible string for r8a7796
Date: Wed, 24 Aug 2016 15:49:22 +0900
Message-ID: <1472021362-8085-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472021362-8085-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver can support for r8a7796 SoC. So, this patch adds it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 drivers/phy/phy-rcar-gen3-usb2.c                             | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index b54fb36..ace9cce 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -6,6 +6,8 @@ This file provides information on what the device node for the R-Car generation
 Required properties:
 - compatible: "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
 	      SoC.
+	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
+	      SoC.
 	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 compatible device.
 
 	      When compatible with the generic version, nodes must list the
diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index 31156c9..3d97ead 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -280,6 +280,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 	{ .compatible = "renesas,usb2-phy-r8a7795" },
+	{ .compatible = "renesas,usb2-phy-r8a7796" },
 	{ .compatible = "renesas,rcar-gen3-usb2-phy" },
 	{ }
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
