From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 6/7] PCI: qcom: Add QCS404 PCIe controller support
Date: Fri, 25 Jan 2019 15:45:08 -0800
Message-ID: <20190125234509.26419-7-bjorn.andersson@linaro.org>
References: <20190125234509.26419-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125234509.26419-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The QCS404 platform contains a PCIe controller of version 2.4.0 and a
Qualcomm PCIe2 PHY. The driver already supports version 2.4.0, for the
IPQ4019, but this support touches clocks and resets related to the PHY
as well, and there's no upstream driver for the PHY.

On QCS404 we must initialize the PHY, so a separate PHY driver is
implemented to take care of this and the controller driver is updated to
not require the PHY related resources. This is done by relying on the
fact that operations in both the clock and reset framework are nops when
passed NULL, so we can isolate this change to only the get_resource
function.

For QCS404 we also need to enable the AHB (iface) clock, in order to
access the register space of the controller, but as this is not part of
the IPQ4019 DT binding this is only added for new users of the 2.4.0
controller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 64 +++++++++++++++-----------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9d366fad2b7f..6d4215ddcb42 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -113,7 +113,7 @@ struct qcom_pcie_resources_2_3_2 {
 };
 
 struct qcom_pcie_resources_2_4_0 {
-	struct clk_bulk_data clks[3];
+	struct clk_bulk_data clks[4];
 	int num_clks;
 	struct reset_control *axi_m_reset;
 	struct reset_control *axi_s_reset;
@@ -637,13 +637,16 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	bool is_ipq = of_device_is_compatible(dev->of_node, "qcom,pcie-ipq4019");
 	int ret;
 
 	res->clks[0].id = "aux";
 	res->clks[1].id = "master_bus";
 	res->clks[2].id = "slave_bus";
+	res->clks[3].id = "iface";
 
-	res->num_clks = 3;
+	/* qcom,pcie-ipq4019 is defined without "iface" */
+	res->num_clks = is_ipq ? 3 : 4;
 
 	ret = devm_clk_bulk_get(dev, res->num_clks, res->clks);
 	if (ret < 0)
@@ -657,27 +660,33 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 	if (IS_ERR(res->axi_s_reset))
 		return PTR_ERR(res->axi_s_reset);
 
-	res->pipe_reset = devm_reset_control_get_exclusive(dev, "pipe");
-	if (IS_ERR(res->pipe_reset))
-		return PTR_ERR(res->pipe_reset);
-
-	res->axi_m_vmid_reset = devm_reset_control_get_exclusive(dev,
-								 "axi_m_vmid");
-	if (IS_ERR(res->axi_m_vmid_reset))
-		return PTR_ERR(res->axi_m_vmid_reset);
-
-	res->axi_s_xpu_reset = devm_reset_control_get_exclusive(dev,
-								"axi_s_xpu");
-	if (IS_ERR(res->axi_s_xpu_reset))
-		return PTR_ERR(res->axi_s_xpu_reset);
-
-	res->parf_reset = devm_reset_control_get_exclusive(dev, "parf");
-	if (IS_ERR(res->parf_reset))
-		return PTR_ERR(res->parf_reset);
-
-	res->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
-	if (IS_ERR(res->phy_reset))
-		return PTR_ERR(res->phy_reset);
+	if (is_ipq) {
+		/*
+		 * These resources relates to the PHY, but are controlled here
+		 * for IPQ4019
+		 */
+		res->pipe_reset = devm_reset_control_get_exclusive(dev, "pipe");
+		if (IS_ERR(res->pipe_reset))
+			return PTR_ERR(res->pipe_reset);
+
+		res->axi_m_vmid_reset = devm_reset_control_get_exclusive(dev,
+									 "axi_m_vmid");
+		if (IS_ERR(res->axi_m_vmid_reset))
+			return PTR_ERR(res->axi_m_vmid_reset);
+
+		res->axi_s_xpu_reset = devm_reset_control_get_exclusive(dev,
+									"axi_s_xpu");
+		if (IS_ERR(res->axi_s_xpu_reset))
+			return PTR_ERR(res->axi_s_xpu_reset);
+
+		res->parf_reset = devm_reset_control_get_exclusive(dev, "parf");
+		if (IS_ERR(res->parf_reset))
+			return PTR_ERR(res->parf_reset);
+
+		res->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+		if (IS_ERR(res->phy_reset))
+			return PTR_ERR(res->phy_reset);
+	}
 
 	res->axi_m_sticky_reset = devm_reset_control_get_exclusive(dev,
 								   "axi_m_sticky");
@@ -697,9 +706,11 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 	if (IS_ERR(res->ahb_reset))
 		return PTR_ERR(res->ahb_reset);
 
-	res->phy_ahb_reset = devm_reset_control_get_exclusive(dev, "phy_ahb");
-	if (IS_ERR(res->phy_ahb_reset))
-		return PTR_ERR(res->phy_ahb_reset);
+	if (is_ipq) {
+		res->phy_ahb_reset = devm_reset_control_get_exclusive(dev, "phy_ahb");
+		if (IS_ERR(res->phy_ahb_reset))
+			return PTR_ERR(res->phy_ahb_reset);
+	}
 
 	return 0;
 }
@@ -1284,6 +1295,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-msm8996", .data = &ops_2_3_2 },
 	{ .compatible = "qcom,pcie-ipq8074", .data = &ops_2_3_3 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &ops_2_4_0 },
+	{ .compatible = "qcom,pcie-qcs404", .data = &ops_2_4_0 },
 	{ }
 };
 
-- 
2.18.0
