From: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drivers/of: Add check for null property in of_remove_property()
Date: Thu, 28 Apr 2016 15:34:54 +1000
Message-ID: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The validity of the property input argument to of_remove_property() is
never checked within the function and thus it is possible to pass a null
value. It happens that this will be picked up in __of_remove_property()
as no matching property of the device node will be found and thus an
error will be returned, however once again there is no explicit check
for a null value. By the time this is detected 2 locks have already been
acquired which is completely unnecessary if the property to remove is
null.

Add an explicit check in the function of_remove_property() for a null
property value and return -ENODEV in this case, this is consistent with
what the previous return value would have been when the null value was
not detected and passed to __of_remove_property().

By moving an explicit check for the property paramenter into the
of_remove_property() function, this will remove the need to perform this
check in calling code before invocation of the of_remove_property()
function.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b299de2..64018eb 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1777,6 +1777,9 @@ int of_remove_property(struct device_node *np, struct property *prop)
 	unsigned long flags;
 	int rc;
 
+	if (!prop)
+		return -ENODEV;
+
 	mutex_lock(&of_mutex);
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
