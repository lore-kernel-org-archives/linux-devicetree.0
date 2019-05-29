From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 1/3] PCI: qcom: Use clk_bulk API for 2.4.0 controllers
Date: Tue, 28 May 2019 17:57:08 -0700
Message-ID: <20190529005710.23950-2-bjorn.andersson@linaro.org>
References: <20190529005710.23950-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529005710.23950-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Before introducing the QCS404 platform, which uses the same PCIe
controller as IPQ4019, migrate this to use the bulk clock API, in order
to make the error paths slighly cleaner.

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Renamed "err_clks" label
- Picked up Vinod's r-b and Stanimir's a-b

 drivers/pci/controller/dwc/pcie-qcom.c | 53 ++++++++------------------
 1 file changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 0ed235d560e3..23dc01212508 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -112,10 +112,10 @@ struct qcom_pcie_resources_2_3_2 {
 	struct regulator_bulk_data supplies[QCOM_PCIE_2_3_2_MAX_SUPPLY];
 };
 
+#define QCOM_PCIE_2_4_0_MAX_CLOCKS	3
 struct qcom_pcie_resources_2_4_0 {
-	struct clk *aux_clk;
-	struct clk *master_clk;
-	struct clk *slave_clk;
+	struct clk_bulk_data clks[QCOM_PCIE_2_4_0_MAX_CLOCKS];
+	int num_clks;
 	struct reset_control *axi_m_reset;
 	struct reset_control *axi_s_reset;
 	struct reset_control *pipe_reset;
@@ -638,18 +638,17 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
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
@@ -719,9 +718,7 @@ static void qcom_pcie_deinit_2_4_0(struct qcom_pcie *pcie)
 	reset_control_assert(res->axi_m_sticky_reset);
 	reset_control_assert(res->pwr_reset);
 	reset_control_assert(res->ahb_reset);
-	clk_disable_unprepare(res->aux_clk);
-	clk_disable_unprepare(res->master_clk);
-	clk_disable_unprepare(res->slave_clk);
+	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
 
 static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
@@ -850,23 +847,9 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 
 	usleep_range(10000, 12000);
 
-	ret = clk_prepare_enable(res->aux_clk);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable iface clock\n");
-		goto err_clk_aux;
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
+	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
+	if (ret)
+		goto err_clks;
 
 	/* enable PCIe clocks and resets */
 	val = readl(pcie->parf + PCIE20_PARF_PHY_CTRL);
@@ -891,11 +874,7 @@ static int qcom_pcie_init_2_4_0(struct qcom_pcie *pcie)
 
 	return 0;
 
-err_clk_axi_s:
-	clk_disable_unprepare(res->master_clk);
-err_clk_axi_m:
-	clk_disable_unprepare(res->aux_clk);
-err_clk_aux:
+err_clks:
 	reset_control_assert(res->ahb_reset);
 err_rst_ahb:
 	reset_control_assert(res->pwr_reset);
-- 
2.18.0
