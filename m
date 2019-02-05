From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH v4 2/2] drivers: soc: fsl: add qixis driver
Date: Tue, 5 Feb 2019 10:14:42 +0000
Message-ID: <20190205153924.7204-3-pankaj.bansal@nxp.com>
References: <20190205153924.7204-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190205153924.7204-1-pankaj.bansal@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "open list : OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Wang Dongsheng <dongsheng.wang@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

FPGA on LX2160AQDS/LX2160ARDB connected on I2C bus, so add qixis
driver which is basically an i2c client driver to control FPGA.

Also added platform driver for MMIO based FPGA, like the one available
on LS2088ARDB/LS2088AQDS.

Signed-off-by: Wang Dongsheng <dongsheng.wang@freescale.com>
Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---

Notes:
    V4:
    - Fix compilation error when qixis_ctrl is built as standalone module.
    V3:
    - Add MMIO based FPGA driver
    V2:
    - Modify the driver to not create platform devices corresponding to subnodes.
      because the subnodes are not actual devices.
    - Use mdio_mux_regmap_init/mdio_mux_regmap_uninit
    - Remove header file from include folder, as no qixis api is called from outside
    - Add regmap_exit in driver's remove function
    Dendencies:
    - https://www.mail-archive.com/netdev@vger.kernel.org/msg281274.html

 drivers/soc/fsl/Kconfig      |  11 ++
 drivers/soc/fsl/Makefile     |   1 +
 drivers/soc/fsl/qixis_ctrl.c | 222 +++++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index 8f80e8bbf29e..75993be04e42 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -28,4 +28,15 @@ config FSL_MC_DPIO
 	  other DPAA2 objects. This driver does not expose the DPIO
 	  objects individually, but groups them under a service layer
 	  API.
+
+config FSL_QIXIS
+	tristate "QIXIS system controller driver"
+	depends on OF
+	select REGMAP_I2C
+	select REGMAP_MMIO
+	default n
+	help
+	  Say y here to enable QIXIS system controller api. The qixis driver
+	  provides FPGA functions to control system.
+
 endmenu
diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile
index 803ef1bfb5ff..47e0cfc66ca4 100644
--- a/drivers/soc/fsl/Makefile
+++ b/drivers/soc/fsl/Makefile
@@ -5,5 +5,6 @@
 obj-$(CONFIG_FSL_DPAA)                 += qbman/
 obj-$(CONFIG_QUICC_ENGINE)		+= qe/
 obj-$(CONFIG_CPM)			+= qe/
+obj-$(CONFIG_FSL_QIXIS) 		+= qixis_ctrl.o
 obj-$(CONFIG_FSL_GUTS)			+= guts.o
 obj-$(CONFIG_FSL_MC_DPIO) 		+= dpio/
