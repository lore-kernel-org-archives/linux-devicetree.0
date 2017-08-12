From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/2] pwm: bcm2835: Support for polarity setting via DT
Date: Sat, 12 Aug 2017 12:19:42 +0200
Message-ID: <1502533184-15765-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
Sender: linux-pwm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for the third (optional) pwm cell to specify the
polarity.

Changes in V2:
* add ack and review tags

Stefan Wahren (2):
  dt-bindings: pwm-bcm2835: Increase pwm-cells
  pwm: bcm2835: Support for polarity setting via DT

 Documentation/devicetree/bindings/pwm/pwm-bcm2835.txt | 4 ++--
 drivers/pwm/pwm-bcm2835.c                             | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.7.4
