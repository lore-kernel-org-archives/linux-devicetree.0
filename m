From: Alexander Holler <holler@ahsoftware.de>
Subject: [PATCH 15/16] mtd: mtdcore: fix initcall level
Date: Wed, 26 Aug 2015 14:28:27 +0200
Message-ID: <1440592108-3740-16-git-send-email-holler@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Russel King <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexander Holler <holler@ahsoftware.de>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The mtd-core has to be initialized before other dependent mtd-drivers,
otherwise a crash might occur.

Currently mtd_init() is called in the initcall-level device, which is the
same level where most mtd-drivers will end up. By luck this seemed to have
been called most of the time before other mtd-drivers without having been
explicitly enforced. But if mtd_init() is not called before a dependent
driver, a null-pointer exception might occur (e.g. because the mtd device
class isn't registered).

To fix this, mtd-init() is moved to the initcall-level fs (right before
the standard initcall level device).

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8bbbb75..fa8e6452 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1303,7 +1303,7 @@ static void __exit cleanup_mtd(void)
 	bdi_destroy(&mtd_bdi);
 }
 
-module_init(init_mtd);
+fs_initcall_sync(init_mtd);
 module_exit(cleanup_mtd);
 
 MODULE_LICENSE("GPL");
-- 
2.1.0
