From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 3/5] soc: ti: ti_sci_pm_domains: Add support for exclusive
 access
Date: Sat, 23 Feb 2019 15:02:30 +0530
Message-ID: <20190223093232.29003-4-lokeshvutla@ti.com>
References: <20190223093232.29003-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190223093232.29003-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

TISCI protocol supports for enabling the device with exclusive
permissions. Certain remoteproc devices or some shared devices
across VM doesn't wants to request devices with this flag set.
So add support for getting this information from DT. With this
power-domain-cells are increased to 2.

For keeping the DT backward compatibility intact, defaulting the
device permissions to set the exclusive flag set. In this case the
power-domain-cells is 1.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/soc/ti/ti_sci_pm_domains.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/ti_sci_pm_domains.c b/drivers/soc/ti/ti_sci_pm_domains.c
index de31b9389e2e..4dae42651212 100644
--- a/drivers/soc/ti/ti_sci_pm_domains.c
+++ b/drivers/soc/ti/ti_sci_pm_domains.c
@@ -24,6 +24,8 @@
 #include <linux/slab.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
+#define PD_REQUEST_EXCLUSIVE BIT(0)
+
 /**
  * struct ti_sci_genpd_dev_data: holds data needed for every device attached
  *				 to this genpd
@@ -32,6 +34,7 @@
  */
 struct ti_sci_genpd_dev_data {
 	int idx;
+	u8 exclusive;
 };
 
 /**
@@ -63,6 +66,14 @@ static int ti_sci_dev_id(struct device *dev)
 	return sci_dev_data->idx;
 }
 
+static u8 is_ti_sci_dev_exclusive(struct device *dev)
+{
+	struct generic_pm_domain_data *genpd_data = dev_gpd_data(dev);
+	struct ti_sci_genpd_dev_data *sci_dev_data = genpd_data->data;
+
+	return sci_dev_data->exclusive & PD_REQUEST_EXCLUSIVE;
+}
+
 /**
  * ti_sci_dev_to_sci_handle(): get pointer to ti_sci_handle
  * @dev: pointer to device associated with this genpd
@@ -87,7 +98,10 @@ static int ti_sci_dev_start(struct device *dev)
 	const struct ti_sci_handle *ti_sci = ti_sci_dev_to_sci_handle(dev);
 	int idx = ti_sci_dev_id(dev);
 
-	return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
+	if (is_ti_sci_dev_exclusive(dev))
+		return ti_sci->ops.dev_ops.get_device_exclusive(ti_sci, idx);
+	else
+		return ti_sci->ops.dev_ops.get_device(ti_sci, idx);
 }
 
 /**
@@ -118,7 +132,7 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
 	if (ret < 0)
 		return ret;
 
-	if (pd_args.args_count != 1)
+	if (pd_args.args_count != 1 && pd_args.args_count != 2)
 		return -EINVAL;
 
 	idx = pd_args.args[0];
@@ -136,6 +150,10 @@ static int ti_sci_pd_attach_dev(struct generic_pm_domain *domain,
 		return -ENOMEM;
 
 	sci_dev_data->idx = idx;
+	/* Enable the exclusive permissions by default */
+	sci_dev_data->exclusive = PD_REQUEST_EXCLUSIVE;
+	if (pd_args.args_count == 2)
+		sci_dev_data->exclusive = pd_args.args[1];
 
 	genpd_data = dev_gpd_data(dev);
 	genpd_data->data = sci_dev_data;
-- 
2.19.2
