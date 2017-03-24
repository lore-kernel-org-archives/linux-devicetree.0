From: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/9] bus: brcmstb_gisb: Use register offsets with writes too
Date: Fri, 24 Mar 2017 07:46:27 -0700
Message-ID: <20170324144632.5896-5-opendmb@gmail.com>
References: <20170324144632.5896-1-opendmb@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324144632.5896-1-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, vladimir.murzin-5wv7dgnIgG8@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, cmetcalf-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sandeepa.s.prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shijie.huang-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This commit corrects the bug introduced in commit f80835875d3d
("bus: brcmstb_gisb: Look up register offsets in a table") such
that gisb_write() translates the register enumeration into an
offset from the base address for writes as well as reads.

Fixes: f80835875d3d ("bus: brcmstb_gisb: Look up register offsets in a table")
Signed-off-by: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/bus/brcmstb_gisb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index 72fe0a5a8bf3..a94598d0945a 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2014 Broadcom Corporation
+ * Copyright (C) 2014-2017 Broadcom
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -127,9 +127,9 @@ static void gisb_write(struct brcmstb_gisb_arb_device *gdev, u32 val, int reg)
 		return;
 
 	if (gdev->big_endian)
-		iowrite32be(val, gdev->base + reg);
+		iowrite32be(val, gdev->base + offset);
 	else
-		iowrite32(val, gdev->base + reg);
+		iowrite32(val, gdev->base + offset);
 }
 
 static ssize_t gisb_arb_get_timeout(struct device *dev,
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
