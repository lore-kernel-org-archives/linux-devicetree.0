Return-Path: <SRS0=8NQX=FO=gmail.com=keepcalm444@kernel.org>
From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 0/2] Panasonic AN30259A support
Date: Tue, 20 Feb 2018 11:54:44 +1100
Message-Id: <20180220005446.8577-1-simon@lineageos.org>
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Simon Shields <simon@lineageos.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

This patch series adds DT bindings (patch #1) and the corresponding driver
(patch #2) for the Panasonic AN30259A 3-channel LED driver. AN30259A
uses an internal clock for controlling brightness/on-off cycles, but also supports
using an external PWM/clock input. This patch series only implements
support for the former.

The AN30259A is connected using I2C, and the datasheet is freely
available[0].

Cheers,
Simon

[0]: https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf

Simon Shields (2):
  dt-bindings: leds: document Panasonic AN30259A bindings
  leds: add Panasonic AN30259A support

 .../devicetree/bindings/leds/leds-an30259a.txt     |  41 +++
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-an30259a.c                       | 338 +++++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.txt
 create mode 100644 drivers/leds/leds-an30259a.c

-- 
2.16.2
