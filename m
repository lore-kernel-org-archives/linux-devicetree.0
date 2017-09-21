From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/2] pinctrl: single: Allow indicating loss of pin states during low-power
Date: Wed, 20 Sep 2017 18:04:21 -0700
Message-ID: <20170921010421.7467-3-f.fainelli@gmail.com>
References: <20170921010421.7467-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921010421.7467-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Some platforms (e.g: Broadcom STB: BMIPS_GENERIC/ARCH_BRCMSTB) will lose
their register contents when entering their lower power state. In such a
case, the pinctrl-single driver that is used will not be able to restore
the power states without telling the core about it and having
pinctrl_select_state() check for that.

This patch adds a new optional boolean property that Device Tree can
define in order to obtain exactly that and having the core pinctrl code
take that into account.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt | 4 ++++
 drivers/pinctrl/pinctrl-single.c                             | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index e705acd3612c..e71967f6a1a7 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -82,6 +82,10 @@ Optional properties:
 		/* pin base, nr pins & gpio function */
 		pinctrl-single,gpio-range = <&range 0 3 0 &range 3 9 1>;
 
+- pinctrl-single,low-power-state-loss : indicates that the pins lose their
+  state during low power modes and therefore need to be restored upon
+  system resumption.
+
 - interrupt-controller : standard interrupt controller binding if using
   interrupts for wake-up events for example. In this case pinctrl-single
   is set up as a chained interrupt controller and the wake-up interrupts
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index b8b3d932cd73..d69d20b8247a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1749,6 +1749,9 @@ static int pcs_probe(struct platform_device *pdev)
 		goto free;
 	}
 
+	if (of_property_read_bool(np, "pinctrl-single,low-power-state-loss"))
+		pcs->pctl->flags |= PINCTRL_FLG_FORCE_STATE;
+
 	ret = pcs_add_gpio_func(np, pcs);
 	if (ret < 0)
 		goto free;
-- 
2.14.1
