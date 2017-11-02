From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: Allow indicating loss of state across suspend/resume
Date: Thu,  2 Nov 2017 16:15:49 -0700
Message-ID: <20171102231551.16220-1-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, ckeepax@opensource.cirrus.com, tony@atomide.com, ckeepax@opensource.wolfsonmicro.com, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hello Linus,

It's me again, so I have been thinking about the problem originally
reported in: [PATCH fixes v3] pinctrl: Really force states during suspend/resume

and other similar patches a while ago, and this new version allows a platform
using pinctrl-single to specify whether its pins are going to lose their state
during a system deep sleep.

Note that this is still checked at the pinctrl_select_state() because consumers
of the pinctrl API might be calling this from their suspend/resume functions
and should not have to know whether the provider does lose its pin states.

This is against your pinctrl/for-next branch.

Thanks!

Changes in v2:

- make the property generic and not specific to pinctrl-single

Florian Fainelli (2):
  pinctrl: Allow a device to indicate when to force a state
  pinctrl: Allow indicating loss of pin states during low-power

 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt    |  4 ++++
 drivers/pinctrl/core.c                                  | 17 ++++++++++++++++-
 drivers/pinctrl/core.h                                  |  4 ++++
 3 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.9.3

