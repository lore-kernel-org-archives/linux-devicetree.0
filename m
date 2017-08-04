From: <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 2/6] PCI: mediatek: Add a structure to abstract the
 controller generations
Date: Fri, 4 Aug 2017 20:06:38 +0800
Message-ID: <d8d42eae0a649b0c944dbc9b2ceebed432a04f32.1501846816.git.honghui.zhang@mediatek.com>
References: <cover.1501846816.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1501846816.git.honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh-+zGGX9k9yNkdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Introduce a structure "mtk_pcie_soc" to abstract the differences between
controller generations, and the .startup() hook is used to encapsulate
some SoC-dependent related setting. In doing so, the common code which
will be reused by future chips.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/pci/host/pcie-mediatek.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
index 0d46cda..5d7f62e 100644
--- a/drivers/pci/host/pcie-mediatek.c
+++ b/drivers/pci/host/pcie-mediatek.c
@@ -64,6 +64,18 @@
 #define PCIE_FC_CREDIT_MASK	(GENMASK(31, 31) | GENMASK(28, 16))
 #define PCIE_FC_CREDIT_VAL(x)	((x) << 16)
 
+struct mtk_pcie_port;
+
+/**
+ * struct mtk_pcie_soc - differentiate between host generations
+ * @ops: pointer to configuration access functions
+ * @startup: pointer to controller setting functions
+ */
+struct mtk_pcie_soc {
+	struct pci_ops *ops;
+	int (*startup)(struct mtk_pcie_port *port);
+};
+
 /**
  * struct mtk_pcie_port - PCIe port information
  * @base: IO mapped register base
@@ -97,6 +109,7 @@ struct mtk_pcie_port {
  * @busn: bus range
  * @offset: IO / Memory offset
  * @ports: pointer to PCIe port information
+ * @soc: pointer to SoC-dependent operations
  */
 struct mtk_pcie {
 	struct device *dev;
@@ -112,6 +125,7 @@ struct mtk_pcie {
 		resource_size_t io;
 	} offset;
 	struct list_head ports;
+	const struct mtk_pcie_soc *soc;
 };
 
 static void mtk_pcie_subsys_powerdown(struct mtk_pcie *pcie)
@@ -229,7 +243,8 @@ static int mtk_pcie_startup_ports(struct mtk_pcie_port *port)
 
 static void mtk_pcie_enable_ports(struct mtk_pcie_port *port)
 {
-	struct device *dev = port->pcie->dev;
+	struct mtk_pcie *pcie = port->pcie;
+	struct device *dev = pcie->dev;
 	int err;
 
 	err = clk_prepare_enable(port->sys_ck);
@@ -247,7 +262,7 @@ static void mtk_pcie_enable_ports(struct mtk_pcie_port *port)
 		goto err_phy_on;
 	}
 
-	if (!mtk_pcie_startup_ports(port))
+	if (!pcie->soc->startup(port))
 		return;
 
 	dev_info(dev, "Port%d link down\n", port->index);
@@ -472,7 +487,7 @@ static int mtk_pcie_register_host(struct pci_host_bridge *host)
 
 	host->busnr = pcie->busn.start;
 	host->dev.parent = pcie->dev;
-	host->ops = &mtk_pcie_ops;
+	host->ops = pcie->soc->ops;
 	host->map_irq = of_irq_parse_and_map_pci;
 	host->swizzle_irq = pci_common_swizzle;
 
@@ -505,6 +520,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie = pci_host_bridge_priv(host);
 
 	pcie->dev = dev;
+	pcie->soc = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 	INIT_LIST_HEAD(&pcie->ports);
 
@@ -529,9 +545,14 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	return err;
 }
 
+static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
+	.ops = &mtk_pcie_ops,
+	.startup = mtk_pcie_startup_ports,
+};
+
 static const struct of_device_id mtk_pcie_ids[] = {
-	{ .compatible = "mediatek,mt7623-pcie"},
-	{ .compatible = "mediatek,mt2701-pcie"},
+	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
+	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
 	{},
 };
 
-- 
2.6.4
