From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5 v2] clk: qcom: Update DT bindings for MSM8660 LCC
Date: Wed, 19 Apr 2017 11:13:25 +0200
Message-ID: <20170419091326.11226-4-linus.walleij@linaro.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170419091326.11226-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the right compatible string and header for the
MSM8660 LCC and some new defines to the dt-bindings header.

Take this opportunity to spell out the acronym LPASS for
Low-power Audio Subsystem.

Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add Rob's ACK.
---
 .../devicetree/bindings/clock/qcom,lcc.txt         |  5 +--
 include/dt-bindings/clock/qcom,lcc-msm8660.h       | 40 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
index a3c78aa88038..4de51df37f1a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
@@ -1,10 +1,11 @@
-Qualcomm LPASS Clock & Reset Controller Binding
-------------------------------------------------
+Qualcomm Low-power Audio Subsystem (LPASS) Clock & Reset Controller Binding
+---------------------------------------------------------------------------
 
 Required properties :
 - compatible : shall contain only one of the following:
 
 			"qcom,lcc-msm8960"
+			"qcom,lcc-msm8660"
 			"qcom,lcc-apq8064"
 			"qcom,lcc-ipq8064"
 			"qcom,lcc-mdm9615"
diff --git a/include/dt-bindings/clock/qcom,lcc-msm8660.h b/include/dt-bindings/clock/qcom,lcc-msm8660.h
new file mode 100644
index 000000000000..7cddcbd6b1ee
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lcc-msm8660.h
@@ -0,0 +1,40 @@
+/*
+ * Copyright (c) 2017 Linus Walleij <linus.walleij@linaro.org>
+ * Qualcomm MSM8660 Low-power Audio Subsystem (LPASS) Clock Controller
+ * devicetree definitions
+ */
+
+#ifndef _DT_BINDINGS_CLK_LCC_MSM8660_H
+#define _DT_BINDINGS_CLK_LCC_MSM8660_H
+
+#define LPA_PLL0			0
+#define MI2S_OSR_SRC			1
+#define MI2S_OSR_CLK			2
+#define MI2S_DIV_CLK			3
+#define MI2S_BIT_DIV_CLK		4
+#define MI2S_BIT_CLK			5
+#define CODEC_I2S_MIC_OSR_SRC		6
+#define CODEC_I2S_MIC_OSR_CLK		7
+#define CODEC_I2S_MIC_DIV_CLK		8
+#define CODEC_I2S_MIC_BIT_DIV_CLK	9
+#define CODEC_I2S_MIC_BIT_CLK		10
+#define SPARE_I2S_MIC_OSR_SRC		11
+#define SPARE_I2S_MIC_OSR_CLK		12
+#define SPARE_I2S_MIC_DIV_CLK		13
+#define SPARE_I2S_MIC_BIT_DIV_CLK	14
+#define SPARE_I2S_MIC_BIT_CLK		15
+#define CODEC_I2S_SPKR_OSR_SRC		16
+#define CODEC_I2S_SPKR_OSR_CLK		17
+#define CODEC_I2S_SPKR_DIV_CLK		18
+#define CODEC_I2S_SPKR_BIT_DIV_CLK	19
+#define CODEC_I2S_SPKR_BIT_CLK		20
+#define SPARE_I2S_SPKR_OSR_SRC		21
+#define SPARE_I2S_SPKR_OSR_CLK		22
+#define SPARE_I2S_SPKR_DIV_CLK		23
+#define SPARE_I2S_SPKR_BIT_DIV_CLK	24
+#define SPARE_I2S_SPKR_BIT_CLK		25
+#define PCM_SRC				26
+#define PCM_CLK_OUT			27
+#define PCM_CLK				28
+
+#endif
-- 
2.9.3

