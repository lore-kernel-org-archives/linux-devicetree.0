From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/21] of: remove unnecessary prom.h includes
Date: Thu, 26 Sep 2013 13:50:37 -0500
Message-ID: <1380221456-11192-3-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Remove unnecessary prom.h includes in preparation to make prom.h optional.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/of_pci_irq.c | 1 -
 drivers/of/pdt.c        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
index 6770538..d860764 100644
--- a/drivers/of/of_pci_irq.c
+++ b/drivers/of/of_pci_irq.c
@@ -2,7 +2,6 @@
 #include <linux/of_pci.h>
 #include <linux/of_irq.h>
 #include <linux/export.h>
-#include <asm/prom.h>
 
 /**
  * of_irq_map_pci - Resolve the interrupt for a PCI device
diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index 4ec19cb..7b66673 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_pdt.h>
-#include <asm/prom.h>
 
 static struct of_pdt_ops *of_pdt_prom_ops __initdata;
 
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
