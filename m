From: Gilad Avidov <gavidov@codeaurora.org>
Subject: [PATCH] spmi-pmic-arb: support configurable number of peripherals
Date: Thu,  3 Sep 2015 17:20:51 -0600
Message-ID: <1441322451-30149-1-git-send-email-gavidov@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gavidov@codeaurora.org, sdharia@codeaurora.org, mlocke@codeaurora.org, linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, svarbanov@mm-sol.com, wsa@the-dreams.de, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, iivanov@mm-sol.com, agross@codeaurora.org
List-Id: devicetree@vger.kernel.org

The current driver implementation supports only 128 peripherals.
Adding support for configurable number of peripherals since the
spmi-pmic-arb v2 HW has sub-versions which support from 128 to 512
PMIC peripherals.

Signed-off-by: Gilad Avidov <gavidov@codeaurora.org>
Reviewed-by: Sagar Dharia <sdharia@codeaurora.org>
---
 .../bindings/spmi/qcom,spmi-pmic-arb.txt           | 34 ++++++++-
 drivers/spmi/spmi-pmic-arb.c                       | 88 ++++++++++++++--------
 2 files changed, 91 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
index e16b9b5..fba7915 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -42,7 +42,11 @@ Required properties:
     cell 4: interrupt flags indicating level-sense information, as defined in
             dt-bindings/interrupt-controller/irq.h
 
-Example:
+Optional properties:
+- qcom,max-peripherals : number of PMIC peripherals (same as maximum APID)
+			 supported by HW. Default (minimum supported) is 128.
+
+Example V1 PMIC-Arbiter:
 
 	spmi {
 		compatible = "qcom,spmi-pmic-arb";
@@ -62,4 +66,32 @@ Example:
 
 		interrupt-controller;
 		#interrupt-cells = <4>;
+
+		qcom,max-peripherals = <256>;
+	};
+
+Example V2 PMIC-Arbiter:
+
+	spmi_bus: qcom,spmi@200f000 {
+		compatible = "qcom,spmi-pmic-arb";
+		reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+		reg = <0x200f000 0x1000>,
+			<0x2400000 0x400000>,
+			<0x2c00000 0x400000>,
+			<0x3800000 0x200000>,
+			<0x200a000 0x2100>;
+
+		interrupt-names = "periph_irq";
+		interrupts = <0 190 0>;
+
+		qcom,ee = <0>;
+		qcom,channel = <0>;
+
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <4>;
+
+		qcom,max-peripherals = <256>;
 	};
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index d7119db..ae0f05d 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -47,9 +47,8 @@
 #define SPMI_MAPPING_BIT_IS_1_FLAG(X)	(((X) >> 8) & 0x1)
 #define SPMI_MAPPING_BIT_IS_1_RESULT(X)	(((X) >> 0) & 0xFF)
 
-#define SPMI_MAPPING_TABLE_LEN		255
 #define SPMI_MAPPING_TABLE_TREE_DEPTH	16	/* Maximum of 16-bits */
-#define PPID_TO_CHAN_TABLE_SZ		BIT(12)	/* PPID is 12bit chan is 1byte*/
+#define PMIC_ARB_MAX_PPID		BIT(12) /* PPID is 12bit */
 
 /* Ownership Table */
 #define SPMI_OWNERSHIP_TABLE_REG(N)	(0x0700 + (4 * (N)))
@@ -84,9 +83,8 @@ enum pmic_arb_cmd_op_code {
 	PMIC_ARB_OP_ZERO_WRITE = 16,
 };
 
-/* Maximum number of support PMIC peripherals */
-#define PMIC_ARB_MAX_PERIPHS		256
-#define PMIC_ARB_MAX_CHNL		128
+/* Default (can override in config) max number of support PMIC peripherals */
+#define PMIC_ARB_MAX_APID_DEFAULT	128
 #define PMIC_ARB_PERIPH_ID_VALID	(1 << 15)
 #define PMIC_ARB_TIMEOUT_US		100
 #define PMIC_ARB_MAX_TRANS_BYTES	(8)
@@ -110,12 +108,16 @@ struct pmic_arb_ver_ops;
  * @channel:		execution environment channel to use for accesses.
  * @irq:		PMIC ARB interrupt.
  * @ee:			the current Execution Environment
- * @min_apid:		minimum APID (used for bounding IRQ search)
- * @max_apid:		maximum APID
+ * @min_irq_apid:	minimum APID with requested IRQ (used for bounding IRQ
+ *                      search).
+ * @max_irq_apid:	maximum APID with requested IRQ (used for bounding IRQ
+ *                      search).
+ * max_apid:		maximum APID supported by HW.
  * @mapping_table:	in-memory copy of PPID -> APID mapping table.
  * @domain:		irq domain object for PMIC IRQ domain
  * @spmic:		SPMI controller object
- * @apid_to_ppid:	in-memory copy of APID -> PPID mapping table.
+ * @irq_apid_to_ppid:	table which keeps track of APID -> PPID mapping for
+			peripherals which IRQ was requested for.
  * @ver_ops:		version dependent operations.
  * @ppid_to_chan	in-memory copy of PPID -> channel (APID) mapping table.
  *			v2 only.
