From: Sean Cross <xobs@kosagi.com>
Subject: [PATCH] pwm: imx: Add support for low-speed PWM
Date: Mon, 28 Apr 2014 16:55:30 +0800
Message-ID: <1398675331-10980-1-git-send-email-xobs@kosagi.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sean Cross <xobs@kosagi.com>
List-Id: devicetree@vger.kernel.org

The i.MX PWM driver has a selectable clock source.  In order to get very
long period lengths, the driver must select the 32.768 kHz clock.

It's unclear what the threshold should be to switch clocks, so set it
arbitrarily to 100 usecs.

Sean Cross (1):
  pwm: imx: Support very long period lengths

 drivers/pwm/pwm-imx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
1.9.2

