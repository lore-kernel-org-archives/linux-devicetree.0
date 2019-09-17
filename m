From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/5] DA9062 PMIC fixes and features
Date: Tue, 17 Sep 2019 14:42:41 +0200
Message-ID: <20190917124246.11732-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, stwiss.opensource@diasemi.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

the main purpose of this serie is to add the voltage selection support
upon a given gpio input signal and to dis-/enable a regulator upon a
gpio input signal.

This series depends on [1].

[1] https://patchwork.ozlabs.org/project/linux-gpio/list/?series=131029

Regards,
  Marco

Marco Felsch (5):
  regulator: da9062: fix suspend_enable/disable preparation
  dt-bindings: mfd: da9062: add regulator voltage selection
    documentation
  regulator: da9062: add voltage selection gpio support
  dt-bindings: mfd: da9062: add regulator gpio enable/disable
    documentation
  regulator: da9062: add gpio based regulator dis-/enable support

 .../devicetree/bindings/mfd/da9062.txt        |  16 +
 drivers/regulator/da9062-regulator.c          | 347 ++++++++++++++----
 2 files changed, 292 insertions(+), 71 deletions(-)

-- 
2.20.1
