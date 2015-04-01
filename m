From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 2/5] regulator: Introduce property to flag drms
Date: Wed, 1 Apr 2015 15:55:43 -0700
Message-ID: <1427928946-31291-3-git-send-email-bjorn.andersson@sonymobile.com>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce "regulator-allow-drms" to make it possible for board
configuration to enable drms for regulators.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 1 +
 drivers/regulator/of_regulator.c                          | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index abb26b5..a2377cb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -10,6 +10,7 @@ Optional properties:
 - regulator-always-on: boolean, regulator should never be disabled
 - regulator-boot-on: bootloader/firmware enabled regulator
 - regulator-allow-bypass: allow the regulator to go into bypass mode
+- regulator-allow-drms: allow dynamic regulator mode switching
 - <name>-supply: phandle to the parent supply/regulator node
 - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
   For hardware which supports disabling ramp rate, it should be explicitly
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 24e812c..bb52532 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -70,6 +70,9 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (of_property_read_bool(np, "regulator-allow-bypass"))
 		constraints->valid_ops_mask |= REGULATOR_CHANGE_BYPASS;
 
+	if (of_property_read_bool(np, "regulator-allow-drms"))
+		constraints->valid_ops_mask |= REGULATOR_CHANGE_DRMS;
+
 	ret = of_property_read_u32(np, "regulator-ramp-delay", &pval);
 	if (!ret) {
 		if (pval)
-- 
1.8.2.2
