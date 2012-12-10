From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 02/13] of: add a dummy inline function for when CONFIG_OF
 is not defined
Date: Mon, 10 Dec 2012 20:41:28 +0100
Message-ID: <1355168499-5847-3-git-send-email-s.nawrocki@samsung.com>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1355168499-5847-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>

If CONFIG_OF isn't defined, no declaration of of_get_parent will be found
and compilation can fail. This patch adds a dummy inline function
definition to fix the problem.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 include/linux/of.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index b4e50d5..9ba8cf1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -427,6 +427,11 @@ static inline int of_parse_phandle_with_args(struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline struct device_node *of_get_parent(const struct device_node *np)
+{
+	return NULL;
+}
+
 static inline int of_alias_get_id(struct device_node *np, const char *stem)
 {
 	return -ENOSYS;
-- 
1.7.9.5
