From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of: Fix locking when calling of_get_next_available_child()
Date: Mon, 11 Feb 2013 22:19:17 +0000
Message-ID: <1360621157-23570-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_get_next_available_child() obtains the devtree_lock and then calls
of_device_is_available() which also attempts to claim the lock. This is
obviously incorrect and causes a deadlock on boot. Fix issue by adding
an variant of of_device_is_available() which doesn't obtain the lock.

Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/base.c |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e8d65af..4af74b7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -297,7 +297,7 @@ EXPORT_SYMBOL(of_machine_is_compatible);
  *  Returns 1 if the status property is absent or set to "okay" or "ok",
  *  0 otherwise
  */
-int of_device_is_available(const struct device_node *device)
+int __of_device_is_available(const struct device_node *device)
 {
 	const char *status;
 	int statlen;
@@ -313,6 +313,17 @@ int of_device_is_available(const struct device_node *device)
 
 	return 0;
 }
+
+int of_device_is_available(const struct device_node *device)
+{
+	unsigned long flags;
+	int rc;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	rc = __of_device_is_available(device);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return rc;
+}
 EXPORT_SYMBOL(of_device_is_available);
 
 /**
@@ -404,7 +415,7 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 	raw_spin_lock(&devtree_lock);
 	next = prev ? prev->sibling : node->child;
 	for (; next; next = next->sibling) {
-		if (!of_device_is_available(next))
+		if (!__of_device_is_available(next))
 			continue;
 		if (of_node_get(next))
 			break;
-- 
1.7.10.4
