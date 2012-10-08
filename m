From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] dtc: fix for_each_*() to skip first object if deleted
Date: Mon,  8 Oct 2012 16:15:26 -0600
Message-ID: <1349734526-29792-1-git-send-email-swarren@wwwdotorg.org>
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
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The previous definition of for_each_*() would always include the very
first object within the list, irrespective of whether it was marked
deleted, since the deleted flag was not checked on the first object,
but only on any "next" object.

Fix for_each_*() to check the deleted flag in the loop body every
iteration to correct this.

(upstream dtc commit 1762ab42ef77db7ab2776d0d6cba3515150f518a)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 scripts/dtc/dtc.h |   44 ++++++++++----------------------------------
 1 files changed, 10 insertions(+), 34 deletions(-)

diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h
index d501c86..3e42a07 100644
--- a/scripts/dtc/dtc.h
+++ b/scripts/dtc/dtc.h
@@ -161,51 +161,27 @@ struct node {
 	struct label *labels;
 };
 
-static inline struct label *for_each_label_next(struct label *l)
-{
-	do {
-		l = l->next;
-	} while (l && l->deleted);
-
-	return l;
-}
-
-#define for_each_label(l0, l) \
-	for ((l) = (l0); (l); (l) = for_each_label_next(l))
-
 #define for_each_label_withdel(l0, l) \
 	for ((l) = (l0); (l); (l) = (l)->next)
 
-static inline struct property *for_each_property_next(struct property *p)
-{
-	do {
-		p = p->next;
-	} while (p && p->deleted);
-
-	return p;
-}
-
-#define for_each_property(n, p) \
-	for ((p) = (n)->proplist; (p); (p) = for_each_property_next(p))
+#define for_each_label(l0, l) \
+	for_each_label_withdel(l0, l) \
+		if (!(l)->deleted)
 
 #define for_each_property_withdel(n, p) \
 	for ((p) = (n)->proplist; (p); (p) = (p)->next)
 
-static inline struct node *for_each_child_next(struct node *c)
-{
-	do {
-		c = c->next_sibling;
-	} while (c && c->deleted);
-
-	return c;
-}
-
-#define for_each_child(n, c) \
-	for ((c) = (n)->children; (c); (c) = for_each_child_next(c))
+#define for_each_property(n, p) \
+	for_each_property_withdel(n, p) \
+		if (!(p)->deleted)
 
 #define for_each_child_withdel(n, c) \
 	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
 
+#define for_each_child(n, c) \
+	for_each_child_withdel(n, c) \
+		if (!(c)->deleted)
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
-- 
1.7.0.4
