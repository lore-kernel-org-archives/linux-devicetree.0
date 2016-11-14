From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 3/3] PCI: qcom: add runtime pm support to pcie_port
Date: Mon, 14 Nov 2016 11:15:55 +0000
Message-ID: <1479122155-13393-4-git-send-email-srinivas.kandagatla@linaro.org>
References: <1479122155-13393-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479122155-13393-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch is required when the pcie controller sits on a bus with
its own power domain and clocks which are controlled via a bus driver
like simple pm bus. As these bus driver have runtime pm enabled, it makes
sense to update the usage counter so that the runtime pm does not suspend
the clks or power domain associated with the bus driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/pci/host/pcie-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/host/pcie-qcom.c b/drivers/pci/host/pcie-qcom.c
index 03ba6b1..c2ca848 100644
--- a/drivers/pci/host/pcie-qcom.c
+++ b/drivers/pci/host/pcie-qcom.c
@@ -587,6 +587,8 @@ static void qcom_pcie_host_init(struct pcie_port *pp)
 	struct qcom_pcie *pcie = to_qcom_pcie(pp);
 	int ret;
 
+	pm_runtime_get_sync(pp->dev);
+
 	qcom_ep_reset_assert(pcie);
 
 	ret = pcie->ops->init(pcie);
@@ -617,6 +619,7 @@ static void qcom_pcie_host_init(struct pcie_port *pp)
 	phy_power_off(pcie->phy);
 err_deinit:
 	pcie->ops->deinit(pcie);
+	pm_runtime_put_sync(pp->dev);
 }
 
 static int qcom_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
@@ -673,6 +676,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	if (!pcie)
 		return -ENOMEM;
 
+	pm_runtime_enable(dev);
 	pp = &pcie->pp;
 	pcie->ops = (struct qcom_pcie_ops *)of_device_get_match_data(dev);
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
