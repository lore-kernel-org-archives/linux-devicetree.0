From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 00/16] Support TI LMU devices
Date: Mon, 2 Nov 2015 14:32:43 +0900
Message-ID: <5636F57B.7020903@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446440483-6948-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

My apologies for sending without no-chain-reply-to option.
So, I've resent the patch-set named 'PATCH RESEND 00/16 .. 16/16'.

Best regards,
Milo

On 11/2/2015 2:01 PM, Milo Kim wrote:
> TI LMU(Lighting Management Unit) driver supports lighting devices below.
>
>           Enable pin  Backlights  HWMON  LEDs   Regulators
>           ----------  ----------  -----  ----  ------------
> LM3532       o           o         x     x        x
> LM3631       o           o         x     x    5 regulators
> LM3632       o           o         x     x    3 regulators
> LM3633       o           o         o     o        x
> LM3695       o           o         x     x        x
> LM3697       o           o         o     x        x
>
> This patch-set consists of several parts below.
>
>    DT bindings           : Binding information for each module
>    TI LMU MFD            : Device registration, HW enable pin control and
>                            I2C register access
>    TI LMU backlight      : Common driver for TI LMU backlight devices
>    Each backlight driver : Chip dependent code
>    HWMON                 : LMU hardware fault monitoring driver
>    LM3633 LED            : LED subsystem and dimming pattern generation
>                            supported
>    LM363X regulator      : LM3631 and LM3632 regulator driver for the
>                            display bias
>
> Git location:
>    Please refer to the location below. Branch name is 'ti-lmu'.
>    git clone -b ti-lmu https://github.com/milokim/linux.git
>
> Milo Kim (16):
>    Documentation: dt-bindings: mfd: add TI LMU device binding information
>    Documentation: dt-bindings: backlight: add TI LMU backlight binding
>      information
>    Documentation: dt-bindings: hwmon: add TI LMU HWMON binding
>      information
>    Documentation: dt-bindings: leds: add LM3633 LED binding information
>    Documentation: dt-bindings: regulator: add LM363x regulator binding
>      information
>    mfd: add TI LMU driver
>    backlight: add TI LMU backlight common driver
>    backlight: ti-lmu-backlight: add LM3532 driver
>    backlight: ti-lmu-backlight: add LM3631 driver
>    backlight: ti-lmu-backlight: add LM3632 driver
>    backlight: ti-lmu-backlight: add LM3633 driver
>    backlight: ti-lmu-backlight: add LM3695 driver
>    backlight: ti-lmu-backlight: add LM3697 driver
>    hwmon: add TI LMU hardware fault monitoring driver
>    leds: add LM3633 driver
>    regulator: add LM363X driver
>
>   Documentation/ABI/testing/sysfs-class-led-lm3633   |  60 ++
>   .../devicetree/bindings/hwmon/ti-lmu-hwmon.txt     |  12 +
>   .../devicetree/bindings/leds/leds-lm3633.txt       |  28 +
>   Documentation/devicetree/bindings/mfd/ti-lmu.txt   | 282 ++++++++
>   .../bindings/regulator/lm363x-regulator.txt        |  28 +
>   .../bindings/video/backlight/ti-lmu-backlight.txt  |  67 ++
>   drivers/hwmon/Kconfig                              |  10 +
>   drivers/hwmon/Makefile                             |   1 +
>   drivers/hwmon/ti-lmu-hwmon.c                       | 393 +++++++++++
>   drivers/leds/Kconfig                               |  10 +
>   drivers/leds/Makefile                              |   1 +
>   drivers/leds/leds-lm3633.c                         | 749 +++++++++++++++++++++
>   drivers/mfd/Kconfig                                |  12 +
>   drivers/mfd/Makefile                               |   1 +
>   drivers/mfd/ti-lmu.c                               | 324 +++++++++
>   drivers/regulator/Kconfig                          |   9 +
>   drivers/regulator/Makefile                         |   1 +
>   drivers/regulator/lm363x-regulator.c               | 349 ++++++++++
>   drivers/video/backlight/Kconfig                    |  62 ++
>   drivers/video/backlight/Makefile                   |   7 +
>   drivers/video/backlight/lm3532_bl.c                | 183 +++++
>   drivers/video/backlight/lm3631_bl.c                | 129 ++++
>   drivers/video/backlight/lm3632_bl.c                | 125 ++++
>   drivers/video/backlight/lm3633_bl.c                | 210 ++++++
>   drivers/video/backlight/lm3695_bl.c                |  91 +++
>   drivers/video/backlight/lm3697_bl.c                | 187 +++++
>   drivers/video/backlight/ti-lmu-backlight.c         | 429 ++++++++++++
>   drivers/video/backlight/ti-lmu-backlight.h         | 152 +++++
>   include/linux/mfd/ti-lmu-register.h                | 277 ++++++++
>   include/linux/mfd/ti-lmu.h                         |  81 +++
>   30 files changed, 4270 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-lm3633
>   create mode 100644 Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
>   create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt
>   create mode 100644 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
>   create mode 100644 Documentation/devicetree/bindings/video/backlight/ti-lmu-backlight.txt
>   create mode 100644 drivers/hwmon/ti-lmu-hwmon.c
>   create mode 100644 drivers/leds/leds-lm3633.c
>   create mode 100644 drivers/mfd/ti-lmu.c
>   create mode 100644 drivers/regulator/lm363x-regulator.c
>   create mode 100644 drivers/video/backlight/lm3532_bl.c
>   create mode 100644 drivers/video/backlight/lm3631_bl.c
>   create mode 100644 drivers/video/backlight/lm3632_bl.c
>   create mode 100644 drivers/video/backlight/lm3633_bl.c
>   create mode 100644 drivers/video/backlight/lm3695_bl.c
>   create mode 100644 drivers/video/backlight/lm3697_bl.c
>   create mode 100644 drivers/video/backlight/ti-lmu-backlight.c
>   create mode 100644 drivers/video/backlight/ti-lmu-backlight.h
>   create mode 100644 include/linux/mfd/ti-lmu-register.h
>   create mode 100644 include/linux/mfd/ti-lmu.h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
