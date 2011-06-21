From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH 1/5] dt: Add default match table for bus ids
Date: Tue, 21 Jun 2011 12:44:53 -0600
Message-ID: <20110621184453.18176.95533.stgit@ponder>
References: <20110621181127.18176.1384.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110621181127.18176.1384.stgit@ponder>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

No need for most platforms to define their own bus table when calling
of_platform_populate().  Supply a stock one.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/of/platform.c       |    8 ++++++++
 include/linux/of_platform.h |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 63d3cb7..bb483ef 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -22,6 +22,14 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
+const struct of_device_id of_default_bus_match_table[] = {
+	{ .compatible = "simple-bus", },
+#ifdef CONFIG_ARM_AMBA
+	{ .compatible = "arm,amba-bus", },
+#endif /* CONFIG_ARM_AMBA */
+	{} /* Empty terminated list */
+};
+
 static int of_dev_node_match(struct device *dev, void *data)
 {
 	return dev->of_node == data;
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index fb51ae3..8f023f8 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -40,6 +40,8 @@ struct of_platform_driver
 #define	to_of_platform_driver(drv) \
 	container_of(drv,struct of_platform_driver, driver)
 
+extern const struct of_device_id of_default_bus_match_table[];
+
 /* Platform drivers register/unregister */
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
