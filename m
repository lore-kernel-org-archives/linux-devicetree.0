From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/8] pinctrl: ingenic: Probe driver at subsys_initcall
Date: Tue, 21 Aug 2018 18:42:30 +0200
Message-ID: <20180821164236.21101-3-paul@crapouillou.net>
References: <20180821164236.21101-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821164236.21101-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Using postcore_initcall() makes the driver try to initialize way too
early.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6a1b6058b991..4bceae88d056 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -847,4 +847,4 @@ static int __init ingenic_pinctrl_drv_register(void)
 {
 	return platform_driver_register(&ingenic_pinctrl_driver);
 }
-postcore_initcall(ingenic_pinctrl_drv_register);
+subsys_initcall(ingenic_pinctrl_drv_register);
-- 
2.11.0
