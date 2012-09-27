From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 03/14] OF: make a function pointer argument const
Date: Thu, 27 Sep 2012 16:07:22 +0200
Message-ID: <1348754853-28619-4-git-send-email-g.liakhovetski@gmx.de>
References: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348754853-28619-1-git-send-email-g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
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
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "struct device_node *" argument of of_parse_phandle_*() can be const.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/of/base.c  |    4 ++--
 include/linux/of.h |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d4a1c9a..5d52ad8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -871,7 +871,7 @@ EXPORT_SYMBOL_GPL(of_property_count_strings);
  * of_node_put() on it when done.
  */
 struct device_node *
-of_parse_phandle(struct device_node *np, const char *phandle_name, int index)
+of_parse_phandle(const struct device_node *np, const char *phandle_name, int index)
 {
 	const __be32 *phandle;
 	int size;
@@ -916,7 +916,7 @@ EXPORT_SYMBOL(of_parse_phandle);
  * To get a device_node of the `node2' node you may call this:
  * of_parse_phandle_with_args(node3, "list", "#list-cells", 1, &args);
  */
-int of_parse_phandle_with_args(struct device_node *np, const char *list_name,
+int of_parse_phandle_with_args(const struct device_node *np, const char *list_name,
 				const char *cells_name, int index,
 				struct of_phandle_args *out_args)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 54866e6..3636fae 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -253,10 +253,10 @@ extern int of_n_size_cells(struct device_node *np);
 extern const struct of_device_id *of_match_node(
 	const struct of_device_id *matches, const struct device_node *node);
 extern int of_modalias_node(struct device_node *node, char *modalias, int len);
-extern struct device_node *of_parse_phandle(struct device_node *np,
+extern struct device_node *of_parse_phandle(const struct device_node *np,
 					    const char *phandle_name,
 					    int index);
-extern int of_parse_phandle_with_args(struct device_node *np,
+extern int of_parse_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name, int index,
 	struct of_phandle_args *out_args);
 
@@ -396,7 +396,7 @@ static inline int of_property_match_string(struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline struct device_node *of_parse_phandle(struct device_node *np,
+static inline struct device_node *of_parse_phandle(const struct device_node *np,
 						   const char *phandle_name,
 						   int index)
 {
-- 
1.7.2.5
