From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v2 0/2] leds: Add control of the voltage/current regulator to the LED core
Date: Mon, 15 Jul 2019 17:56:55 +0200
Message-ID: <20190715155657.22976-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: devicetree@vger.kernel.org

This series makes it possible for the LED core to manage the power supply
of a LED. It uses the regulator API to disable/enable the power if when the
LED is turned on/off.
This is especially useful in situations where the LED driver/controller is
not supplying the power.

changes in v2:
- use devm_regulator_get_optional() to avoid using the dummy regulator and do
  some unnecessary work

Jean-Jacques Hiblot (2):
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core

 .../devicetree/bindings/leds/common.txt       |  6 +++
 drivers/leds/led-class.c                      | 15 ++++++
 drivers/leds/led-core.c                       | 50 +++++++++++++++++--
 drivers/leds/leds.h                           |  1 +
 include/linux/leds.h                          |  4 ++
 5 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.17.1
