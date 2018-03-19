Return-Path: <SRS0=ayJo=GJ=gmail.com=keepcalm444@kernel.org>
From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v3 0/2] Panasonic AN30259A support
Date: Tue, 20 Mar 2018 00:59:35 +1100
Message-Id: <20180319135937.18772-1-simon@lineageos.org>
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Shields <simon@lineageos.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

This patch series adds DT bindings (patch #1) and the corresponding driver
(patch #2) for the Panasonic AN30259A 3-channel LED driver. AN30259A
uses an internal clock for controlling brightness/on-off cycles, but
also supports using an external PWM/clock input. This patch series only
implements support for the former.

The AN30259A is connected using I2C, and the datasheet is freely
available[0].

Changes since v2:
* Drop "an30259a:" prefix from bindings and add it in the device driver
 instead.
* Use led-controller instead of leds for sample DT binding.
* Use ":indicator" instead of ":notification" in sample DT binding.
* Merge an30259a_led_set and an30259a_brightness to
 an30259a_brightness_set (and same for blink functions).
* Explain the range limitations of the AN30259A's sloping mode
 in the code - the AN30259A only has a 7-bit PWM range in slope mode,
 and the bottom 3 bits are always set.

Changes since v1:
* Documentation formatting/grammar fixes.
* Use reg property instead of led-sources for leds.
* Add default-state support.
* Fix auto-probing when built as a module.
* Simplified DT parsing code.
* Use devm version of led_class_register().
* Fix LED naming scheme.
* Fixed checkpatch --strict issues.

I've kept Rob's Reviewed-By and Pavel's ack on the DT patch since
the changes to the binding are minor and inline with other LED
DT binding documentation.

Cheers,
Simon

[0]: https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf

Simon Shields (2):
  dt-bindings: leds: document Panasonic AN30259A bindings
  leds: add Panasonic AN30259A support

 .../devicetree/bindings/leds/leds-an30259a.txt     |  43 +++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-an30259a.c                       | 391 +++++++++++++++++++++
 4 files changed, 446 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
 create mode 100644 drivers/leds/leds-an30259a.c

-- 
2.16.2
