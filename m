From: Rob Clark <robdclark@gmail.com>
Subject: [RFC] drm/msm: DT support for 8960/8064
Date: Tue,  1 Jul 2014 14:57:35 -0400
Message-ID: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we (almost) have enough dependencies in place (MMCC, RPM, etc),
add necessary DT support so that we can use drm/msm on upstream kernel.

Signed-off-by: Rob Clark <robdclark@gmail.com>
---
Commence bikeshedding :-)

 Documentation/devicetree/bindings/drm/msm/gpu.txt  | 51 ++++++++++++++++++++
 Documentation/devicetree/bindings/drm/msm/hdmi.txt | 43 +++++++++++++++++
 Documentation/devicetree/bindings/drm/msm/msm.txt  | 40 ++++++++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 55 ++++++++++++++--------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c            | 10 ++--
 drivers/gpu/drm/msm/msm_drv.c                      | 29 ++++++++++--
 7 files changed, 204 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/msm/gpu.txt
 create mode 100644 Documentation/devicetree/bindings/drm/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/drm/msm/msm.txt

diff --git a/Documentation/devicetree/bindings/drm/msm/gpu.txt b/Documentation/devicetree/bindings/drm/msm/gpu.txt
new file mode 100644
index 0000000..6e33efe
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/msm/gpu.txt
@@ -0,0 +1,51 @@
+Qualcomm adreno/snapdragon GPU
+
+Required properties:
+- compatible: "qcom,adreno-3xx"
+- reg: Physical base address and length of the controller's registers.
+- interrupts: The interrupt outputs from the controller.
+- clocks: device clocks
+  See ../clocks/clock-bindings.txt for details.
+- qcom,chipid: gpu chip-id.  Note this may become optional for future
+  devices if we can reliably read the chipid from hw
+- qcom,gpu-pwrlevels: array of OPPs, sorted highest to lowest
+  - compatible: "qcom,gpu-pwrlevels"
+  - for each qcom,gpu-pwrlevel:
+    - qcom,gpu-freq: requested gpu clock speed
+    - NOTE: downstream android driver defines additional parameters to
+      configure memory bandwidth scaling per OPP.
+
+Optional properties:
+- n/a
+
+Example:
+
+/ {
+	...
+
+	gpu: qcom,kgsl-3d0@4300000 {
+		compatible = "qcom,adreno-3xx";
+		reg = <0x04300000 0x20000>;
+		reg-names = "kgsl_3d0_reg_memory";
+		interrupts = <GIC_SPI 80 0>;
+		interrupt-names = "kgsl_3d0_irq";
+		clock-names =
+		    "core_clk",
+		    "iface_clk",
+		    "mem_iface_clk";
+		clocks =
+		    <&mmcc GFX3D_CLK>,
+		    <&mmcc GFX3D_AHB_CLK>,
+		    <&mmcc MMSS_IMEM_AHB_CLK>;
+		qcom,chipid = <0x03020100>;
+		qcom,gpu-pwrlevels {
+			compatible = "qcom,gpu-pwrlevels";
+			qcom,gpu-pwrlevel@0 {
+				qcom,gpu-freq = <450000000>;
+			};
+			qcom,gpu-pwrlevel@1 {
+				qcom,gpu-freq = <27000000>;
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
new file mode 100644
index 0000000..051a49f
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
@@ -0,0 +1,43 @@
+Qualcomm adreno/snapdragon hdmi output
+
+Required properties:
+- compatible: "qcom,hdmi-tx-8x60", "qcom,hdmi-tx-8960", "qcom,hdmi-tx-8x74"
+- reg: Physical base address and length of the controller's registers.
+- interrupts: The interrupt outputs from the controller.
+- clocks: device clocks
+  See ../clocks/clock-bindings.txt for details.
+- qcom,hdmi-tx-ddc-clk: ddc clk pin
+- qcom,hdmi-tx-ddc-data: ddc data pin
+- qcom,hdmi-tx-hpd: hpd pin
+- core-vdda-supply: phandle to supply regulator
+- hdmi-mux-supply: phandle to mux regulator
+
+Optional properties:
+- qcom,hdmi-tx-mux-en: hdmi mux enable pin
+- qcom,hdmi-tx-mux-sel: hdmi mux select pin
+
+Example:
+
+/ {
+	...
+
+	hdmi: qcom,hdmi-tx-8960@4a00000 {
+		compatible = "qcom,hdmi-tx-8960";
+		reg-names = "core_physical";
+		reg = <0x04a00000 0x1000>;
+		interrupts = <GIC_SPI 79 0>;
+		clock-names =
+		    "core_clk",
+		    "master_iface_clk",
+		    "slave_iface_clk";
+		clocks =
+		    <&mmcc HDMI_APP_CLK>,
+		    <&mmcc HDMI_M_AHB_CLK>,
+		    <&mmcc HDMI_S_AHB_CLK>;
+		qcom,hdmi-tx-ddc-clk = <&msmgpio 70 GPIO_ACTIVE_HIGH>;
+		qcom,hdmi-tx-ddc-data = <&msmgpio 71 GPIO_ACTIVE_HIGH>;
+		qcom,hdmi-tx-hpd = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
+		core-vdda-supply = <&pm8921_hdmi_mvs>;
+		hdmi-mux-supply = <&ext_3p3v>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/drm/msm/msm.txt b/Documentation/devicetree/bindings/drm/msm/msm.txt
new file mode 100644
index 0000000..484cc12
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/msm/msm.txt
@@ -0,0 +1,40 @@
+Qualcomm adreno/snapdragon
+
+Required properties:
+- compatible: "qcom,mdp" (mdp4) or "qcom,mdss_mdp" (mdp5)
+- reg: Physical base address and length of the controller's registers.
+- interrupts: The interrupt outputs from the controller.
+- connectors: array of phandles for output device(s)
+- clocks: device clocks
+  See ../clocks/clock-bindings.txt for details.
+
+Optional properties:
+- gpus: phandle for gpu device
+
+Example:
+
+/ {
+	...
+
+	mdp: qcom,mdp@5100000 {
+		compatible = "qcom,mdp";
+		reg = <0x05100000 0xf0000>;
+		interrupts = <GIC_SPI 75 0>;
+		connectors = <&hdmi>;
+		gpus = <&gpu>;
+		clock-names =
+		    "core_clk",
+		    "iface_clk",
+		    "lut_clk",
+		    "src_clk",
+		    "hdmi_clk",
+		    "mdp_clk";
+		clocks =
+		    <&mmcc MDP_SRC>,
+		    <&mmcc MDP_AHB_CLK>,
+		    <&mmcc MDP_LUT_CLK>,
+		    <&mmcc TV_SRC>,
+		    <&mmcc HDMI_TV_CLK>,
+		    <&mmcc MDP_TV_CLK>;
+	};
+};
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index a2cee06..2773600 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -680,6 +680,8 @@ static int a3xx_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "qcom,adreno-3xx" },
+	/* for backwards compat w/ downstream kgsl DT files: */
 	{ .compatible = "qcom,kgsl-3d0" },
 	{}
 };
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7f7aade..0ff8d46 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -123,7 +123,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
 	for (i = 0; i < config->hpd_reg_cnt; i++) {
 		struct regulator *reg;
 
-		reg = devm_regulator_get(&pdev->dev, config->hpd_reg_names[i]);
+		reg = devm_regulator_get_exclusive(&pdev->dev,
+				config->hpd_reg_names[i]);
 		if (IS_ERR(reg)) {
 			ret = PTR_ERR(reg);
 			dev_err(dev->dev, "failed to get hpd regulator: %s (%d)\n",
@@ -138,7 +139,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
 	for (i = 0; i < config->pwr_reg_cnt; i++) {
 		struct regulator *reg;
 
-		reg = devm_regulator_get(&pdev->dev, config->pwr_reg_names[i]);
+		reg = devm_regulator_get_exclusive(&pdev->dev,
+				config->pwr_reg_names[i]);
 		if (IS_ERR(reg)) {
 			ret = PTR_ERR(reg);
 			dev_err(dev->dev, "failed to get pwr regulator: %s (%d)\n",
@@ -273,24 +275,37 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 		return gpio;
 	}
 
-	/* TODO actually use DT.. */
-	static const char *hpd_reg_names[] = {"hpd-gdsc", "hpd-5v"};
-	static const char *pwr_reg_names[] = {"core-vdda", "core-vcc"};
-	static const char *hpd_clk_names[] = {"iface_clk", "core_clk", "mdp_core_clk"};
-	static unsigned long hpd_clk_freq[] = {0, 19200000, 0};
-	static const char *pwr_clk_names[] = {"extp_clk", "alt_iface_clk"};
+	if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8x74")) {
+		static const char *hpd_reg_names[] = {"hpd-gdsc", "hpd-5v"};
+		static const char *pwr_reg_names[] = {"core-vdda", "core-vcc"};
+		static const char *hpd_clk_names[] = {"iface_clk", "core_clk", "mdp_core_clk"};
+		static unsigned long hpd_clk_freq[] = {0, 19200000, 0};
+		static const char *pwr_clk_names[] = {"extp_clk", "alt_iface_clk"};
+		config.phy_init      = hdmi_phy_8x74_init;
+		config.hpd_reg_names = hpd_reg_names;
+		config.hpd_reg_cnt   = ARRAY_SIZE(hpd_reg_names);
+		config.pwr_reg_names = pwr_reg_names;
+		config.pwr_reg_cnt   = ARRAY_SIZE(pwr_reg_names);
+		config.hpd_clk_names = hpd_clk_names;
+		config.hpd_freq      = hpd_clk_freq;
+		config.hpd_clk_cnt   = ARRAY_SIZE(hpd_clk_names);
+		config.pwr_clk_names = pwr_clk_names;
+		config.pwr_clk_cnt   = ARRAY_SIZE(pwr_clk_names);
+	} else if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8960")) {
+		static const char *hpd_clk_names[] = {"core_clk", "master_iface_clk", "slave_iface_clk"};
+		static const char *hpd_reg_names[] = {"core-vdda", "hdmi-mux"};
+		config.phy_init      = hdmi_phy_8960_init;
+		config.hpd_reg_names = hpd_reg_names;
+		config.hpd_reg_cnt   = ARRAY_SIZE(hpd_reg_names);
+		config.hpd_clk_names = hpd_clk_names;
+		config.hpd_clk_cnt   = ARRAY_SIZE(hpd_clk_names);
+	} else if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8x60")) {
+		config.phy_init      = hdmi_phy_8x60_init;
+	} else {
+		dev_err(dev, "unknown phy: %s\n", of_node->name);
+	}
 
-	config.phy_init      = hdmi_phy_8x74_init;
 	config.mmio_name     = "core_physical";
-	config.hpd_reg_names = hpd_reg_names;
-	config.hpd_reg_cnt   = ARRAY_SIZE(hpd_reg_names);
-	config.pwr_reg_names = pwr_reg_names;
-	config.pwr_reg_cnt   = ARRAY_SIZE(pwr_reg_names);
-	config.hpd_clk_names = hpd_clk_names;
-	config.hpd_freq      = hpd_clk_freq;
-	config.hpd_clk_cnt   = ARRAY_SIZE(hpd_clk_names);
-	config.pwr_clk_names = pwr_clk_names;
-	config.pwr_clk_cnt   = ARRAY_SIZE(pwr_clk_names);
 	config.ddc_clk_gpio  = get_gpio("qcom,hdmi-tx-ddc-clk");
 	config.ddc_data_gpio = get_gpio("qcom,hdmi-tx-ddc-data");
 	config.hpd_gpio      = get_gpio("qcom,hdmi-tx-hpd");
@@ -373,7 +388,9 @@ static int hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx" },
+	{ .compatible = "qcom,hdmi-tx-8x74" },
+	{ .compatible = "qcom,hdmi-tx-8960" },
+	{ .compatible = "qcom,hdmi-tx-8x60" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index 0bb4faa..5a7bfd4 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -294,15 +294,17 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	mdp4_kms->dsi_pll_vdda = devm_regulator_get(&pdev->dev, "dsi_pll_vdda");
+	mdp4_kms->dsi_pll_vdda =
+			devm_regulator_get_optional(&pdev->dev, "dsi_pll_vdda");
 	if (IS_ERR(mdp4_kms->dsi_pll_vdda))
 		mdp4_kms->dsi_pll_vdda = NULL;
 
-	mdp4_kms->dsi_pll_vddio = devm_regulator_get(&pdev->dev, "dsi_pll_vddio");
+	mdp4_kms->dsi_pll_vddio =
+			devm_regulator_get_optional(&pdev->dev, "dsi_pll_vddio");
 	if (IS_ERR(mdp4_kms->dsi_pll_vddio))
 		mdp4_kms->dsi_pll_vddio = NULL;
 
-	mdp4_kms->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
 	if (IS_ERR(mdp4_kms->vdd))
 		mdp4_kms->vdd = NULL;
 
@@ -406,6 +408,8 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 	static struct mdp4_platform_config config = {};
 #ifdef CONFIG_OF
 	/* TODO */
+	config.max_clk = 266667000;
+	config.iommu = iommu_domain_alloc(&platform_bus_type);
 #else
 	if (cpu_is_apq8064())
 		config.max_clk = 266667000;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9a5d87d..1ad0155 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -906,7 +906,8 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-static int msm_drm_add_components(struct device *master, struct master *m)
+static int add_components(struct device *master, struct master *m,
+		const char *name)
 {
 	struct device_node *np = master->of_node;
 	unsigned i;
@@ -915,16 +916,35 @@ static int msm_drm_add_components(struct device *master, struct master *m)
 	for (i = 0; ; i++) {
 		struct device_node *node;
 
-		node = of_parse_phandle(np, "connectors", i);
+		node = of_parse_phandle(np, name, i);
 		if (!node)
 			break;
 
 		ret = component_master_add_child(m, compare_of, node);
 		of_node_put(node);
 
-		if (ret)
+		if (ret) {
+			dev_err(master, "could not add %s child %s: %d\n",
+					name, node->name, ret);
 			return ret;
+		}
 	}
+
+	return 0;
+}
+
+static int msm_drm_add_components(struct device *master, struct master *m)
+{
+	int ret;
+
+	ret = add_components(master, m, "connectors");
+	if (ret)
+		return ret;
+
+	ret = add_components(master, m, "gpus");
+	if (ret)
+		return ret;
+
 	return 0;
 }
 #else
@@ -1008,7 +1028,8 @@ static const struct platform_device_id msm_id[] = {
 };
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss_mdp" },
+	{ .compatible = "qcom,mdp" },      /* mdp4 */
+	{ .compatible = "qcom,mdss_mdp" }, /* mdp5 */
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
1.9.3
