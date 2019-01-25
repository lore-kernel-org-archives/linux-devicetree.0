From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/7] PCI: qcom: Use clk_bulk API for 2.4.0 controllers
Date: Fri, 25 Jan 2019 15:45:06 -0800
Message-ID: <20190125234509.26419-5-bjorn.andersson@linaro.org>
References: <20190125234509.26419-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125234509.26419-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Before introducing the QCS404 platform, which uses the same PCIe
controller as IPQ4019, migrate this to use the bulk clock API, in order
to make the error paths slighly cleaner.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 48 +++++++-------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a7f703556790..9d366fad2b7f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -113,9 +113,8 @@ struct qcom_pcie_resources_2_3_2 {
 };
 
 struct qcom_pcie_resources_2_4_0 {
-	struct clk *aux_clk;
-	struct clk *master_clk;
-	struct clk *slave_clk;
+	struct clk_bulk_data clks[3];
+	int num_clks;
 	struct reset_control *axi_m_reset;
 	struct reset_control *axi_s_reset;
 	struct reset_control *pipe_reset;
@@ -638,18 +637,17 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	int ret;
 
-	res->aux_clk = devm_clk_get(dev, "aux");
-	if (IS_ERR(res->aux_clk))
-		return PTR_ERR(res->aux_clk);
+	res->clks[0].id = "aux";
+	res->clks[1].id = "master_bus";
+	res->clks[2].id = "slave_bus";
 
-	res->master_clk = devm_clk_get(dev, "master_bus");
-	if (IS_ERR(res->master_clk))
-		return PTR_ERR(res->master_clk);
+	res->num_clks = 3;
 
-	res->slave_clk = devm_clk_get(dev, "slave_bus");
-	if (IS_ERR(res->slave_clk))
-		return PTR_ERR(res->slave_clk);
+	ret = devm_clk_bulk_get(dev, res->num_clks, res->clks);
+	if (ret < 0)
+		return ret;
 
 	res->axi_m_reset = devm_reset_control_get_exclusive(dev, "axi_m");
 	if (IS_ERR(res->axi_m_reset))
@@ -719,9 +717,7 @@ static void qcom_pcie_deinit_2_4_0(struct qcom_pcie *pcie)
 	reset_control_assert(res->axi_m_sticky_reset);
 	reset_control_assert(res->pwr_reset);
 	reset_control_assert(res->ahb_reset);
-	clk_disable_unprepare(res->aux_clk);
-	clk_disable_unprepare(res->master_clk);
-	clk_disable_unprepare(res->slave_clk);
+	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
 
 static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
@@ -850,23 +846,9 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 
 	usleep_range(10000, 12000);
 
-	ret = clk_prepare_enable(res->aux_clk);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable iface clock\n");
+	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
+	if (ret)
 		goto err_clk_aux;
-	}
-
-	ret = clk_prepare_enable(res->master_clk);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable core clock\n");
-		goto err_clk_axi_m;
-	}
-
-	ret = clk_prepare_enable(res->slave_clk);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable phy clock\n");
-		goto err_clk_axi_s;
-	}
 
 	/* enable PCIe clocks and resets */
 	val = readl(pcie->parf + PCIE20_PARF_PHY_CTRL);
@@ -891,10 +873,6 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 
 	return 0;
 
-err_clk_axi_s:
-	clk_disable_unprepare(res->master_clk);
-err_clk_axi_m:
-	clk_disable_unprepare(res->aux_clk);
 err_clk_aux:
 	reset_control_assert(res->ahb_reset);
 err_rst_ahb:
-- 
2.18.0
