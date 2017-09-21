From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/2] pinctrl: Allow indicating loss of state across suspend/resume
Date: Wed, 20 Sep 2017 18:04:19 -0700
Message-ID: <20170921010421.7467-1-f.fainelli@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, swarren@nvidia.com, andy.shevchenko@gmail.com, alcooperx@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>
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

Thanks!

Florian Fainelli (2):
  pinctrl: Allow a device to indicate when to force a state
  pinctrl: single: Allow indicating loss of pin states during low-power

 .../devicetree/bindings/pinctrl/pinctrl-single.txt        |  4 ++++
 drivers/pinctrl/core.c                                    | 15 +++++++++++++++
 drivers/pinctrl/core.h                                    |  4 ++++
 drivers/pinctrl/pinctrl-single.c                          |  3 +++
 4 files changed, 26 insertions(+)

-- 
2.14.1

