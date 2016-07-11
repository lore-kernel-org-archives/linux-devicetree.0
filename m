From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH] pinctrl: stm32f429: driver init call change
Date: Mon, 11 Jul 2016 16:55:19 +0200
Message-ID: <1468248919-6061-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As nothing special is done in driver init then device_initcall() can be
changed in builtin_platform_driver() call.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32f429.c b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
index e9b15dc..a5d50ca 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32f429.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32f429.c
@@ -1583,9 +1583,4 @@ static struct platform_driver stm32f429_pinctrl_driver = {
 		.of_match_table = stm32f429_pctrl_match,
 	},
 };
-
-static int __init stm32f429_pinctrl_init(void)
-{
-	return platform_driver_register(&stm32f429_pinctrl_driver);
-}
-device_initcall(stm32f429_pinctrl_init);
+builtin_platform_driver(stm32f429_pinctrl_driver);
-- 
1.9.1

