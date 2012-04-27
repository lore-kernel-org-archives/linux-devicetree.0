From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v5 1/1] dt: add of_get_child_count helper function
Date: Fri, 27 Apr 2012 11:36:20 +0800
Message-ID: <1335497780-1164-1-git-send-email-b29396@freescale.com>
References: <20120427032831.GE26070@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120427032831.GE26070-Fb7DQEYuewWctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: b20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Currently most code to get child count in kernel are almost same,
add a helper to implement this function for dt to use.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
Rob missed this patch for 3.4 kernel.
Based on Rob's suggestion, we can get it go in with pinctrl driver.
Since Rob once had applied it, i added Rob's ack.
See:
https://lkml.org/lkml/2012/4/14/239

changes v4->v5:
 * do not initialize child node pointer based on Stephen's suggestion.

changes v3->v4:
 * addressed Grant's suggestion to use for_each_child_of_node.

changes v2->v3:
 Addressed some people's comments:
 * do not use assignment as expression
 * return 0 for non-dt case

Changes v1->v2:
 * change the name from of_get_child_number to of_get_child_count
---
 include/linux/of.h |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index e3f942d..2ec1083 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -193,6 +193,17 @@ extern struct device_node *of_get_next_child(const struct device_node *node,
 	for (child = of_get_next_child(parent, NULL); child != NULL; \
 	     child = of_get_next_child(parent, child))
 
+static inline int of_get_child_count(const struct device_node *np)
+{
+	struct device_node *child;
+	int num = 0;
+
+	for_each_child_of_node(np, child)
+		num++;
+
+	return num;
+}
+
 extern struct device_node *of_find_node_with_property(
 	struct device_node *from, const char *prop_name);
 #define for_each_node_with_property(dn, prop_name) \
@@ -300,6 +311,11 @@ static inline bool of_have_populated_dt(void)
 #define for_each_child_of_node(parent, child) \
 	while (0)
 
+static inline int of_get_child_count(const struct device_node *np)
+{
+	return 0;
+}
+
 static inline int of_device_is_compatible(const struct device_node *device,
 					  const char *name)
 {
-- 
1.7.0.4
