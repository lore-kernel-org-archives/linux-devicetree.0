From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dt: add empty for_each_child_of_node, of_find_property
Date: Wed, 21 Sep 2011 13:23:10 -0600
Message-ID: <1316632990-12876-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch adds a couple empty functions for non-dt build, so that
drivers migrating to dt can save some '#ifdef CONFIG_OF'.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Unfortunately, I screwed up and my recent sdhci-tegra.c changes rely on this
change to compile without CONFIG_OF; I really need to stop doing my test-
builds in a single branch will all my outstanding changes present:-(

 include/linux/of.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 9180dc5..1fc5875 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -242,6 +242,16 @@ static inline bool of_have_populated_dt(void)
 	return false;
 }
 
+#define for_each_child_of_node(parent, child) \
+	while (0)
+
+static inline struct property *of_find_property(const struct device_node *np,
+						const char *name,
+						int *lenp)
+{
+	return NULL;
+}
+
 static inline int of_property_read_u32_array(const struct device_node *np,
 					     const char *propname,
 					     u32 *out_values, size_t sz)
-- 
1.7.0.4
