From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 2/2] PCI: imx6: Add code to request/control "pcie_aux" clock for i.MX8MQ
Date: Mon, 11 Feb 2019 17:51:08 -0800
Message-ID: <20190212015108.16952-3-andrew.smirnov@gmail.com>
References: <20190212015108.16952-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212015108.16952-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PCIe IP block has additional clock, "pcie_aux", that needs to be
controlled by the driver. Add code to support that.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-imx@nxp.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 drivers/pci/controller/dwc/pci-imx6.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 7cdf8f9ab244..1a7031782846 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -65,6 +65,7 @@ struct imx6_pcie {
 	struct clk		*pcie_phy;
 	struct clk		*pcie_inbound_axi;
 	struct clk		*pcie;
+	struct clk		*pcie_aux;
 	struct regmap		*iomuxc_gpr;
 	u32			controller_id;
 	struct reset_control	*pciephy_reset;
@@ -421,6 +422,12 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
 	case IMX7D:
 		break;
 	case IMX8MQ:
+		ret = clk_prepare_enable(imx6_pcie->pcie_aux);
+		if (ret) {
+			dev_err(dev, "unable to enable pcie_aux clock\n");
+			break;
+		}
+
 		offset = imx6_pcie_grp_offset(imx6_pcie);
 		/*
 		 * Set the over ride low and enabled
@@ -904,6 +911,9 @@ static void imx6_pcie_clk_disable(struct imx6_pcie *imx6_pcie)
 				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
 				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
 		break;
+	case IMX8MQ:
+		clk_disable_unprepare(imx6_pcie->pcie_aux);
+		break;
 	default:
 		break;
 	}
@@ -1049,6 +1059,12 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 			dev_err(dev, "Failed to get PCIE APPS reset control\n");
 			return PTR_ERR(imx6_pcie->apps_reset);
 		}
+
+		imx6_pcie->pcie_aux = devm_clk_get(dev, "pcie_aux");
+		if (IS_ERR(imx6_pcie->pcie_aux)) {
+			dev_err(dev, "pcie_aux clock source missing or invalid\n");
+			return PTR_ERR(imx6_pcie->pcie_aux);
+		}
 		break;
 	default:
 		break;
-- 
2.20.1
