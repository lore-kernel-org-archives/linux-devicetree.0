From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 00/10] Support TI Light Management Unit devices
Date: Fri, 14 Feb 2014 15:30:10 +0900
Message-ID: <1392359410-6852-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

TI LMU (Lighting Management Unit) driver supports lighting devices such like
LM3532, LM3631, LM3633, LM3695 and LM3697.

         Enable pin  Backlights  PWM control  Light effects  Others
         ----------  ----------  -----------  -------------  ------
LM3532       Yes         Yes         Yes      ramp up/down
LM3631       Yes         Yes         Yes      slope          5 regulators
LM3633       Yes         Yes         Yes      ramp up/down   LEDs
                                              /pattern
LM3695       Yes         Yes         No
LM3697       Yes         Yes         Yes      ramp up/down

This patch-set consists of several parts below.

  TI LMU                : HW enable pin control. I2C register access
  TI LMU effect         : Light effect support for backlight and LED
  TI LMU backlight      : Backlight subsystem, PWM, control bank assignment
  Each backlight driver : Chip dependent code
  LM3633 LED            : LED subsystem, pattern generation
  LM3631 regulator      : Regulator drivers for the display bias

Device tree documentation is also included.

Milo Kim (10):
  mfd: Add TI LMU driver
  backlight: Add TI LMU backlight common driver
  backlight: ti-lmu-backlight: Add LM3532 driver
  backlight: ti-lmu-backlight: Add LM3631 driver
  backlight: ti-lmu-backlight: Add LM3633 driver
  backlight: ti-lmu-backlight: Add LM3695 driver
  backlight: ti-lmu-backlight: Add LM3697 driver
  leds: Add LM3633 driver
  regulator: Add LM3631 driver
  Documentation: Add device tree bindings for TI LMU devices

 .../devicetree/bindings/leds/leds-lm3633.txt       |   39 ++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  182 ++++++
 .../bindings/regulator/lm3631-regulator.txt        |   49 ++
 .../bindings/video/backlight/ti-lmu-backlight.txt  |  127 ++++
 Documentation/leds/leds-lm3633.txt                 |   38 ++
 drivers/leds/Kconfig                               |   10 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/leds-lm3633.c                         |  661 ++++++++++++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/ti-lmu-effect.c                        |  328 ++++++++++
 drivers/mfd/ti-lmu.c                               |  464 ++++++++++++++
 drivers/regulator/Kconfig                          |    8 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/lm3631-regulator.c               |  285 +++++++++
 drivers/video/backlight/Kconfig                    |   51 ++
 drivers/video/backlight/Makefile                   |    6 +
 drivers/video/backlight/lm3532_bl.c                |  240 +++++++
 drivers/video/backlight/lm3631_bl.c                |  186 ++++++
 drivers/video/backlight/lm3633_bl.c                |  244 ++++++++
 drivers/video/backlight/lm3695_bl.c                |  143 +++++
 drivers/video/backlight/lm3697_bl.c                |  224 +++++++
 drivers/video/backlight/ti-lmu-backlight.c         |  369 +++++++++++
 drivers/video/backlight/ti-lmu-backlight.h         |   78 +++
 include/linux/mfd/ti-lmu-effect.h                  |  109 ++++
 include/linux/mfd/ti-lmu-register.h                |  269 ++++++++
 include/linux/mfd/ti-lmu.h                         |  150 +++++
 27 files changed, 4275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/lm3631-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
 create mode 100644 Documentation/leds/leds-lm3633.txt
 create mode 100644 drivers/leds/leds-lm3633.c
 create mode 100644 drivers/mfd/ti-lmu-effect.c
 create mode 100644 drivers/mfd/ti-lmu.c
 create mode 100644 drivers/regulator/lm3631-regulator.c
 create mode 100644 drivers/video/backlight/lm3532_bl.c
 create mode 100644 drivers/video/backlight/lm3631_bl.c
 create mode 100644 drivers/video/backlight/lm3633_bl.c
 create mode 100644 drivers/video/backlight/lm3695_bl.c
 create mode 100644 drivers/video/backlight/lm3697_bl.c
 create mode 100644 drivers/video/backlight/ti-lmu-backlight.c
 create mode 100644 drivers/video/backlight/ti-lmu-backlight.h
 create mode 100644 include/linux/mfd/ti-lmu-effect.h
 create mode 100644 include/linux/mfd/ti-lmu-register.h
 create mode 100644 include/linux/mfd/ti-lmu.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
