From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] mfd: syscon: Make it possible to mark syscon as read only
Date: Thu, 19 Jun 2014 13:43:46 -0700
Message-ID: <1403210626-4845-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make it possible to mark syscon as read only, so that it can be used to
expose pieces of hardware that is read only.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 Documentation/devicetree/bindings/mfd/syscon.txt |  3 +++
 drivers/mfd/syscon.c                             | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index fe8150b..163325af0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -13,6 +13,9 @@ Required properties:
 - compatible: Should contain "syscon".
 - reg: the register region can be accessed from syscon
 
+Optional properties:
+- read-only: the register region is read only
+
 Examples:
 gpr: iomuxc-gpr@020e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index ca15878..902579d 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -110,6 +110,11 @@ struct regmap *syscon_regmap_lookup_by_phandle(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_phandle);
 
+static bool syscon_readonly_writable(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
 static const struct of_device_id of_syscon_match[] = {
 	{ .compatible = "syscon", },
 	{ },
@@ -141,6 +146,11 @@ static int syscon_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
+	if (of_property_read_bool(dev->of_node, "read-only"))
+		syscon_regmap_config.writeable_reg = syscon_readonly_writable;
+	else
+		syscon_regmap_config.writeable_reg = NULL;
+
 	syscon_regmap_config.max_register = res->end - res->start - 3;
 	if (pdata)
 		syscon_regmap_config.name = pdata->label;
-- 
1.8.2.2

