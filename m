From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 0/2] of: irq: Ignore disabled interrupt controllers
Date: Wed, 27 Nov 2013 23:26:11 -0800
Message-ID: <cover.1385623064.git.peter.crosthwaite@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant-likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

These two patches support the case where an interrupt controller is
marked as disabled. Patch 1 fixed the dts interrupt-map search logic to
ignore disabled interrupt controllers. Patch 2 stops disabled interrupt
controllers getting probed.

Peter Crosthwaite (2):
  of: irq: Ignore disabled intc's when searching map
  of: irq: Ignore disabled interrupt controllers

 drivers/of/irq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