@@ -129,14 +131,15 @@ struct spmi_pmic_arb_dev {
 	u8			channel;
 	int			irq;
 	u8			ee;
-	u8			min_apid;
-	u8			max_apid;
-	u32			mapping_table[SPMI_MAPPING_TABLE_LEN];
+	u16			min_irq_apid;
+	u16			max_irq_apid;
+	u16			max_apid;
+	u32			*mapping_table;
 	struct irq_domain	*domain;
 	struct spmi_controller	*spmic;
-	u16			apid_to_ppid[256];
+	u16			*irq_apid_to_ppid;
 	const struct pmic_arb_ver_ops *ver_ops;
-	u8			*ppid_to_chan;
+	u16			*ppid_to_chan;
 };
 
 /**
@@ -444,7 +447,7 @@ static void periph_interrupt(struct spmi_pmic_arb_dev *pa, u8 apid)
 		id = ffs(status) - 1;
 		status &= ~(1 << id);
 		irq = irq_find_mapping(pa->domain,
-				       pa->apid_to_ppid[apid] << 16
+				       pa->irq_apid_to_ppid[apid] << 16
 				     | id << 8
 				     | apid);
 		generic_handle_irq(irq);
@@ -456,8 +459,8 @@ static void pmic_arb_chained_irq(unsigned int irq, struct irq_desc *desc)
 	struct spmi_pmic_arb_dev *pa = irq_get_handler_data(irq);
 	struct irq_chip *chip = irq_get_chip(irq);
 	void __iomem *intr = pa->intr;
-	int first = pa->min_apid >> 5;
-	int last = pa->max_apid >> 5;
+	int first = pa->min_irq_apid >> 5;
+	int last = pa->max_irq_apid >> 5;
 	u32 status;
 	int i, id;
 
@@ -655,13 +658,13 @@ static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
 	if (err)
 		return err;
 
-	pa->apid_to_ppid[apid] = spec.slave << 8 | spec.per;
+	pa->irq_apid_to_ppid[apid] = spec.slave << 8 | spec.per;
 
 	/* Keep track of {max,min}_apid for bounding search during interrupt */
-	if (apid > pa->max_apid)
-		pa->max_apid = apid;
-	if (apid < pa->min_apid)
-		pa->min_apid = apid;
+	if (apid > pa->max_irq_apid)
+		pa->max_irq_apid = apid;
+	if (apid < pa->min_irq_apid)
+		pa->min_irq_apid = apid;
 
 	*out_hwirq = spec.slave << 24
 		   | spec.per   << 16
@@ -794,6 +797,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	pa = spmi_controller_get_drvdata(ctrl);
 	pa->spmic = ctrl;
+	pa->max_apid = PMIC_ARB_MAX_APID_DEFAULT;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core = devm_ioremap_resource(&ctrl->dev, res);
@@ -813,7 +817,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		pa->wr_base = core;
 		pa->rd_base = core;
 	} else {
-		u8  chan;
+		u16 chan;
 		u16 ppid;
 		u32 regval;
 
@@ -836,16 +840,24 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		}
 
 		pa->ppid_to_chan = devm_kzalloc(&ctrl->dev,
-					PPID_TO_CHAN_TABLE_SZ, GFP_KERNEL);
+						PMIC_ARB_MAX_PPID *
+						sizeof(*pa->ppid_to_chan),
+						GFP_KERNEL);
 		if (!pa->ppid_to_chan) {
 			err = -ENOMEM;
 			goto err_put_ctrl;
 		}
+
+		err = of_property_read_u32(pdev->dev.of_node,
+					   "qcom,max-peripherals", &regval);
+		if (!err)
+			pa->max_apid = regval;
+
 		/*
 		 * PMIC_ARB_REG_CHNL is a table in HW mapping channel to ppid.
 		 * ppid_to_chan is an in-memory invert of that table.
 		 */
-		for (chan = 0; chan < PMIC_ARB_MAX_CHNL; ++chan) {
+		for (chan = 0; chan < pa->max_apid ; ++chan) {
 			regval = readl_relaxed(core + PMIC_ARB_REG_CHNL(chan));
 			if (!regval)
 				continue;
@@ -903,14 +915,30 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	pa->ee = ee;
 
-	for (i = 0; i < ARRAY_SIZE(pa->mapping_table); ++i)
-		pa->mapping_table[i] = readl_relaxed(
-				pa->cnfg + SPMI_MAPPING_TABLE_REG(i));
+	pa->irq_apid_to_ppid = devm_kzalloc(&ctrl->dev, pa->max_apid *
+					    sizeof(*pa->irq_apid_to_ppid),
+					    GFP_KERNEL);
+	if (!pa->irq_apid_to_ppid) {
+		err = -ENOMEM;
+		goto err_put_ctrl;
+	}
+
+	pa->mapping_table = devm_kzalloc(&ctrl->dev,
+					(pa->max_apid - 1) * sizeof(u32),
+					GFP_KERNEL);
+	if (!pa->mapping_table) {
+		err = -ENOMEM;
+		goto err_put_ctrl;
+	}
+
+	for (i = 0; i < (pa->max_apid - 1); ++i)
+		pa->mapping_table[i] = readl_relaxed(pa->cnfg +
+						  SPMI_MAPPING_TABLE_REG(i));
 
-	/* Initialize max_apid/min_apid to the opposite bounds, during
+	/* Initialize max_irq_apid/min_irq_apid to the opposite bounds, during
 	 * the irq domain translation, we are sure to update these */
-	pa->max_apid = 0;
-	pa->min_apid = PMIC_ARB_MAX_PERIPHS - 1;
+	pa->max_irq_apid = 0;
+	pa->min_irq_apid = pa->max_apid - 1;
 
 	platform_set_drvdata(pdev, ctrl);
 	raw_spin_lock_init(&pa->lock);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
