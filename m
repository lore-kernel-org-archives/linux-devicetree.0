From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFCv4 1/7] PM / devfreq: Add devfreq_get_devfreq_by_node
Date: Fri, 23 Aug 2019 17:36:54 +0300
Message-ID: <71a13730eee8744d8468aee8fa355958706035dd.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Split off part of devfreq_get_devfreq_by_phandle into a separate
function. This allows callers to fetch devfreq instances by enumerating
devicetree instead of explicit phandles.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/devfreq/devfreq.c | 42 +++++++++++++++++++++++++++++----------
 include/linux/devfreq.h   |  1 +
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 687deadd08ed..57352a757d79 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -907,10 +907,33 @@ struct devfreq *devm_devfreq_add_device(struct device *dev,
 	return devfreq;
 }
 EXPORT_SYMBOL(devm_devfreq_add_device);
 
 #ifdef CONFIG_OF
+/*
+ * devfreq_get_devfreq_by_node - Get the devfreq device from devicetree
+ * @np - pointer to device_node
+ *
+ * return the instance of devfreq device
+ */
+struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node)
+{
+	struct devfreq *devfreq;
+
+	mutex_lock(&devfreq_list_lock);
+	list_for_each_entry(devfreq, &devfreq_list, node) {
+		if (devfreq->dev.parent
+			&& devfreq->dev.parent->of_node == node) {
+			mutex_unlock(&devfreq_list_lock);
+			return devfreq;
+		}
+	}
+	mutex_unlock(&devfreq_list_lock);
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
 /*
  * devfreq_get_devfreq_by_phandle - Get the devfreq device from devicetree
  * @dev - instance to the given device
  * @index - index into list of devfreq
  *
@@ -929,25 +952,22 @@ struct devfreq *devfreq_get_devfreq_by_phandle(struct device *dev, int index)
 
 	node = of_parse_phandle(dev->of_node, "devfreq", index);
 	if (!node)
 		return ERR_PTR(-ENODEV);
 
-	mutex_lock(&devfreq_list_lock);
-	list_for_each_entry(devfreq, &devfreq_list, node) {
-		if (devfreq->dev.parent
-			&& devfreq->dev.parent->of_node == node) {
-			mutex_unlock(&devfreq_list_lock);
-			of_node_put(node);
-			return devfreq;
-		}
-	}
-	mutex_unlock(&devfreq_list_lock);
+	devfreq = devfreq_get_devfreq_by_node(node);
 	of_node_put(node);
 
-	return ERR_PTR(-EPROBE_DEFER);
+	return devfreq;
 }
+
 #else
+struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 struct devfreq *devfreq_get_devfreq_by_phandle(struct device *dev, int index)
 {
 	return ERR_PTR(-ENODEV);
 }
 #endif /* CONFIG_OF */
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index d2c5bb7add0a..4b5cc80abbe3 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -242,10 +242,11 @@ extern int devm_devfreq_register_notifier(struct device *dev,
 				unsigned int list);
 extern void devm_devfreq_unregister_notifier(struct device *dev,
 				struct devfreq *devfreq,
 				struct notifier_block *nb,
 				unsigned int list);
+extern struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node);
 extern struct devfreq *devfreq_get_devfreq_by_phandle(struct device *dev,
 						int index);
 
 #if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
 /**
-- 
2.17.1
