From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH net-next] net: dsa: bcm_sf2: Update compatible string for 7278B0
Date: Thu, 14 Dec 2017 17:59:40 -0800
Message-ID: <20171215015941.32443-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the compatible string and Device Tree binding document for
7278B0.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt | 5 ++++-
 drivers/net/dsa/bcm_sf2.c                                          | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt b/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
index 9a734d808aa7..b7336b9d6a3c 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
@@ -2,7 +2,10 @@
 
 Required properties:
 
-- compatible: should be "brcm,bcm7445-switch-v4.0" or "brcm,bcm7278-switch-v4.0"
+- compatible: should be one of
+	"brcm,bcm7445-switch-v4.0"
+	"brcm,bcm7278-switch-v4.0"
+	"brcm,bcm7278-switch-v4.8"
 - reg: addresses and length of the register sets for the device, must be 6
   pairs of register addresses and lengths
 - interrupts: interrupts for the devices, must be two interrupts
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 8ea0cd494ea0..0378eded31f2 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -948,6 +948,9 @@ static const struct of_device_id bcm_sf2_of_match[] = {
 	{ .compatible = "brcm,bcm7278-switch-v4.0",
 	  .data = &bcm_sf2_7278_data
 	},
+	{ .compatible = "brcm,bcm7278-switch-v4.8",
+	  .data = &bcm_sf2_7278_data
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, bcm_sf2_of_match);
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
