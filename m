From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] pinctrl: palmas: remove pin config BIAS_PULL_PIN_DEFAULT support
Date: Wed, 2 Oct 2013 17:07:12 +0530
Message-ID: <1380713832-24488-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: swarren@nvidia.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Palmas devices do not support the default bias configuration
and hence removing this option from valid pin config parameters.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Based on discussion on the patch
	pinctrl: palmas: do not abort pin configuration for BIAS_DEFAULT
creating this patch to remove this option.

 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt |    2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |    3 ---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
index 734d9b0..caf297b 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
@@ -41,7 +41,7 @@ pinctrl-bindings.txt:
 
 Required: pins
 Options: function, bias-disable, bias-pull-up, bias-pull-down,
-	 bias-pin-default, drive-open-drain.
+	 drive-open-drain.
 
 Note that many of these properties are only valid for certain specific pins.
 See the Palmas device datasheet for complete details regarding which pins
diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 6164381..f13d0e7 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -891,9 +891,6 @@ static int palmas_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		param_val = pinconf_to_config_argument(configs[i]);
 
-		if (param == PIN_CONFIG_BIAS_PULL_PIN_DEFAULT)
-			continue;
-
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 		case PIN_CONFIG_BIAS_PULL_UP:
-- 
1.7.1.1