diff --git a/drivers/soc/fsl/qixis_ctrl.c b/drivers/soc/fsl/qixis_ctrl.c
new file mode 100644
index 000000000000..a8108bfd5195
--- /dev/null
+++ b/drivers/soc/fsl/qixis_ctrl.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/* Freescale QIXIS system controller driver.
+ *
+ * Copyright 2015 Freescale Semiconductor, Inc.
+ * Copyright 2018-2019 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mdio-mux.h>
+
+/* QIXIS MAP */
+struct fsl_qixis_regs {
+	u8		id;		/* Identification Registers */
+	u8		version;	/* Version Register */
+	u8		qixis_ver;	/* QIXIS Version Register */
+	u8		reserved1[0x1f];
+};
+
+struct mdio_mux_data {
+	void			*data;
+	struct list_head	link;
+};
+
+struct qixis_priv {
+	struct regmap		*regmap;
+	struct list_head	mdio_mux_list;
+};
+
+static struct regmap_config qixis_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int fsl_qixis_mdio_mux_init(struct device *dev, struct qixis_priv *priv)
+{
+	struct device_node *child;
+	struct mdio_mux_data *mux_data;
+	int ret;
+
+	INIT_LIST_HEAD(&priv->mdio_mux_list);
+	for_each_child_of_node(dev->of_node, child) {
+		if (!of_node_name_prefix(child, "mdio-mux"))
+			continue;
+
+		mux_data = devm_kzalloc(dev, sizeof(struct mdio_mux_data),
+					GFP_KERNEL);
+		if (!mux_data)
+			return -ENOMEM;
+		ret = mdio_mux_regmap_init(dev, child, &mux_data->data);
+		if (ret)
+			return ret;
+		list_add(&mux_data->link, &priv->mdio_mux_list);
+	}
+
+	return 0;
+}
+
+static int fsl_qixis_mdio_mux_uninit(struct qixis_priv *priv)
+{
+	struct list_head *pos;
+	struct mdio_mux_data *mux_data;
+
+	list_for_each(pos, &priv->mdio_mux_list) {
+		mux_data = list_entry(pos, struct mdio_mux_data, link);
+		mdio_mux_regmap_uninit(mux_data->data);
+	}
+
+	return 0;
+}
+
+static int fsl_qixis_probe(struct platform_device *pdev)
+{
+	static struct fsl_qixis_regs __iomem *qixis;
+	struct qixis_priv *priv;
+	int ret;
+	u32 qver;
+
+	qixis = of_iomap(pdev->dev.of_node, 0);
+	if (IS_ERR_OR_NULL(qixis)) {
+		pr_err("%s: Could not map qixis registers\n", __func__);
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct qixis_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, qixis,
+					     &qixis_regmap_config);
+	regmap_read(priv->regmap, offsetof(struct fsl_qixis_regs, qixis_ver),
+		    &qver);
+	pr_info("Freescale QIXIS Version: 0x%08x\n", qver);
+
+	ret = fsl_qixis_mdio_mux_init(&pdev->dev, priv);
+	if (ret)
+		goto error;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+error:
+	regmap_exit(priv->regmap);
+
+	return ret;
+}
+
+static int fsl_qixis_remove(struct platform_device *pdev)
+{
+	struct qixis_priv *priv;
+
+	priv = platform_get_drvdata(pdev);
+	fsl_qixis_mdio_mux_uninit(priv);
+	regmap_exit(priv->regmap);
+
+	return 0;
+}
+
+static const struct of_device_id fsl_qixis_of_match[] = {
+	{ .compatible = "fsl,fpga-qixis", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, fsl_qixis_of_match);
+
+static struct platform_driver fsl_qixis_driver = {
+	.driver = {
+		.name = "qixis_ctrl",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(fsl_qixis_of_match),
+	},
+	.probe = fsl_qixis_probe,
+	.remove = fsl_qixis_remove,
+};
+
+static int fsl_qixis_i2c_probe(struct i2c_client *client)
+{
+	struct qixis_priv *priv;
+	int ret;
+	u32 qver;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EOPNOTSUPP;
+
+	priv = devm_kzalloc(&client->dev, sizeof(struct qixis_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = regmap_init_i2c(client, &qixis_regmap_config);
+	regmap_read(priv->regmap, offsetof(struct fsl_qixis_regs, qixis_ver),
+		    &qver);
+	pr_info("Freescale QIXIS Version: 0x%08x\n", qver);
+
+	ret = fsl_qixis_mdio_mux_init(&client->dev, priv);
+	if (ret)
+		goto error;
+
+	i2c_set_clientdata(client, priv);
+
+	return 0;
+error:
+	regmap_exit(priv->regmap);
+
+	return ret;
+}
+
+static int fsl_qixis_i2c_remove(struct i2c_client *client)
+{
+	struct qixis_priv *priv;
+
+	priv = i2c_get_clientdata(client);
+	fsl_qixis_mdio_mux_uninit(priv);
+	regmap_exit(priv->regmap);
+
+	return 0;
+}
+
+static const struct of_device_id fsl_qixis_i2c_of_match[] = {
+	{ .compatible = "fsl,fpga-qixis-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, fsl_qixis_i2c_of_match);
+
+static struct i2c_driver fsl_qixis_i2c_driver = {
+	.driver = {
+		.name	= "qixis_ctrl_i2c",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(fsl_qixis_i2c_of_match),
+	},
+	.probe_new	= fsl_qixis_i2c_probe,
+	.remove		= fsl_qixis_i2c_remove,
+};
+
+static int __init fsl_qixis_init(void)
+{
+	pr_info("FSL: Qixis Control driver\n");
+
+	if (platform_driver_register(&fsl_qixis_driver))
+		pr_warn("could not register Qixis Control platform driver\n");
+	return i2c_add_driver(&fsl_qixis_i2c_driver);
+}
+module_init(fsl_qixis_init);
+
+static void __exit fsl_qixis_exit(void)
+{
+	platform_driver_unregister(&fsl_qixis_driver);
+	i2c_del_driver(&fsl_qixis_i2c_driver);
+}
+module_exit(fsl_qixis_exit);
+
+MODULE_AUTHOR("Wang Dongsheng <dongsheng.wang@freescale.com>");
+MODULE_DESCRIPTION("Freescale QIXIS system controller driver");
+MODULE_LICENSE("GPL");
+
-- 
2.17.1
