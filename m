From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v3] of: Add stubs for of_get_next_child and
 of_get_next_available_child for !OF
Date: Thu, 20 Jun 2013 19:58:40 +0400
Message-ID: <1371743920-15739-1-git-send-email-shc_work@mail.ru>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patch adds an empty versions of of_get_next_child and
of_get_next_available_child for non-OF builds.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 include/linux/of.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 1fd08ca..832b41a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -369,6 +369,18 @@ static inline bool of_have_populated_dt(void)
 #define for_each_child_of_node(parent, child) \
 	while (0)
 
+static inline struct device_node *of_get_next_child(
+	const struct device_node *node, struct device_node *prev)
+{
+	return NULL;
+}
+
+static inline struct device_node *of_get_next_available_child(
+	const struct device_node *node, struct device_node *prev)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_child_by_name(
 					const struct device_node *node,
 					const char *name)
-- 
1.8.1.5
