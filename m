From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/4] phy: qcom-ufs: Remove -always-on property
Date: Sun, 22 Jan 2017 13:17:48 -0800
Message-ID: <20170122211749.22803-3-bjorn.andersson@linaro.org>
References: <20170122211749.22803-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170122211749.22803-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The fact that a regulator is always-on is a property of the regulator,
not a specific consumer. Implementing this in the driver leads to a
system behaviour that is dependent on if the Qualcomm UFS PHY was ever
(partially) probed.

If the specific regulator should be always on in a particular device,
mark it so by specifying "regulator-always-on" in the regulator node.

Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Reviewed-by: Subhash Jadavani <subhashj@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Picked up reviewd-bys from Vivek and Subhash

 Documentation/devicetree/bindings/ufs/ufs-qcom.txt | 1 -
 drivers/phy/phy-qcom-ufs-i.h                       | 1 -
 drivers/phy/phy-qcom-ufs.c                         | 5 +----
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
index b6b5130e5f65..1f69ee1a61ea 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
+++ b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
@@ -29,7 +29,6 @@ Optional properties:
 - vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
 - vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
 - vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
-- vddp-ref-clk-always-on : specifies if this supply needs to be kept always on
 
 Example:
 
diff --git a/drivers/phy/phy-qcom-ufs-i.h b/drivers/phy/phy-qcom-ufs-i.h
index d505d98cf5f8..13b02b7de30b 100644
--- a/drivers/phy/phy-qcom-ufs-i.h
+++ b/drivers/phy/phy-qcom-ufs-i.h
@@ -77,7 +77,6 @@ struct ufs_qcom_phy_vreg {
 	int min_uV;
 	int max_uV;
 	bool enabled;
-	bool is_always_on;
 };
 
 struct ufs_qcom_phy {
diff --git a/drivers/phy/phy-qcom-ufs.c b/drivers/phy/phy-qcom-ufs.c
index bbd317158084..c145fa6e824c 100644
--- a/drivers/phy/phy-qcom-ufs.c
+++ b/drivers/phy/phy-qcom-ufs.c
@@ -242,9 +242,6 @@ static int ufs_qcom_phy_init_vreg(struct device *dev,
 			}
 			err = 0;
 		}
-		snprintf(prop_name, MAX_PROP_NAME, "%s-always-on", name);
-		vreg->is_always_on = of_property_read_bool(dev->of_node,
-							   prop_name);
 	}
 
 	if (!strcmp(name, "vdda-pll")) {
@@ -402,7 +399,7 @@ static int ufs_qcom_phy_disable_vreg(struct device *dev,
 {
 	int ret = 0;
 
-	if (!vreg || !vreg->enabled || vreg->is_always_on)
+	if (!vreg || !vreg->enabled)
 		goto out;
 
 	ret = regulator_disable(vreg->reg);
-- 
2.11.0
