From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/3] regulator: max8973: add support to configure ETR from DT
Date: Wed, 1 Jul 2015 18:31:43 +0530
Message-ID: <1435755704-1164-2-git-send-email-ldewangan@nvidia.com>
References: <1435755704-1164-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435755704-1164-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The MAX8973/MAX77621 feature an Enhanced Transient Response(ETR)
circuit that is enabled through software. The enhanced transient
response reduces the voltage droop during large load steps by
temporarily allowing all three phases to fire in unison, slewing
total inductor current faster than would normally be possible if
all three phases continued to operate 120deg out of phase. The
enhanced transient response detector features two selectable
sensitivity settings, which select the output voltage slew rate
during load transients that triggers the ETR circuit. The sensitivity
of the ETR detector is set by the CKADV[1:0] bits in the CONTROL2
register.

Add support to configure the ETR through platform data from DT.
Update the DT binding document accordingly.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/max8973-regulator.txt          |  6 ++++++
 drivers/regulator/max8973-regulator.c                 | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
index 55efb24..f80ea2f 100644
--- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
@@ -25,6 +25,12 @@ Optional properties:
 -maxim,enable-frequency-shift: boolean, enable 9% frequency shift.
 -maxim,enable-bias-control: boolean, enable bias control. By enabling this
 		startup delay can be reduce to 20us from 220us.
+-maxim,enable-etr: boolean, enable Enhanced Transient Response.
+-maxim,enable-high-etr-sensitivity: boolean, Enhanced transient response
+		circuit is enabled and set for high sensitivity. If this
+		property is available then etr will be enable default.
+
+Enhanced transient response (ETR) will affect the configuration of CKADV.
 
 Example:
 
diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index e94ddcf..a8fd7f4 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -421,6 +421,8 @@ static struct max8973_regulator_platform_data *max8973_parse_dt(
 	struct device_node *np = dev->of_node;
 	int ret;
 	u32 pval;
+	bool etr_enable;
+	bool etr_sensitivity_high;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -452,6 +454,23 @@ static struct max8973_regulator_platform_data *max8973_parse_dt(
 	if (of_property_read_bool(np, "maxim,enable-bias-control"))
 		pdata->control_flags  |= MAX8973_CONTROL_BIAS_ENABLE;
 
+	etr_enable = of_property_read_bool(np, "maxim,enable-etr");
+	etr_sensitivity_high = of_property_read_bool(np,
+				"maxim,enable-high-etr-sensitivity");
+	if (etr_sensitivity_high)
+		etr_enable = true;
+
+	if (etr_enable) {
+		if (etr_sensitivity_high)
+			pdata->control_flags |=
+				MAX8973_CONTROL_CLKADV_TRIP_75mV_PER_US;
+		else
+			pdata->control_flags |=
+				MAX8973_CONTROL_CLKADV_TRIP_150mV_PER_US;
+	} else {
+		pdata->control_flags |= MAX8973_CONTROL_CLKADV_TRIP_DISABLED;
+	}
+
 	return pdata;
 }
 
-- 
2.1.4
