From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 5/7] dt/clock: add a simple provider get function
Date: Tue, 13 Mar 2012 18:22:25 -0500
Message-ID: <1331680947-29861-6-git-send-email-robherring2@gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

For simple cases, the clock provider data can simply be the struct clk ptr.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 drivers/of/clock.c |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/of/clock.c b/drivers/of/clock.c
index 06fd5ad..f4a0965 100644
--- a/drivers/of/clock.c
+++ b/drivers/of/clock.c
@@ -33,6 +33,12 @@ struct of_clk_provider {
 static LIST_HEAD(of_clk_providers);
 static DEFINE_MUTEX(of_clk_lock);
 
+static struct clk *of_clk_simple_get(struct of_phandle_args *clkspec,
+				     void *data)
+{
+	return data;
+}
+
 /**
  * of_clk_add_provider() - Register a clock provider for a node
  * @np: Device node pointer associated with clock provider
@@ -52,7 +58,10 @@ int of_clk_add_provider(struct device_node *np,
 
 	cp->node = of_node_get(np);
 	cp->data = data;
-	cp->get = clk_src_get;
+	if (clk_src_get)
+		cp->get = clk_src_get;
+	else
+		cp->get = of_clk_simple_get;
 
 	mutex_lock(&of_clk_lock);
 	list_add(&cp->link, &of_clk_providers);
@@ -183,11 +192,6 @@ void __init of_clk_init(const struct of_device_id *matches)
 	}
 }
 
-static struct clk *of_fixed_clk_get(struct of_phandle_args *a, void *data)
-{
-	return data;
-}
-
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
  */
@@ -204,5 +208,5 @@ void __init of_fixed_clk_setup(struct device_node *node)
 
 	clk = clk_register_fixed_rate(NULL, clk_name, NULL, CLK_IS_ROOT, rate);
 	if (clk)
-		of_clk_add_provider(node, of_fixed_clk_get, clk);
+		of_clk_add_provider(node, NULL, clk);
 }
-- 
1.7.5.4
