From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] of/clock: eliminate function __of_clk_get_from_provider
Date: Mon, 14 Mar 2011 21:18:42 +0800
Message-ID: <1300108722-3254-6-git-send-email-shawn.guo@linaro.org>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1300108722-3254-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

With the platform clock support, the 'struct clk' should have been
associated with device_node->data.  So the use of function
__of_clk_get_from_provider can be eliminated.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/clock.c |   23 ++---------------------
 1 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/of/clock.c b/drivers/of/clock.c
index 7b5ea67..f124d0a 100644
--- a/drivers/of/clock.c
+++ b/drivers/of/clock.c
@@ -71,24 +71,6 @@ void of_clk_del_provider(struct device_node *np,
 	mutex_unlock(&of_clk_lock);
 }
 
-static struct clk *__of_clk_get_from_provider(struct device_node *np, const char *clk_output)
-{
-	struct of_clk_provider *provider;
-	struct clk *clk = NULL;
-
-	/* Check if we have such a provider in our array */
-	mutex_lock(&of_clk_lock);
-	list_for_each_entry(provider, &of_clk_providers, link) {
-		if (provider->node == np)
-			clk = provider->get(np, clk_output, provider->data);
-		if (clk)
-			break;
-	}
-	mutex_unlock(&of_clk_lock);
-
-	return clk;
-}
-
 struct clk *of_clk_get(struct device *dev, const char *id)
 {
 	struct device_node *provnode;
@@ -123,9 +105,8 @@ struct clk *of_clk_get(struct device *dev, const char *id)
 			__func__, prop_name, dev->of_node->full_name);
 		return NULL;
 	}
-	clk = __of_clk_get_from_provider(provnode, prop);
-	if (clk)
-		dev_dbg(dev, "Using clock from %s\n", provnode->full_name);
+
+	clk = provnode->data;
 
 	of_node_put(provnode);
 
-- 
1.7.1
