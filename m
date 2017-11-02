From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states during low-power
Date: Thu,  2 Nov 2017 16:15:51 -0700
Message-ID: <20171102231551.16220-3-f.fainelli@gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102231551.16220-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, ckeepax@opensource.cirrus.com, tony@atomide.com, ckeepax@opensource.wolfsonmicro.com, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com
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
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 4 ++++
 drivers/pinctrl/core.c                                         | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index ad9bbbba36e9..cc9bae3b7c33 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -103,6 +103,10 @@ Optional properties:
 #pinctrl-cells:	Number of pin control cells in addition to the index within the
 		pin controller device instance
 
+low-power-state-loss: boolean property which indicates that the pins lose their
+state during low power modes and therefore need to be restored upon system
+resumption.
+
 Pin controller devices should contain the pin configuration nodes that client
 devices reference.
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c91359d48aa1..3fee457999b5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1978,6 +1978,9 @@ pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
 	pctldev->dev = dev;
 	mutex_init(&pctldev->mutex);
 
+	if (of_property_read_bool(dev->of_node, "low-power-state-loss"))
+		pctldev->flags |= PINCTRL_FLG_FORCE_STATE;
+
 	/* check core ops for sanity */
 	ret = pinctrl_check_ops(pctldev);
 	if (ret) {
-- 
2.9.3
