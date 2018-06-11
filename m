From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 6/8] drm/dsi: add helper function to find the second host in a
 dual-dsi setup
Date: Mon, 11 Jun 2018 15:35:00 +0200
Message-ID: <20180611133502.1292-7-heiko@sntech.de>
References: <20180611133502.1292-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180611133502.1292-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

>From a specified output port of one dsi controller this function allows to
iterate over the list of registered dsi controllers trying to find a second
instance connected to the same display, like it is used in dual-dsi setups.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 56 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index bc73b7f5b9fc..ac457d02389c 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -30,6 +30,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
@@ -282,6 +283,61 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node)
 }
 EXPORT_SYMBOL(of_find_mipi_dsi_host_by_node);
 
+struct device_node *of_mipi_dsi_find_second_host(struct device_node *first_np,
+						 int port, int endpoint)
+{
+	struct mipi_dsi_host *first, *host;
+	struct device_node *remote, *np, *second_np = NULL;
+	int num = 0;
+
+	first = of_find_mipi_dsi_host_by_node(first_np);
+	if (!first) {
+		pr_err("no dsi-host for node %s\n", first_np->full_name);
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* output-node of the known dsi-host */
+	remote = of_graph_get_remote_node(first_np, port, endpoint);
+	if (!remote) {
+		dev_err(first->dev, "no output node found\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	mutex_lock(&host_lock);
+
+	list_for_each_entry(host, &host_list, list) {
+		np = of_graph_get_remote_node(host->dev->of_node,
+					      port, endpoint);
+
+		/* found a host connected to this panel */
+		if (np == remote)
+			num++;
+
+		/* found one second host */
+		if (host->dev->of_node != first_np)
+			second_np = host->dev->of_node;
+
+		of_node_put(np);
+	}
+
+	/* of_node_get the node under host_lock */
+	if (num == 2)
+		of_node_get(second_np);
+
+	mutex_unlock(&host_lock);
+
+	of_node_put(remote);
+
+	if (num > 2) {
+		dev_err(first->dev,
+			      "too many DSI links for output: %d links\n", num);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return second_np;
+}
+EXPORT_SYMBOL(of_mipi_dsi_find_second_host);
+
 int mipi_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct device_node *node;
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 4fef19064b0f..89532ae69c91 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -107,6 +107,8 @@ struct mipi_dsi_host {
 int mipi_dsi_host_register(struct mipi_dsi_host *host);
 void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
+struct device_node *of_mipi_dsi_find_second_host(struct device_node *first_np,
+						 int port, int endpoint);
 
 /* DSI mode flags */
 
-- 
2.17.0
