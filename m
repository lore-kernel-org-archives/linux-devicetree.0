From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/2] pwm: Broadcom BCM7xxx PWM support
Date: Thu,  6 Aug 2015 17:55:56 -0700
Message-ID: <1438908959-1578-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch series add PWM support for the Broadcom BCM7xxx
chips which feature one or more PWM controllers capable of
output periods from 148ns to ~622ms using a combination of
variable and fixed frequency settings.

The controller does not support setting a polarity.

This is based on Thierry's pwm/next branch.

Florian Fainelli (2):
  Documentation: dt: add Broadcom BCM7038 PWM controller binding
  pwm: Add Broadcom BCM7038 PWM controller support

 .../devicetree/bindings/pwm/brcm,bcm7038-pwm.txt   |  22 ++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-brcmstb.c                          | 323 +++++++++++++++++++++
 4 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.txt
 create mode 100644 drivers/pwm/pwm-brcmstb.c

-- 
2.1.0
