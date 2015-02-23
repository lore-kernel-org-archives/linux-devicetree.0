From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2] drivers/base: cacheinfo: validate device node for all the caches
Date: Mon, 23 Feb 2015 16:32:39 +0000
Message-ID: <1424709159-13152-1-git-send-email-sudeep.holla@arm.com>
References: <1424095816-4414-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424095816-4414-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On architectures that depend on DT for obtaining cache hierarcy, we need
to validate the device node for all the cache indices, failing to do so
might result in wrong information being exposed to the userspace.

This is quite possible on initial/incomplete versions of the device
trees. In such cases, it's better to bail out if all the required device
nodes are not present.

This patch adds checks for the validation of device node for all the
caches and doesn't initialise the cacheinfo if there's any error.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Reported-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/base/cacheinfo.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

v1->v2:
 - Updated log information as suggested by Mark
 - Added Mark's ACK

Hi Greg,

Can you please pick this fix for the next rc ?

Without this there's possibility that erroneous information is exposed
to userspace on architecture depending on DT especially if DT lacks
cache hierarcy information.

Regards,
Sudeep

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 6e64563361f0..9c2ba1c97c42 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -62,15 +62,21 @@ static int cache_setup_of_node(unsigned int cpu)
 		return -ENOENT;
 	}
 
-	while (np && index < cache_leaves(cpu)) {
+	while (index < cache_leaves(cpu)) {
 		this_leaf = this_cpu_ci->info_list + index;
 		if (this_leaf->level != 1)
 			np = of_find_next_cache_node(np);
 		else
 			np = of_node_get(np);/* cpu node itself */
+		if (!np)
+			break;
 		this_leaf->of_node = np;
 		index++;
 	}
+
+	if (index != cache_leaves(cpu)) /* not all OF nodes populated */
+		return -ENOENT;
+
 	return 0;
 }
 
@@ -189,8 +195,11 @@ static int detect_cache_attributes(unsigned int cpu)
 	 * will be set up here only if they are not populated already
 	 */
 	ret = cache_shared_cpu_map_setup(cpu);
-	if (ret)
+	if (ret) {
+		pr_warn("Unable to detect cache hierarcy from DT for CPU %d\n",
+			cpu);
 		goto free_ci;
+	}
 	return 0;
 
 free_ci:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
