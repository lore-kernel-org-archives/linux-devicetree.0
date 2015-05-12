From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] of: base: upgrade initcall level of of_init from core to pure
Date: Tue, 12 May 2015 18:38:02 +0100
Message-ID: <1431452282-10207-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
devices with an OF node") adds the symlink `of_node` for each device
pointing to it's device tree node while creating/initialising it.

However the devicetree sysfs is created and setup in of_init which is
executed at core_initcall level. For all the devices created at the core
initcall before of_init, the following error is thrown:
	"Error -2(-ENOENT) creating of_node link"

Since the core_initcall is the earliest point where devices get
registered, push initcall level of of_init from core to pure so that
the devicetree sysfs is ready before any devices are registered.

Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 99764db0875a..8c3d6b04c585 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -210,7 +210,7 @@ static int __init of_init(void)

 	return 0;
 }
-core_initcall(of_init);
+pure_initcall(of_init);

 static struct property *__of_find_property(const struct device_node *np,
 					   const char *name, int *lenp)
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
