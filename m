From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mtd: brcmnand: Add support for v6.2 controllers
Date: Thu, 10 Mar 2016 15:34:16 -0800
Message-ID: <1457652859-767-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BROADCOM STB NAND
	FLASH DRIVER" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document and match the brcm,brcmnand-v6.2 compatible string, the controller has
a register layout identical to the v6.0 version and supports prefetch. Update the
command shift logic to account for v6.2 controller which are the first ones to
use a shift of 0 (6.1 used a shift of 24).

Signed-off-by: Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 1 +
 drivers/mtd/nand/brcmnand/brcmnand.c                    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index c2546ced9c02..deb24cbdda82 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -24,6 +24,7 @@ Required properties:
                          brcm,brcmnand-v5.0
                          brcm,brcmnand-v6.0
                          brcm,brcmnand-v6.1
+                         brcm,brcmnand-v6.2
                          brcm,brcmnand-v7.0
                          brcm,brcmnand-v7.1
                          brcm,brcmnand
diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index e0528397306a..0b7a698cc233 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -601,7 +601,7 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 
 static inline int brcmnand_cmd_shift(struct brcmnand_controller *ctrl)
 {
-	if (ctrl->nand_version < 0x0700)
+	if (ctrl->nand_version < 0x0602)
 		return 24;
 	return 0;
 }
@@ -2115,6 +2115,7 @@ static const struct of_device_id brcmnand_of_match[] = {
 	{ .compatible = "brcm,brcmnand-v5.0" },
 	{ .compatible = "brcm,brcmnand-v6.0" },
 	{ .compatible = "brcm,brcmnand-v6.1" },
+	{ .compatible = "brcm,brcmnand-v6.2" },
 	{ .compatible = "brcm,brcmnand-v7.0" },
 	{ .compatible = "brcm,brcmnand-v7.1" },
 	{},
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
