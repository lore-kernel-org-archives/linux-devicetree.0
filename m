From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH] pinctrl: Add support for PM8916 GPIO's and MPP's
Date: Tue, 31 Mar 2015 12:37:18 +0300
Message-ID: <1427794638-32732-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add compatible string definitions and supported pin functions.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt        |  2 ++
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt         |  2 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                  |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                   |  1 +
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h              | 15 +++++++++++++++
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h               |  4 ++++
 6 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7ed0804..1ae63c0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -10,6 +10,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm8018-gpio"
 		    "qcom,pm8038-gpio"
 		    "qcom,pm8058-gpio"
+		    "qcom,pm8916-gpio"
 		    "qcom,pm8917-gpio"
 		    "qcom,pm8921-gpio"
 		    "qcom,pm8941-gpio"
@@ -74,6 +75,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio6 for pm8018
 		    gpio1-gpio12 for pm8038
 		    gpio1-gpio40 for pm8058
+		    gpio1-gpio4 for pm8916
 		    gpio1-gpio38 for pm8917
 		    gpio1-gpio44 for pm8921
 		    gpio1-gpio36 for pm8941
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
index 854774b..ed19991 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
@@ -8,6 +8,7 @@ of PMIC's from Qualcomm.
 	Value type: <string>
 	Definition: Should contain one of:
 		    "qcom,pm8841-mpp",
+		    "qcom,pm8916-mpp",
 		    "qcom,pm8941-mpp",
 		    "qcom,pma8084-mpp",

@@ -67,6 +68,7 @@ to specify in a pin configuration subnode:
 	Definition: List of MPP pins affected by the properties specified in
 		    this subnode.  Valid pins are:
 		    mpp1-mpp4 for pm8841
+		    mpp1-mpp4 for pm8916
 		    mpp1-mpp8 for pm8941
 		    mpp1-mpp4 for pma8084

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 0f11a26..b2d2221 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -810,6 +810,7 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 }

 static const struct of_device_id pmic_gpio_of_match[] = {
+	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
 	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
 	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
 	{ },
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index a8924db..8f36c5f 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -925,6 +925,7 @@ static int pmic_mpp_remove(struct platform_device *pdev)

 static const struct of_device_id pmic_mpp_of_match[] = {
 	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
+	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
 	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
 	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
 	{ },
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index fa74d7c..aafa76c 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -48,6 +48,14 @@
 #define PM8058_GPIO_L5			6
 #define PM8058_GPIO_L2			7

+/*
+ * Note: PM8916 GPIO1 and GPIO2 are supporting
+ * only L2(1.15V) and L5(1.8V) options
+ */
+#define PM8916_GPIO_VPH			0
+#define PM8916_GPIO_L2			2
+#define PM8916_GPIO_L5			3
+
 #define PM8917_GPIO_VPH			0
 #define PM8917_GPIO_S4			2
 #define PM8917_GPIO_L15			3
@@ -115,6 +123,13 @@
 #define PM8058_GPIO39_MP3_CLK		PMIC_GPIO_FUNC_FUNC1
 #define PM8058_GPIO40_EXT_BB_EN		PMIC_GPIO_FUNC_FUNC1

+#define PM8916_GPIO1_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
+#define PM8916_GPIO1_KEYP_DRV		PMIC_GPIO_FUNC_FUNC2
+#define PM8916_GPIO2_DIV_CLK		PMIC_GPIO_FUNC_FUNC1
+#define PM8916_GPIO2_SLEEP_CLK		PMIC_GPIO_FUNC_FUNC2
+#define PM8916_GPIO3_KEYP_DRV		PMIC_GPIO_FUNC_FUNC1
+#define PM8916_GPIO4_KEYP_DRV		PMIC_GPIO_FUNC_FUNC2
+
 #define PM8917_GPIO9_18_KEYP_DRV	PMIC_GPIO_FUNC_FUNC1
 #define PM8917_GPIO20_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
 #define PM8917_GPIO21_23_UART_TX	PMIC_GPIO_FUNC_FUNC2
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
index d2c7dab..c102054 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
@@ -10,6 +10,10 @@
 #define PM8841_MPP_VPH			0
 #define PM8841_MPP_S3			2

+#define PM8916_MPP_VPH			0
+#define PM8916_MPP_L2			2
+#define PM8916_MPP_L5			3
+
 #define PM8941_MPP_VPH			0
 #define PM8941_MPP_L1			1
 #define PM8941_MPP_S3			2
--
1.9.1
