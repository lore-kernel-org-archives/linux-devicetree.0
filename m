From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 3/3] soc: ti: ti_sci_pm_domains: Add support for exclusive
 and shared access
Date: Mon, 29 Jul 2019 17:54:53 +0530
Message-ID: <20190729122453.32252-4-lokeshvutla@ti.com>
References: <20190729122453.32252-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190729122453.32252-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

TISCI protocol supports for enabling the device either with exclusive
permissions for the requesting host or with sharing across the hosts.
There are certain devices which are exclusive to Linux context and
there are certain devices that are shared across different host contexts.
So add support for getting this information from DT by increasing
the power-domain cells to 2.

For keeping the DT backward compatibility intact, defaulting the
device permissions to set the exclusive flag set. In this case the
power-domain-cells is 1.

Reviewed-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/soc/ti/ti_sci_pm_domains.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/ti_sci_pm_domains.c b/drivers/soc/ti/ti_sci_pm_domains.c
index 97817dd7ba24..8c2a2f23982c 100644
--- a/drivers/soc/ti/ti_sci_pm_domains.c
+++ b/drivers/soc/ti/ti_sci_pm_domains.c
@@ -15,15 +15,19 @@
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
 
 /**
  * struct ti_sci_genpd_dev_data: holds data needed for every device attached
  *				 to this genpd
  * @idx: index of the device that identifies it with the system
  *	 control processor.
+ * @exclusive: Permissions for exclusive request or shared request of the
+ *	       device.
  */
 struct ti_sci_genpd_dev_data {
 	int idx;
+	u8 exclusive;
 };
 
 /**
@@ -55,6 +59,14 @@ static int ti_sci_dev_id(struct device *dev)
 	return sci_dev_data->idx;
 }
 
+static u8 is_ti_sci_dev_exclusive(struct device *dev)
+{
+	struct generic_pm_domain_data *genpd_data = dev_gpd_data(dev);
+	struct ti_sci_genpd_dev_data *sci_dev_data = genpd_data->data;
+
+	return sci_dev_data->exclusive;
+}
+
 /**
  * ti_sci_dev_to_sci_handle(): get pointer to ti_sci_handle
  * @dev: pointer to device associated with this genpd
@@ -79,7 +91,10 @@ static int ti_sci_dev_start(struct device *dev)
 	const struct ti_sci_handle *ti_sci = ti_sci_dev_to_sci_handle(dev);
 	int idx = ti_sci_dev_id(dev);
 
-	return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
+	if (is_ti_sci_dev_exclusive(dev))
+		return ti_sci->ops.dev_ops.get_device_exclusive(ti_sci, idx);
+	else
+		return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
 }
 
 /**
@@ -110,7 +125,7 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
 	if (ret < 0)
 		return ret;
 
-	if (pd_args.args_count != 1)
+	if (pd_args.args_count != 1 && pd_args.args_count != 2)
 		return -EINVAL;
 
 	idx = pd_args.args[0];
@@ -128,6 +143,10 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
 		return -ENOMEM;
 
 	sci_dev_data->idx = idx;
+	/* Enable the exclusive permissions by default */
+	sci_dev_data->exclusive = TI_SCI_PD_EXCLUSIVE;
+	if (pd_args.args_count == 2)
+		sci_dev_data->exclusive = pd_args.args[1] & 0x1;
 
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = sci_dev_data;
-- 
2.21.0
