Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 6/6] input: pm8941-pwrkey: Add resin entry
Date: Wed, 27 Jun 2018 17:23:01 +0530
Message-Id: <20180627115301.21330-7-vkoul@kernel.org>
In-Reply-To: <20180627115301.21330-1-vkoul@kernel.org>
References: <20180627115301.21330-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Since handling is abstracted in this driver, we need to add resin entry
in id table along with pwrkey_data.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/input/misc/pm8941-pwrkey.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 2047e34c0982..6547a57f5222 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -29,6 +29,7 @@
 
 #define PON_RT_STS			0x10
 #define  PON_KPDPWR_N_SET		BIT(0)
+#define  PON_RESIN_N_SET		BIT(1)
 
 #define PON_PS_HOLD_RST_CTL		0x5a
 #define PON_PS_HOLD_RST_CTL2		0x5b
@@ -39,6 +40,7 @@
 
 #define PON_PULL_CTL			0x70
 #define  PON_KPDPWR_PULL_UP		BIT(1)
+#define  PON_RESIN_PULL_UP		BIT(0)
 
 #define PON_DBC_CTL			0x71
 #define  PON_DBC_DELAY_MASK		0x7
@@ -306,8 +308,14 @@ static const struct pm8941_data pwrkey_data = {
 	.status_bit = PON_KPDPWR_N_SET,
 };
 
+static const struct pm8941_data resin_data = {
+	.pull_up_bit = PON_RESIN_PULL_UP,
+	.status_bit = PON_RESIN_N_SET,
+};
+
 static const struct of_device_id pm8941_pwr_key_id_table[] = {
 	{ .compatible = "qcom,pm8941-pwrkey", .data = &pwrkey_data },
+	{ .compatible = "qcom,pm8941-resin", .data = &resin_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
-- 
2.14.4
