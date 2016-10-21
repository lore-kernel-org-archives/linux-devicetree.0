From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/2] PCI: rockchip: Add three new resets as required properties
Date: Fri, 21 Oct 2016 10:43:55 +0800
Message-ID: <1477017836-19317-2-git-send-email-shawn.lin@rock-chips.com>
References: <1477017836-19317-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477017836-19317-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pm_rst, aclk_rst, pclk_rst was controlled by rom code so the
software wasn't needed to control it again in theory. But it
didn't work properly, so we do need to do it again and add a
enough delay between the assert of pm_rst and the deassert of
pm_rst. The Soc intergrated with this controller, rk3399 is still
under MP test internally, so the backward compatibility won't be
a big deal.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 .../devicetree/bindings/pci/rockchip-pcie.txt      | 11 ++--
 drivers/pci/host/pcie-rockchip.c                   | 62 ++++++++++++++++++++++
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
index ba67b39..71aeda1 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
@@ -26,13 +26,16 @@ Required properties:
 	- "sys"
 	- "legacy"
 	- "client"
-- resets: Must contain five entries for each entry in reset-names.
+- resets: Must contain seven entries for each entry in reset-names.
 	   See ../reset/reset.txt for details.
 - reset-names: Must include the following names
 	- "core"
 	- "mgmt"
 	- "mgmt-sticky"
 	- "pipe"
+	- "pm"
+	- "aclk"
+	- "pclk"
 - pinctrl-names : The pin control state names
 - pinctrl-0: The "default" pinctrl state
 - #interrupt-cells: specifies the number of cells needed to encode an
@@ -86,8 +89,10 @@ pcie0: pcie@f8000000 {
 	reg = <0x0 0xf8000000 0x0 0x2000000>, <0x0 0xfd000000 0x0 0x1000000>;
 	reg-names = "axi-base", "apb-base";
 	resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
-		 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>;
-	reset-names = "core", "mgmt", "mgmt-sticky", "pipe";
+		 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE> ,
+		 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>, <&cru SRST_A_PCIE>;
+	reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
+		      "pm", "pclk", "aclk";
 	phys = <&pcie_phy>;
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index e0b22da..e04f69b 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -190,6 +190,9 @@ struct rockchip_pcie {
 	struct	reset_control *mgmt_rst;
 	struct	reset_control *mgmt_sticky_rst;
 	struct	reset_control *pipe_rst;
+	struct	reset_control *pm_rst;
+	struct	reset_control *aclk_rst;
+	struct	reset_control *pclk_rst;
 	struct	clk *aclk_pcie;
 	struct	clk *aclk_perf_pcie;
 	struct	clk *hclk_pcie;
@@ -408,6 +411,44 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 
 	gpiod_set_value(rockchip->ep_gpio, 0);
 
+	err = reset_control_assert(rockchip->aclk_rst);
+	if (err) {
+		dev_err(dev, "assert aclk_rst err %d\n", err);
+		return err;
+	}
+
+	err = reset_control_assert(rockchip->pclk_rst);
+	if (err) {
+		dev_err(dev, "assert pclk_rst err %d\n", err);
+		return err;
+	}
+
+	err = reset_control_assert(rockchip->pm_rst);
+	if (err) {
+		dev_err(dev, "assert pm_rst err %d\n", err);
+		return err;
+	}
+
+	udelay(10);
+
+	err = reset_control_deassert(rockchip->pm_rst);
+	if (err) {
+		dev_err(dev, "deassert pm_rst err %d\n", err);
+		return err;
+	}
+
+	err = reset_control_deassert(rockchip->aclk_rst);
+	if (err) {
+		dev_err(dev, "deassert mgmt_sticky_rst err %d\n", err);
+		return err;
+	}
+
+	err = reset_control_deassert(rockchip->pclk_rst);
+	if (err) {
+		dev_err(dev, "deassert mgmt_sticky_rst err %d\n", err);
+		return err;
+	}
+
 	err = phy_init(rockchip->phy);
 	if (err < 0) {
 		dev_err(dev, "fail to init phy, err %d\n", err);
@@ -781,6 +822,27 @@ static int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
 		return PTR_ERR(rockchip->pipe_rst);
 	}
 
+	rockchip->pm_rst = devm_reset_control_get(dev, "pm");
+	if (IS_ERR(rockchip->pm_rst)) {
+		if (PTR_ERR(rockchip->pm_rst) != -EPROBE_DEFER)
+			dev_err(dev, "missing pm reset property in node\n");
+		return PTR_ERR(rockchip->pm_rst);
+	}
+
+	rockchip->pclk_rst = devm_reset_control_get(dev, "pclk");
+	if (IS_ERR(rockchip->pclk_rst)) {
+		if (PTR_ERR(rockchip->pclk_rst) != -EPROBE_DEFER)
+			dev_err(dev, "missing pclk reset property in node\n");
+		return PTR_ERR(rockchip->pclk_rst);
+	}
+
+	rockchip->aclk_rst = devm_reset_control_get(dev, "aclk");
+	if (IS_ERR(rockchip->aclk_rst)) {
+		if (PTR_ERR(rockchip->aclk_rst) != -EPROBE_DEFER)
+			dev_err(dev, "missing aclk reset property in node\n");
+		return PTR_ERR(rockchip->aclk_rst);
+	}
+
 	rockchip->ep_gpio = devm_gpiod_get(dev, "ep", GPIOD_OUT_HIGH);
 	if (IS_ERR(rockchip->ep_gpio)) {
 		dev_err(dev, "missing ep-gpios property in node\n");
-- 
2.3.7


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
