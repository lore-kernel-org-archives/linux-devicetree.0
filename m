From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 0/3] leds: Add control of the voltage/current regulator to the LED core
Date: Wed, 17 Jul 2019 15:59:45 +0200
Message-ID: <20190717135948.19340-1-jjhiblot@ti.com>
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

While at it, throw in a fix for led_set_brightness_sync() so that it can
work with drivers that don't provide brightness_set_blocking()

changes in v3:
- reword device-tree description
- reword commit log
- remove regulator updates from functions used in atomic context. If the
  regulator must be updated, it is defered to a workqueue.
- Fix led_set_brightness_sync() to work with the non-blocking function
  __led_set_brightness()

changes in v2:
- use devm_regulator_get_optional() to avoid using the dummy regulator and
  do some unnecessary work

Jean-Jacques Hiblot (3):
  dt-bindings: leds: document the "power-supply" property
  leds: Add control of the voltage/current regulator to the LED core
  leds: Make led_set_brightness_sync() also use __led_set_brightness()

 .../devicetree/bindings/leds/common.txt       |  4 ++
 drivers/leds/led-class.c                      | 15 ++++++
 drivers/leds/led-core.c                       | 53 +++++++++++++++++--
 drivers/leds/leds.h                           |  1 +
 include/linux/leds.h                          |  4 ++
 5 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.17.1
