Return-Path: <SRS0=PKUA=7Y=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170822150330.00007eeb@huawei.com>
References: <1503383171-15515-1-git-send-email-s.abhisit@gmail.com> <20170822150330.00007eeb@huawei.com>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Tue, 22 Aug 2017 21:30:19 +0700
Message-ID: <CAMV_pUZm2My0CpAr0o6qZTP0A6DLn+LXTvte_8+m=h4Uu6DE4A@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add support for TI LMP92001
Content-Type: multipart/alternative; boundary="001a114b24d45a1d370557586f10"
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lee Jones <lee.jones@linaro.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, robh@kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a114b24d45a1d370557586f10
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan - Thank you for your review, I will clean up and submit again.

On Tue, Aug 22, 2017 at 9:03 PM, Jonathan Cameron <
Jonathan.Cameron@huawei.com> wrote:

> On Tue, 22 Aug 2017 13:26:11 +0700
> <s.abhisit@gmail.com> wrote:
>
> > From: Abhisit Sangjan <s.abhisit@gmail.com>
> >
> > TI LMP92001 Analog System Monitor and Controller
> >
> > 8-bit GPIOs.
> > 12 DACs with 12-bit resolution.
> > The GPIOs and DACs are shared port function with Cy function pin to
> > take control the pin suddenly from external hardware.
> > DAC's referance voltage selectable for Internal/External.
> >
> > 16 + 1 ADCs with 12-bit resolution.
> > Built-in internal Temperature Sensor on channel 17.
> > Windows Comparator Function is supported on channel 1-3 and 9-11 for
> > monitoring with interrupt signal (pending to implement for interrupt).
> > ADC's referance voltage selectable for Internal/External.
> >
> > Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
>
> As Lee said, break this up.  I've done a quick read through but much easier
> to parse in smaller parts!
>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-lmp920001  |  92 ++++
> >  .../devicetree/bindings/gpio/gpio-lmp92001.txt     |  22 +
> >  .../bindings/iio/adc/ti-lmp92001-adc.txt           |  21 +
> >  .../bindings/iio/dac/ti-lmp92001-dac.txt           |  35 ++
> >  drivers/gpio/Kconfig                               |   7 +
> >  drivers/gpio/Makefile                              |   1 +
> >  drivers/gpio/gpio-lmp92001.c                       | 209 +++++++++
> >  drivers/iio/adc/Kconfig                            |  10 +
> >  drivers/iio/adc/Makefile                           |   1 +
> >  drivers/iio/adc/lmp92001-adc.c                     | 500
> +++++++++++++++++++++
> >  drivers/iio/dac/Kconfig                            |   9 +
> >  drivers/iio/dac/Makefile                           |   1 +
> >  drivers/iio/dac/lmp92001-dac.c                     | 390
> ++++++++++++++++
> >  drivers/mfd/Kconfig                                |  12 +
> >  drivers/mfd/Makefile                               |   4 +
> >  drivers/mfd/lmp92001-core.c                        | 308 +++++++++++++
> >  drivers/mfd/lmp92001-debug.c                       |  67 +++
> >  drivers/mfd/lmp92001-i2c.c                         | 215 +++++++++
> >  include/linux/mfd/lmp92001/core.h                  | 119 +++++
> >  include/linux/mfd/lmp92001/debug.h                 |  28 ++
> >  20 files changed, 2051 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lmp920001
> >  create mode 100644 Documentation/devicetree/
> bindings/gpio/gpio-lmp92001.txt
> >  create mode 100644 Documentation/devicetree/
> bindings/iio/adc/ti-lmp92001-adc.txt
> >  create mode 100644 Documentation/devicetree/
> bindings/iio/dac/ti-lmp92001-dac.txt
> >  create mode 100644 drivers/gpio/gpio-lmp92001.c
> >  create mode 100644 drivers/iio/adc/lmp92001-adc.c
> >  create mode 100644 drivers/iio/dac/lmp92001-dac.c
> >  create mode 100644 drivers/mfd/lmp92001-core.c
> >  create mode 100644 drivers/mfd/lmp92001-debug.c
> >  create mode 100644 drivers/mfd/lmp92001-i2c.c
> >  create mode 100644 include/linux/mfd/lmp92001/core.h
> >  create mode 100644 include/linux/mfd/lmp92001/debug.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
> b/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
> > new file mode 100644
> > index 0000000..bd4e733
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-lmp920001
> > @@ -0,0 +1,92 @@
> > +What:           /sys/bus/iio/devices/iio:deviceX/gang
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             Controls the association of analog output channels OUTx
> with
> > +             asynchronous control inputs Cy for DAC.
> > +                Can be either:
> > +                - "0"
> > +                - "1"
> > +
> > +                     Cy to OUTx Assignment
> > +             ----------------------------------
> > +             | Cy | CDAC:GANG=0 | CDAC:GANG=1 |
> > +             ----------------------------------
> > +             | C1 | OUT[1:4]    | OUT[1:3]    |
> > +             ----------------------------------
> > +             | C2 | OUT[5:6]    | OUT[4:6]    |
> > +             ----------------------------------
> > +             | C3 | OUT[7:8]    | OUT[7:9]    |
> > +             ----------------------------------
> > +             | C4 | OUT[9:12]   | OUT[10:12]  |
> > +             ----------------------------------
>
> Hmm. I'll want to think about this one.  It probably wants a more
> descriptive name.
> > +
> > +What:           /sys/bus/iio/devices/iio:deviceX/outx
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             The pin output mode for DAC.
> > +                Can be either:
> > +                - "hiz" = High impedance state.
> > +                - "dac" = DAC output.
> > +             - "0" = Drive it to low.
> > +             - "1" = Drive it to high.
> Look at the existing ABI for powerdown modes.  Covers this.
>
> > +
> > +What:           /sys/bus/iio/devices/iio:deviceX/vref
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is voltage referance source for DACs.
> > +                Can be either:
> > +                - "external"
> > +                - "internal"
>
> Normal assumption is that if an external reference is provided by
> the hardware (specified in DT of similar) then we want to use it,
> if not fall back to internal.
>
> i.e. I don't think we have ever exposed this to userspace.
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX.
> aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/en
>
> Why the insanely long path rather than
> /sys/bus/iio/device/iio:deviceX/en ?
>
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is ADC Conversion Enable for each channel.
> > +                Can be either:
> > +                - "enable"
> > +                - "disable"
>
> Current form isn't per channel. Should be covered by buffered mode
> scan_elements or the driver should be able to figure it out based
> on what channel is being read.  Would not expect to see individual
> channel enables for an ADC.
>
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX.
> aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/mode
>
> Again, short path please.
>
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is conversion mode for all of ADCs.
> > +                Can be either:
> > +                - "continuous" = Continuously conversion all the time.
> > +                - "single-shot" = Once time conversion and stop.
>
> Which of these makes sense is usually possible to figure out from the way
> the
> driver is being used.  This isn't something we want userspace to have to
> specify.
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX.
> aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:deviceX/vref
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is voltage referance source for ADCs.
> > +                Can be either:
> > +                - "external"
> > +                - "internal"
>
> Again, tends to be a hardware platform defined thing rather than
> something it makes sense to expose to userspace.
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX.
> aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:
> deviceX/events/in_voltageX_thresh_{falling|rising}_en
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is ADC's Windows Comparator Function enable for
> falling and rising.
> > +             Supported channels are 1-3 and 9-11.
>
> This is standard ABI - you don't need to document it.
>
> > +
> > +What:           /sys/devices/socX/soc/XXXXXXX.
> aips-bus/XXXXXXX.i2c/i2c-X/X-00XX/lmp92001-adc.X.auto/iio:
> deviceX/events/in_voltageX_thresh_{falling|rising}_value
> > +Date:                August 2016
> > +KernelVersion:  4.1.15
> > +Contact:        Abhisit Sangjan <s.abhisit@gmail.com>
> > +Description:
> > +             This is ADC's Windows Comparator Function value for
> falling and rising.
> > +             Supported channels are 1-3 and 9-11.
> > +             The possible range is 0 - 2047.
>
> Standard ABI again, no need to document here.
>
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > new file mode 100644
> > index 0000000..c68784e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > @@ -0,0 +1,22 @@
> > +* Texas Instruments' LMP92001 GPIOs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-gpio".
> > + - reg: i2c chip address for the device.
> > + - gpio-controller: Marks the device node as a gpio controller.
> > + - #gpio-cells : Should be two.  The first cell is the pin number and
> the
> > +  second cell is used to specify the gpio polarity:
> > +        0 = Active high
> > +        1 = Active low
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001_gpio: lmp92001-gpio {
> > +                compatible = "ti,lmp92001-gpio";
> > +                gpio-controller;
> > +                #gpio-cells = <2>;
> > +        };
> > +};
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > new file mode 100644
> > index 0000000..34d7809
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > @@ -0,0 +1,21 @@
> > +* Texas Instruments' LMP92001 ADCs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-adc".
> > + - reg: i2c chip address for the device.
> > + - ti,lmp92001-adc-mode: adc operation, either continuous or
> single-shot.
> > + - ti,lmp92001-adc-mask: bit mask for which channel is enable.
> > +        0 = Off
> > +        1 = On
>
> There is a standard IIO syntax for defining which channels are enabled.
> Take a look at other bindings.
>
> There is often some extra stuff to be specified for each channel so a mask
> isn't sufficient.  Hence we use a child node to specify each channel.
>
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-adc {
> > +                compatible = "ti,lmp92001-adc";
> > +                ti,lmp92001-adc-mode = "continuous";
> > +                ti,lmp92001-adc-mask = <0x00000079>;
>
> Would definitely expect to see an external reference specified here..
>
> > +        };
> > +};
> > \ No newline at end of file
>
> Add one please.
>
> > diff --git a/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > new file mode 100644
> > index 0000000..882db9c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > @@ -0,0 +1,35 @@
> > +* Texas Instruments' LMP92001 DACs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-dac".
> > + - reg: i2c chip address for the device.
> > + - ti,lmp92001-dac-hiz: hi-impedance control,
> > +        1 = Forces all OUT[1:12] outputs to hi-z, 0 = normal
>
> Leave control of this to userspace unless it is a feature controlled
> by the associated circuitry.
>
> > + - ti,lmp92001-dac-outx:
> > +        Cy = 0, 1 = will force associated OUTx outputs to VDD
> > +        Cy = 0, 0 = will force associated OUTx outputs to GND
> > + - ti,lmp92001-dac-gang: What group of Cy is governed to.
> > +        -----------------------------------------
> > +        |  Cy   | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +        -----------------------------------------
> > +        |  C1   |   OUT[1:4]    |    OUT[1:3]   |
> > +        -----------------------------------------
> > +        |  C2   |   OUT[5:6]    |    OUT[4:6]   |
> > +        -----------------------------------------
> > +        |  C3   |   OUT[7:8]    |    OUT[7:9]   |
> > +        -----------------------------------------
> > +        |  C4   |   OUT[9:12]   |    OUT[10:12] |
> > +        -----------------------------------------
>
> If this is here, then why are we exposing it to userspace?
> Either this is a feature of the hardware or it's not...
>
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-dac {
> > +                compatible = "ti,lmp92001-dac";
> > +                ti,lmp92001-dac-hiz  = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-outx = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-gang = /bits/ 8 <0>;
> > +        };
> > +};
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 461d6fc..5962ea0 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -948,6 +948,13 @@ config GPIO_KEMPLD
> >         This driver can also be built as a module. If so, the module
> will be
> >         called gpio-kempld.
> >
> > +config GPIO_LMP92001
> > +       tristate "LMP92001 GPIOs"
> > +       depends on MFD_LMP92001
> > +       help
> > +         Say yes here to access the GPIO signals of TI LMP92001 Analog
> System
> > +         Monitor and Controller.
> > +
> >  config GPIO_LP3943
> >       tristate "TI/National Semiconductor LP3943 GPIO expander"
> >       depends on MFD_LP3943
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index a9fda6c..560d59c 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL) += gpio-janz-ttl.o
> >  obj-$(CONFIG_GPIO_KEMPLD)    += gpio-kempld.o
> >  obj-$(CONFIG_ARCH_KS8695)    += gpio-ks8695.o
> >  obj-$(CONFIG_GPIO_INTEL_MID) += gpio-intel-mid.o
> > +obj-$(CONFIG_GPIO_LMP92001)  += gpio-lmp92001.o
> >  obj-$(CONFIG_GPIO_LOONGSON)  += gpio-loongson.o
> >  obj-$(CONFIG_GPIO_LP3943)    += gpio-lp3943.o
> >  obj-$(CONFIG_GPIO_LPC18XX)   += gpio-lpc18xx.o
> > diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001.c
> > new file mode 100644
> > index 0000000..b80ba4e
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-lmp92001.c
> > @@ -0,0 +1,209 @@
> > +/*
> > + * gpio-lmp92001.c - Support for TI LMP92001 GPIOs
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
>
> Drop this blank line.
>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +#define SGEN_GPI     (1 << 0) /* 1 - if any bit in SGPI is set. */
> > +
> > +struct lmp92001_gpio {
> > +     struct lmp92001 *lmp92001;
> > +     struct gpio_chip gpio_chip;
> > +};
> > +
> > +static int lmp92001_gpio_get_direction(struct gpio_chip *chip,
> unsigned offset)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +     unsigned int val;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return (val >> offset) & BIT(0);
>
> return !!(val & BIT(offset))?
>
> > +}
> > +
> > +static int lmp92001_gpio_direction_in(struct gpio_chip *chip, unsigned
> offset)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +
> > +     return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
> BIT(offset),
> > +                                     BIT(offset));
> > +}
> > +
> > +static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +     unsigned int val, sgen;
> > +
> > +     /*
> > +      * Does the GPIO input mode?
> > +      * Does the GPIO was set?
> > +      * Reading indicated logic level.
> > +      * Clear indicated logic level.
> > +      */
> > +     regmap_read(lmp92001->regmap, LMP92001_CGPO, &val);
> > +     if ((val >> offset) & BIT(0)) {
> > +             regmap_read(lmp92001->regmap, LMP92001_SGEN, &sgen);
> > +             if (sgen & SGEN_GPI) {
> > +                     regmap_read(lmp92001->regmap, LMP92001_SGPI, &val);
> > +                     regmap_update_bits(lmp92001->regmap,
> LMP92001_CGPO,
> > +                                             0xFF, val);
> > +             }
> > +     }
> > +
> > +     return !!(val & BIT(offset));
>
> Consistency!
>
> > +}
> > +
> > +static int lmp92001_gpio_direction_out(struct gpio_chip *chip,
> unsigned offset,
> > +     int value)
>
> Fix indenting of parameters to align please.
>
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +
> > +     return regmap_update_bits(lmp92001->regmap, LMP92001_CGPO,
> BIT(offset),
> > +                                     0 << offset);
>
> shifting 0 does seem a little odd.
>
> > +}
> > +
> > +static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset,
> > +     int value)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +
> > +     regmap_update_bits(lmp92001->regmap, LMP92001_CGPO, BIT(offset),
> > +                             value << offset);
> > +}
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_chip
> *chip)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = gpiochip_get_data(chip);
> > +     struct lmp92001 *lmp92001 = lmp92001_gpio->lmp92001;
> > +     int i, gpio;
> > +     unsigned int cgpo;
> > +     const char *label, *dir, *logic;
> > +
> > +     for (i = 0; i < chip->ngpio; i++) {
> > +             gpio = i + chip->base;
> > +
> > +             label = gpiochip_is_requested(chip, i);
> > +             if (!label)
> > +                     continue;
> > +
> > +             regmap_read(lmp92001->regmap, LMP92001_CGPO, &cgpo);
> > +             if ((cgpo>>i) & BIT(0))
> > +                     dir = "in";
> > +             else
> > +                     dir = "out";
> > +
> > +             if (lmp92001_gpio_get(chip, i))
> > +                     logic = "hi";
> > +             else
> > +                     logic = "lo";
> > +
> > +             seq_printf(s, " gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n",
> > +                             gpio, label, dir, logic);
> > +     }
> > +}
> > +#else
> > +#define lmp92001_gpio_dbg_show NULL
> > +#endif
> > +
> > +static struct gpio_chip lmp92001_gpio_chip = {
> > +     .label                  = "lmp92001",
> > +     .owner                  = THIS_MODULE,
> > +     .get_direction          = lmp92001_gpio_get_direction,
> > +     .direction_input        = lmp92001_gpio_direction_in,
> > +     .get                    = lmp92001_gpio_get,
> > +     .direction_output       = lmp92001_gpio_direction_out,
> > +     .set                    = lmp92001_gpio_set,
> > +     .dbg_show               = lmp92001_gpio_dbg_show,
> > +};
> > +
> > +static int lmp92001_gpio_probe(struct platform_device *pdev)
> > +{
> > +     struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
> > +     struct lmp92001_gpio *lmp92001_gpio;
> > +     int ret;
> > +
> > +     lmp92001_gpio = devm_kzalloc(&pdev->dev, sizeof(*lmp92001_gpio),
> > +                                     GFP_KERNEL);
> > +     if (!lmp92001_gpio)
> > +             return -ENOMEM;
> > +
> > +     lmp92001_gpio->lmp92001 = lmp92001;
> > +     lmp92001_gpio->gpio_chip = lmp92001_gpio_chip;
> > +     lmp92001_gpio->gpio_chip.ngpio = 8;
> > +     lmp92001_gpio->gpio_chip.parent = &pdev->dev;
> > +     lmp92001_gpio->gpio_chip.base = -1;
> > +
> > +     ret = devm_gpiochip_add_data(&pdev->dev,
> &lmp92001_gpio->gpio_chip,
> > +                                     lmp92001_gpio);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "could not register gpiochip, %d\n",
> ret);
> > +             return ret;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, lmp92001_gpio);
> > +
> > +     return ret;
> > +}
> > +
> > +static int lmp92001_gpio_remove(struct platform_device *pdev)
> > +{
> > +     struct lmp92001_gpio *lmp92001_gpio = platform_get_drvdata(pdev);
> > +
> > +     devm_gpiochip_remove(&pdev->dev, &lmp92001_gpio->gpio_chip);
>
> Look up what devm is all about please.  This is not needed - nor is the
> remove at all...
>
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_gpio_driver = {
> > +     .driver.name    = "lmp92001-gpio",
> > +     .probe          = lmp92001_gpio_probe,
> > +     .remove         = lmp92001_gpio_remove,
> > +};
> > +
> > +static int __init lmp92001_gpio_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_gpio_driver);
> > +}
> > +subsys_initcall(lmp92001_gpio_init);
>
> Do we actually need to do this as a subsys_initcall rather than
> relying on deferred probing?
>
> > +
> > +static void __exit lmp92001_gpio_exit(void)
> > +{
> > +     platform_driver_unregister(&lmp92001_gpio_driver);
> > +}
> > +module_exit(lmp92001_gpio_exit);
> > +
> > +MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
> > +MODULE_DESCRIPTION("GPIO interface for TI LMP92001");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:lmp92001-gpio");
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 614fa41..2adeba5 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -331,6 +331,16 @@ config IMX7D_ADC
> >         This driver can also be built as a module. If so, the module
> will be
> >         called imx7d_adc.
> >
> > +config LMP92001_ADC
> > +       tristate "TI LMP92001 ADC Driver"
> > +       depends on MFD_LMP92001
> > +       help
> > +         If you say yes here you get support for TI LMP92001 ADCs
> > +         conversion.
> > +
> > +         This driver can also be built as a module. If so, the module
> will
> > +         be called lmp92001_adc.
> > +
> >  config LP8788_ADC
> >       tristate "LP8788 ADC driver"
> >       depends on MFD_LP8788
> > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > index b546736a..2ed8986 100644
> > --- a/drivers/iio/adc/Makefile
> > +++ b/drivers/iio/adc/Makefile
> > @@ -31,6 +31,7 @@ obj-$(CONFIG_HI8435) += hi8435.o
> >  obj-$(CONFIG_HX711) += hx711.o
> >  obj-$(CONFIG_IMX7D_ADC) += imx7d_adc.o
> >  obj-$(CONFIG_INA2XX_ADC) += ina2xx-adc.o
> > +obj-$(CONFIG_LMP92001_ADC) += lmp92001-adc.o
> >  obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
> >  obj-$(CONFIG_LPC18XX_ADC) += lpc18xx_adc.o
> >  obj-$(CONFIG_LPC32XX_ADC) += lpc32xx_adc.o
> > diff --git a/drivers/iio/adc/lmp92001-adc.c b/drivers/iio/adc/lmp92001-
> adc.c
> > new file mode 100644
> > index 0000000..8e64b51
> > --- /dev/null
> > +++ b/drivers/iio/adc/lmp92001-adc.c
> > @@ -0,0 +1,500 @@
> > +/*
> > + * lmp92001-adc.c - Support for TI LMP92001 ADCs
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x and ad5064 drivers.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#include <linux/iio/iio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +#define CGEN_STRT    (1 << 0) /* Is continuous conversion all of ADCs?
> */
> > +#define CGEN_LCK     (1 << 1) /* Is lock the HW register? */
>
> BIT() where appropriate.
>
> > +#define CGEN_RST     (1 << 7) /* Reset all registers. */
> > +
> > +#define CREF_AEXT    (1 << 1) /* 1 - ADC external reference.
> > +                               * 0 - ADC internal reference.
> > +                               */
>
> Just move the comments above rather than doing this - also
> please use standard multiline comment syntax.
>
> > +
> > +static int lmp92001_read_raw(struct iio_dev *indio_dev,
> > +     struct iio_chan_spec const *channel,
> > +     int *val, int *val2,
> > +     long mask)
>
> Align paramaters.
>
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int code, cgen, sgen, try;
> > +     int ret;
> > +
> > +     mutex_lock(&lmp92001->adc_lock);
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CGEN, &cgen);
> > +     if (ret < 0)
> > +             goto exit;
> > +
> > +     /*
> > +      * Is not continuous conversion?
> > +      * Lock the HW registers (if needed).
> > +      * Triggering single-short conversion.
> > +      * Waiting for conversion successfully.
> > +      */
> > +     if (!(cgen & CGEN_STRT)) {
> > +             if (!(cgen & CGEN_LCK)) {
> > +                     ret = regmap_update_bits(lmp92001->regmap,
> > +                                     LMP92001_CGEN, CGEN_LCK, CGEN_LCK);
> > +                     if (ret < 0)
> > +                             goto exit;
> > +             }
> > +
> > +             /* Writing any value to triggered Single-Shot conversion.
> */
> > +             ret = regmap_write(lmp92001->regmap, LMP92001_CTRIG, 1);
> > +             if (ret < 0)
> > +                     goto exit;
> > +
> > +             /* In case of conversion is in-progress, repeat for 10
> times. */
> > +             try = 10;
> > +             do {
> > +                     ret = regmap_read(lmp92001->regmap,
> > +                                             LMP92001_SGEN, &sgen);
> > +                     if (ret < 0)
> > +                             goto exit;
> > +             } while ((sgen & CGEN_RST) && (--try > 0));
> > +
> > +             if (!try) {
> > +                     ret = -ETIME;
> > +                     goto exit;
> > +             }
> > +     }
> Move this whole block to be single shot only.  Keep continuous for
> triggered buffer usage.
>
> Does this device have a dataready interrupt? Otherwise you'll probably
> want to
> do buffers with out the trigger and use a thread to monitor this complete
> signal at 2x the expected frequency (so we don't miss any samples).
>
>
> > +
> > +     ret = regmap_read(lmp92001->regmap, 0x1F + channel->channel,
> &code);
> unlock here.
> > +     if (ret < 0)
> > +             goto exit;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             switch (channel->type) {
> > +             case IIO_VOLTAGE:
> > +             case IIO_TEMP:
> > +                     *val = code;
> > +                     ret = IIO_VAL_INT;
> > +                     goto exit;
> > +             default:
> > +                     break;
> > +             }
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     /* In case of no match channel info/type is return here. */
> > +     ret = -EINVAL;
> Move this into the default and direct return in the switch statement.
>
> You will need an error handling path still to do the unlock of course.
>
>
> > +
> > +exit:
> > +     mutex_unlock(&lmp92001->adc_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct iio_info lmp92001_info = {
> > +     .read_raw = lmp92001_read_raw,
> > +     .driver_module = THIS_MODULE,
>
> I'll probably clean this up during a merge, but the need
> to set driver_module is going away very soon.
>
> > +};
> > +
> > +static ssize_t lmp92001_avref_read(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cref;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CREF, &cref);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return sprintf(buf, "%s\n", cref & CREF_AEXT ? "external" :
> "internal");
> > +}
> > +
> > +static ssize_t lmp92001_avref_write(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel,
> > +     const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cref;
> > +     int ret;
> > +
> > +     if (strncmp("external", buf, 8) == 0)
> > +             cref = 2;
> > +     else if (strncmp("internal", buf, 8) == 0)
> > +             cref = 0;
> > +     else
> > +             return -EINVAL;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CREF,
> CREF_AEXT,
> > +                                     cref);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +static ssize_t lmp92001_enable_read(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int reg, cad;
> > +     int ret;
>
> As stated below, do this all by supplying triggered  buffer support.
> For sysfs reads the overhead is huge anyway so just use oneshot.
> It's not a fast path in any sensible userspace code.
>
> > +
> > +     switch (channel->channel) {
> > +     case 1 ... 8:
> > +             reg = LMP92001_CAD1;
> > +             break;
> > +     case 9 ... 16:
> > +             reg = LMP92001_CAD2;
> > +             break;
> > +     case 17:
> > +             reg = LMP92001_CAD3;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret = regmap_read(lmp92001->regmap, reg, &cad);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (channel->channel <= 8)
> > +             cad >>= channel->channel - 1;
> > +     else if (channel->channel > 8)
> > +             cad >>= channel->channel - 9;
> > +     else if (channel->channel > 16)
> > +             cad >>= channel->channel - 17;
> > +     else
> > +             return -EINVAL;
> > +
> > +     return sprintf(buf, "%s\n", cad & BIT(0) ? "enable" : "disable");
> > +}
> > +
> > +static ssize_t lmp92001_enable_write(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel,
> > +     const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int reg, enable, shif, mask;
> > +     int ret;
> > +
> > +     switch (channel->channel) {
> > +     case 1 ... 8:
> > +             reg = LMP92001_CAD1;
> > +             shif = (channel->channel - 1);
> > +             break;
> > +     case 9 ... 16:
> > +             reg = LMP92001_CAD2;
> > +             shif = (channel->channel - 9);
> > +             break;
> > +     case 17:
> > +             reg = LMP92001_CAD3;
> > +             shif = (channel->channel - 17);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (strncmp("enable", buf, 6) == 0)
> > +             enable = 1;
> > +     else if (strncmp("disable", buf, 7) == 0)
> > +             enable = 0;
> > +     else
> > +             return -EINVAL;
> > +
> > +     enable <<= shif;
> > +     mask = 1 << shif;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, reg, mask, enable);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +static ssize_t lmp92001_mode_read(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cgen;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CGEN, &cgen);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return sprintf(buf, "%s\n",
> > +                     cgen & BIT(0) ? "continuous" : "single-shot");
> > +}
> > +
> > +static ssize_t lmp92001_mode_write(struct iio_dev *indio_dev,
> > +     uintptr_t private, struct iio_chan_spec const *channel,
> > +     const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> iio_priv.
> > +     unsigned int cgen;
> > +     int ret;
> > +
> > +     if (strncmp("continuous", buf, 10) == 0)
> > +             cgen = 1;
> > +     else if (strncmp("single-shot", buf, 11) == 0)
> > +             cgen = 0;
> > +     else
> > +             return -EINVAL;
> > +
> > +     /*
> > +      * Unlock the HW registers.
> > +      * Set conversion mode.
> > +      * Lock the HW registers.
> > +      */
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
> CGEN_LCK, 0);
> > +     if (ret < 0)
> > +             return ret;
> I'd suggest a utility function for the unlock, update, lock cycle.
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
> CGEN_STRT,
> > +                                     cgen);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
> CGEN_LCK,
> > +                                     CGEN_LCK);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +static const struct iio_chan_spec_ext_info lmp92001_ext_info[] = {
> > +     {
> > +             .name = "vref",
> > +             .read = lmp92001_avref_read,
> > +             .write = lmp92001_avref_write,
> > +     .shared = IIO_SHARED_BY_ALL,
> > +     },
> > +     {
> }, { preferred.
> > +             .name = "en",
> > +             .read = lmp92001_enable_read,
> > +             .write = lmp92001_enable_write,
> > +             .shared = IIO_SEPARATE,
> > +     },
> > +     {
> > +             .name = "mode",
> > +             .read = lmp92001_mode_read,
> > +             .write = lmp92001_mode_write,
> > +             .shared = IIO_SHARED_BY_ALL,
> > +     },
>
> As ever with custom ABI, these need a lot of justifying before we'll
> take them.  The result of this stuff is that standard userspace code has
> no idea what to do with this device to make it work.
>
> > +     { },
> > +};
> > +
> > +static const struct iio_event_spec lmp92001_events[] = {
> > +     {
> > +             .type = IIO_EV_TYPE_THRESH,
> > +             .dir = IIO_EV_DIR_RISING,
> > +             .mask_separate = BIT(IIO_EV_INFO_ENABLE) |
> > +                     BIT(IIO_EV_INFO_VALUE),
> > +     },
> > +     {
> > +             .type = IIO_EV_TYPE_THRESH,
> > +             .dir = IIO_EV_DIR_FALLING,
> > +             .mask_separate = BIT(IIO_EV_INFO_ENABLE) |
> > +                     BIT(IIO_EV_INFO_VALUE),
> > +     },
> > +     { },
> > +};
> > +
> > +#define LMP92001_CHAN_SPEC(_ch, _type, _event, _nevent) \
> > +{ \
> > +     .channel = _ch, \
> > +     .type = _type, \
> > +     .indexed = 1, \
> > +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> > +     .event_spec = _event, \
> > +     .num_event_specs = _nevent, \
> > +     .ext_info = lmp92001_ext_info, \
> > +}
> > +
> > +static const struct iio_chan_spec lmp92001_adc_channels[] = {
> > +     LMP92001_CHAN_SPEC(1, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(2, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(3, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(4, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(5, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(6, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(7, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(8, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(9, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(10, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(11, IIO_VOLTAGE, lmp92001_events,
> > +                     ARRAY_SIZE(lmp92001_events)),
> > +     LMP92001_CHAN_SPEC(12, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(13, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(14, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(15, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(16, IIO_VOLTAGE, NULL, 0),
> > +     LMP92001_CHAN_SPEC(17,    IIO_TEMP, NULL, 0),
> > +};
> > +
> > +static int lmp92001_adc_probe(struct platform_device *pdev)
> > +{
> > +     struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
> > +     struct iio_dev *indio_dev;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     const char *conversion;
> > +     unsigned int cgen = 0, cad1, cad2, cad3;
> > +     u32 mask;
> > +     int ret;
> > +
> > +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*lmp92001));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&lmp92001->adc_lock);
> > +
> > +     iio_device_set_drvdata(indio_dev, lmp92001);
>
> Why?  You can always get the lmp92001 from iio_priv(indio_dev)
>
> > +
> > +     indio_dev->name = pdev->name;
> > +     indio_dev->dev.parent = &pdev->dev;
> > +     indio_dev->modes = INDIO_DIRECT_MODE;
> > +     indio_dev->info = &lmp92001_info;
> > +     indio_dev->channels = lmp92001_adc_channels;
> > +     indio_dev->num_channels = ARRAY_SIZE(lmp92001_adc_channels);
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CGEN,
> > +                                     CGEN_RST, CGEN_RST);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "failed to self reset all
> registers\n");
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Turn on all of them, if you are pretty sure they are must be
> > +      * real-time update or specify which channel is needed to be used
> to
> > +      * save conversion time for a cycle.
> > +      */
> > +     ret = of_property_read_u32(np, "ti,lmp92001-adc-mask", &mask);
> > +     if (ret < 0) {
> > +             cad1 = cad2 = cad3 = 0xFF;
> > +             dev_info(&pdev->dev, "turn on all of channels by
> default\n");
> > +     } else {
> > +             cad1 = mask & 0xFF;
> > +             cad2 = (mask >> 8) & 0xFF;
> > +             cad3 = (mask >> 16) & 0xFF;
> > +     }
>
> If you need these efficiencies, use the buffered mode interface of IIO and
> switch into continuous mode with just the right channels.  For single reads
> use oneshot.
>
> This will then all be handled in the update_scan_mask callback.
>
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD1, 0xFF,
> cad1);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "failed to enable/disable channels
> 1-8\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD2, 0xFF,
> cad2);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev, "failed to enable/disable channels
> 9-16\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CAD3, BIT(0),
> cad3);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev,
> > +                     "failed to enable/disable channel 17
> (temperature)\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = of_property_read_string_index(np, "ti,lmp92001-adc-mode", 0,
> > +                                             &conversion);
> > +     if (!ret) {
> > +             if (strncmp("continuous", conversion, 10) == 0) {
> > +                     cgen |= 1;
> > +             } else if (strncmp("single-shot", conversion, 11) == 0) {
> > +                     /* Okay */
> > +             } else {
> > +                     dev_warn(&pdev->dev,
> > +                     "wrong adc mode! set to single-short
> conversion\n");
> > +             }
> > +     } else
> > +             dev_info(&pdev->dev,
> > +                     "single-short conversion was chosen by default\n");
> > +
> > +     /* Lock the HW registers and set conversion mode. */
> > +     ret = regmap_update_bits(lmp92001->regmap,
> > +                                     LMP92001_CGEN, CGEN_LCK |
> CGEN_STRT,
> > +                                     cgen | CGEN_LCK);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     platform_set_drvdata(pdev, indio_dev);
> > +
> > +     return devm_iio_device_register(&pdev->dev, indio_dev);
>
> Can't do this as you need to unwind some setup. Do it with
> iio_device_register
> and manually unwind in remove.
>
> > +}
> > +
> > +static int lmp92001_adc_remove(struct platform_device *pdev)
> > +{
> > +     struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +
> > +     /*
> > +      * To stop ADC conversion to save power
> > +      *
> > +      * Unlock the HW registers.
> > +      * Set conversion mode to single-shot.
> > +      * Lock the HW registers.
> > +      */
> > +     regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK, 0);
> > +     regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_STRT, 0);
> > +     regmap_update_bits(lmp92001->regmap, LMP92001_CGEN, CGEN_LCK,
> CGEN_LCK);
> > +
> > +     devm_iio_device_unregister(&pdev->dev, indio_dev);
>
> Again, look up what devm does.   You can't use it here though as when used
> correctly it will result in remove not being the reverse order of probe.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_adc_driver = {
> > +     .driver.name    = "lmp92001-adc",
> > +     .probe          = lmp92001_adc_probe,
> > +     .remove         = lmp92001_adc_remove,
> > +};
> > +
> > +static int __init lmp92001_adc_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_adc_driver);
> > +}
> > +subsys_initcall(lmp92001_adc_init);
> Why?
> > +
> > +static void __exit lmp92001_adc_exit(void)
> > +{
> > +     platform_driver_unregister(&lmp92001_adc_driver);
> > +}
> > +module_exit(lmp92001_adc_exit);
>
> use the magic platform macros to drop this boiler plate unless
> you have a good reason for the subsys_initcall.
> > +
> > +MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
> > +MODULE_DESCRIPTION("IIO ADC interface for TI LMP92001");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:lmp92001-adc");
> > diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> > index 25bed2d..3e0d816 100644
> > --- a/drivers/iio/dac/Kconfig
> > +++ b/drivers/iio/dac/Kconfig
> > @@ -221,6 +221,15 @@ config DPOT_DAC
> >         To compile this driver as a module, choose M here: the module
> will be
> >         called dpot-dac.
> >
> > +config LMP92001_DAC
> > +        tristate "TI LMP92001 DAC Driver"
> > +        depends on MFD_LMP92001
> > +        help
> > +          If you say yes here you get support for TI LMP92001 DACs.
> > +
> > +          This driver can also be built as a module. If so, the module
> will
> > +          be called lmp92001_dac.
> > +
> >  config LPC18XX_DAC
> >       tristate "NXP LPC18xx DAC driver"
> >       depends on ARCH_LPC18XX || COMPILE_TEST
> > diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
> > index 603587c..516d2be 100644
> > --- a/drivers/iio/dac/Makefile
> > +++ b/drivers/iio/dac/Makefile
> > @@ -23,6 +23,7 @@ obj-$(CONFIG_AD7303) += ad7303.o
> >  obj-$(CONFIG_AD8801) += ad8801.o
> >  obj-$(CONFIG_CIO_DAC) += cio-dac.o
> >  obj-$(CONFIG_DPOT_DAC) += dpot-dac.o
> > +obj-$(CONFIG_LMP92001_DAC) += lmp92001-dac.o
> >  obj-$(CONFIG_LPC18XX_DAC) += lpc18xx_dac.o
> >  obj-$(CONFIG_LTC2632) += ltc2632.o
> >  obj-$(CONFIG_M62332) += m62332.o
> > diff --git a/drivers/iio/dac/lmp92001-dac.c b/drivers/iio/dac/lmp92001-
> dac.c
> > new file mode 100644
> > index 0000000..8ea981b
> > --- /dev/null
> > +++ b/drivers/iio/dac/lmp92001-dac.c
> > @@ -0,0 +1,390 @@
> > +/*
> > + * lmp92001-dac.c - Support for TI LMP92001 DACs
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
>
> Lots of comments would be about the ABI but we've already covered that
> above.
>
> > +
> > +#include <linux/iio/iio.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +#define CREF_DEXT    (1 << 0) /* 1 - DAC external reference.
> > +                               * 0 - DAC internal reference.
> > +                               */
> > +#define CDAC_OFF     (1 << 0) /* 1 - Forces all outputs to high
> impedance. */
> > +#define CDAC_OLVL    (1 << 1) /* 1 - Cy=0 will force associated OUTx
> outputs
> > +                               *     to VDD.
> > +                               * 0 - Cy=0 will force associated OUTx
> outputs
> > +                               *     to GND.
> > +                               */
> > +#define CDAC_GANG    (1 << 2) /* Controls the association of analog
> output
> > +                               * channels OUTx with asynchronous control
> > +                               * inputs Cy.
> > +                               *
> > +                               *         Cy to OUTx Assignment
> > +                               * --------------------------------------
> > +                               * | Cy | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +                               * --------------------------------------
> > +                               * | C1 | OUT[1:4]      | OUT[1:3]      |
> > +                               * --------------------------------------
> > +                               * | C2 | OUT[5:6]      | OUT[4:6]      |
> > +                               * --------------------------------------
> > +                               * | C3 | OUT[7:8]      | OUT[7:9]      |
> > +                               * --------------------------------------
> > +                               * | C4 | OUT[9:12]     | OUT[10:12]    |
> > +                               * --------------------------------------
> > +                               */
> > +
> > +static int lmp92001_read_raw(struct iio_dev *indio_dev,
> > +     struct iio_chan_spec const *channel,
> > +     int *val, int *val2,
> > +     long mask)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     int ret;
> > +
> > +     mutex_lock(&lmp92001->dac_lock);
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             switch (channel->type) {
> > +             case IIO_VOLTAGE:
> > +                     ret = regmap_read(lmp92001->regmap,
> > +                                     0x7F + channel->channel, val);
> Again, move the lock in here.
> > +                     if (ret < 0)
> > +                             goto exit;
> > +
> > +                     ret = IIO_VAL_INT;
> > +                     goto exit;
> > +                     break;
> > +             default:
> > +                     break;
> > +             }
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     /* In case of no match channel info/type is return here. */
> > +     ret = -EINVAL;
> > +
> > +exit:
> > +     mutex_unlock(&lmp92001->dac_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +int lmp92001_write_raw(struct iio_dev *indio_dev,
> > +     struct iio_chan_spec const *channel,
> > +     int val, int val2,
> > +     long mask)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     int ret;
> > +
> > +     mutex_lock(&lmp92001->dac_lock);
> > +
> > +     if (val < 0 || val > 4095) {
> > +             ret = -EINVAL;
> > +             goto exit;
> > +     }
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             switch (channel->type) {
> > +             case IIO_VOLTAGE:
> Move lock in here... Will simplify code flow by allowing direct returns.
> > +                     ret = regmap_write(lmp92001->regmap,
> > +                                     0x7F + channel->channel, val);
> > +                     if (ret < 0)
> > +                             goto exit;
> > +
> > +                     ret = 0;
> > +                     goto exit;
> > +                     break;
> > +             default:
> > +                     break;
> > +             }
> > +             break;
> > +     default:
> > +             break;
> > +     }
>
> > +
> > +     /* In case of no match channel info/type is return here. */
> > +     ret = -EINVAL;
> > +
> > +exit:
> > +     mutex_unlock(&lmp92001->dac_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct iio_info lmp92001_info = {
> > +     .read_raw = lmp92001_read_raw,
> > +     .write_raw = lmp92001_write_raw,
> > +     .driver_module = THIS_MODULE,
> > +};
> > +
> > +ssize_t lmp92001_dvref_read(struct iio_dev *indio_dev, uintptr_t
> private,
> > +     struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cref;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CREF, &cref);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return sprintf(buf, "%s\n", cref & CREF_DEXT ? "external" :
> "internal");
> > +}
> > +
> > +ssize_t lmp92001_dvref_write(struct iio_dev *indio_dev, uintptr_t
> private,
> > +     struct iio_chan_spec const *channel, const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cref;
> > +     int ret;
> > +
> > +     if (strncmp("external", buf, 8) == 0)
> > +             cref = 1;
> > +     else if (strncmp("internal", buf, 8) == 0)
> > +             cref = 0;
> > +     else
> > +             return -EINVAL;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CREF,
> CREF_DEXT,
> > +                                     cref);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +ssize_t lmp92001_outx_read(struct iio_dev *indio_dev, uintptr_t private,
> > +     struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cdac;
> > +     const char *outx;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CDAC, &cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (cdac & CDAC_OFF)
> > +             outx = "hiz";
> > +     else {
> > +             if (cdac & CDAC_OLVL)
> > +                     outx = "1 or dac";
> > +             else
> > +                     outx = "0 or dac";
> > +     }
> > +
> > +     return sprintf(buf, "%s\n", outx);
> > +}
> > +
> > +ssize_t lmp92001_outx_write(struct iio_dev *indio_dev, uintptr_t
> private,
> > +     struct iio_chan_spec const *channel, const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cdac, mask;
> > +     int ret;
> > +
> > +     if (strncmp("hiz", buf, 3) == 0) {
> > +             cdac = CDAC_OFF;
> > +             mask = CDAC_OFF;
> > +     } else if (strncmp("dac", buf, 3) == 0) {
> > +             cdac = ~CDAC_OFF;
> > +             mask = CDAC_OFF;
> > +     } else if (strncmp("0", buf, 1) == 0) {
> > +             cdac = ~(CDAC_OLVL | CDAC_OFF);
> > +             mask = CDAC_OLVL | CDAC_OFF;
> > +     } else if (strncmp("1", buf, 1) == 0) {
> > +             cdac = CDAC_OLVL;
> > +             mask = CDAC_OLVL | CDAC_OFF;
> > +     } else
> > +             return -EINVAL;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC, mask,
> cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +ssize_t lmp92001_gang_read(struct iio_dev *indio_dev, uintptr_t private,
> > +     struct iio_chan_spec const *channel, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cdac;
> > +     int ret;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_CDAC, &cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return sprintf(buf, "%s\n", cdac & CDAC_GANG ? "1" : "0");
> > +}
> > +
> > +ssize_t lmp92001_gang_write(struct iio_dev *indio_dev, uintptr_t
> private,
> > +     struct iio_chan_spec const *channel, const char *buf, size_t len)
> > +{
> > +     struct lmp92001 *lmp92001 = iio_device_get_drvdata(indio_dev);
> > +     unsigned int cdac = 0;
> > +     int ret;
> > +
> > +     if (strncmp("0", buf, 1) == 0)
> > +             cdac = ~CDAC_GANG;
> > +     else if (strncmp("1", buf, 1) == 0)
> > +             cdac = CDAC_GANG;
> > +     else
> > +             return -EINVAL;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC,
> CDAC_GANG,
> > +                                     cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return len;
> > +}
> > +
> > +static const struct iio_chan_spec_ext_info lmp92001_ext_info[] = {
> > +     {
> > +             .name = "vref",
> > +             .read = lmp92001_dvref_read,
> > +             .write = lmp92001_dvref_write,
> > +             .shared = IIO_SHARED_BY_ALL,
> > +     },
> > +     {
> > +             .name = "outx",
> > +             .read = lmp92001_outx_read,
> > +             .write = lmp92001_outx_write,
> > +             .shared = IIO_SHARED_BY_ALL,
> > +     },
> > +     {
> > +             .name = "gang",
> > +             .read = lmp92001_gang_read,
> > +             .write = lmp92001_gang_write,
> > +             .shared = IIO_SHARED_BY_ALL,
> > +     },
> > +     { },
> > +};
> > +
> > +#define LMP92001_CHAN_SPEC(_ch) \
> > +{ \
> > +     .channel = _ch, \
> > +     .type = IIO_VOLTAGE, \
> > +     .indexed = 1, \
> > +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
> > +     .ext_info = lmp92001_ext_info, \
> > +     .output = 1, \
> > +}
> > +
> > +static const struct iio_chan_spec lmp92001_dac_channels[] = {
> > +     LMP92001_CHAN_SPEC(1),
> > +     LMP92001_CHAN_SPEC(2),
> > +     LMP92001_CHAN_SPEC(3),
> > +     LMP92001_CHAN_SPEC(4),
> > +     LMP92001_CHAN_SPEC(5),
> > +     LMP92001_CHAN_SPEC(6),
> > +     LMP92001_CHAN_SPEC(7),
> > +     LMP92001_CHAN_SPEC(8),
> > +     LMP92001_CHAN_SPEC(9),
> > +     LMP92001_CHAN_SPEC(10),
> > +     LMP92001_CHAN_SPEC(11),
> > +     LMP92001_CHAN_SPEC(12),
> > +};
> > +
> > +static int lmp92001_dac_probe(struct platform_device *pdev)
> > +{
> > +     struct lmp92001 *lmp92001 = dev_get_drvdata(pdev->dev.parent);
> > +     struct iio_dev *indio_dev;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     u8 gang = 0, outx = 0, hiz = 0;
> > +     unsigned int cdac = 0;
> > +     int ret;
> > +
> > +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*lmp92001));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&lmp92001->dac_lock);
> > +
> > +     iio_device_set_drvdata(indio_dev, lmp92001);
> again, why? Use iio_priv(indio_dev) where ever you have been using
> drvdata.
> > +
> > +     indio_dev->name = pdev->name;
> > +     indio_dev->modes = INDIO_DIRECT_MODE;
> > +     indio_dev->info = &lmp92001_info;
> > +     indio_dev->channels = lmp92001_dac_channels;
> > +     indio_dev->num_channels = ARRAY_SIZE(lmp92001_dac_channels);
> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-hiz", &hiz);
> > +     cdac |= hiz;
> cdac = hiz and drop the = 0 above.  Also handle errors.
> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-outx", &outx);
> > +     cdac |= outx << 1;
> > +
> > +     of_property_read_u8(np, "ti,lmp92001-dac-gang", &gang);
> > +     cdac |= gang << 2;
> > +
> > +     ret = regmap_update_bits(lmp92001->regmap, LMP92001_CDAC,
> > +                                     CDAC_GANG | CDAC_OLVL | CDAC_OFF,
> cdac);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     platform_set_drvdata(pdev, indio_dev);
> > +
> > +     return devm_iio_device_register(&pdev->dev, indio_dev);
> > +}
> > +
> > +static int lmp92001_dac_remove(struct platform_device *pdev)
> > +{
> > +     struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > +
> > +     devm_iio_device_unregister(&pdev->dev, indio_dev);
> Same as for the ADC.
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver lmp92001_dac_driver = {
> > +     .driver.name    = "lmp92001-dac",
> > +     .probe          = lmp92001_dac_probe,
> > +     .remove         = lmp92001_dac_remove,
> > +};
> > +
> > +static int __init lmp92001_dac_init(void)
> > +{
> > +     return platform_driver_register(&lmp92001_dac_driver);
> > +}
> > +subsys_initcall(lmp92001_dac_init);
> Why subsys_initcall?
>
> > +
> > +static void __exit lmp92001_dac_exit(void)
> > +{
> > +     platform_driver_unregister(&lmp92001_dac_driver);
> > +}
> > +module_exit(lmp92001_dac_exit);
>
> Standard boilerplate remove macro once you have gotten rid
> of the subsys initcall.
> > +
> > +MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
> > +MODULE_DESCRIPTION("IIO DAC interface for TI LMP92001");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:lmp92001-dac");
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 94ad2c1..a20389a 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1528,6 +1528,18 @@ config MFD_LM3533
> >         additional drivers must be enabled in order to use the LED,
> >         backlight or ambient-light-sensor functionality of the device.
> >
> > +config MFD_LMP92001
> > +       tristate "TI LMP92001 Analog System Monitor and Controller"
> > +       depends on I2C
> > +       select MFD_CORE
> > +       select REGMAP_I2C
> > +       help
> > +         Say yes here to enable support for TI LMP92001 Analog System
> > +         Monitor and Controller
> > +
> > +         This driver provide support for 16 ADC, 12 DAC, Voltage
> Reference,
> > +         Analog Temperature Sensor and 8-bit GPIO Port.
> > +
> >  config MFD_TIMBERDALE
> >       tristate "Timberdale FPGA"
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 080793b..20d2e65 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -199,6 +199,10 @@ obj-$(CONFIG_MFD_RN5T618)        += rn5t618.o
> >  obj-$(CONFIG_MFD_SEC_CORE)   += sec-core.o sec-irq.o
> >  obj-$(CONFIG_MFD_SYSCON)     += syscon.o
> >  obj-$(CONFIG_MFD_LM3533)     += lm3533-core.o lm3533-ctrlbank.o
> > +
> > +lmp92001-objs                        := lmp92001-core.o lmp92001-i2c.o
> lmp92001-debug.o
> > +obj-$(CONFIG_MFD_LMP92001)   += lmp92001.o
> > +
> >  obj-$(CONFIG_MFD_VEXPRESS_SYSREG)    += vexpress-sysreg.o
> >  obj-$(CONFIG_MFD_RETU)               += retu-mfd.o
> >  obj-$(CONFIG_MFD_AS3711)     += as3711.o
> > diff --git a/drivers/mfd/lmp92001-core.c b/drivers/mfd/lmp92001-core.c
> > new file mode 100644
> > index 0000000..55bc9ab
> > --- /dev/null
> > +++ b/drivers/mfd/lmp92001-core.c
> > @@ -0,0 +1,308 @@
> > +/*
> > + * lmp92001-core.c - Device access for TI LMP92001
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +#include <linux/mfd/lmp92001/debug.h>
> > +
> > +static const struct mfd_cell lmp92001_devs[] = {
> > +     {
> > +             .name = "lmp92001-gpio",
> > +             .of_compatible = "ti,lmp92001-gpio",
> > +     },
> > +     {
> > +             .name = "lmp92001-adc",
> > +             .of_compatible = "ti,lmp92001-adc",
> > +     },
> > +     {
> > +             .name = "lmp92001-dac",
> > +             .of_compatible = "ti,lmp92001-dac",
> > +     },
> > +};
> > +
> > +static struct reg_default lmp92001_defaults[] = {
> > +     { LMP92001_SGEN,  0x40   },
> > +     { LMP92001_SHIL,  0x00   },
> > +     { LMP92001_SLOL,  0x00   },
> > +     { LMP92001_CGEN,  0x00   },
> > +     { LMP92001_CDAC,  0x03   },
> > +     { LMP92001_CGPO,  0xFF   },
> > +     { LMP92001_CINH,  0x00   },
> > +     { LMP92001_CINL,  0x00   },
> > +     { LMP92001_CAD1,  0x00   },
> > +     { LMP92001_CAD2,  0x00   },
> > +     { LMP92001_CAD3,  0x00   },
> > +     { LMP92001_CTRIG, 0x00   },
> > +     { LMP92001_CREF,  0x07   },
> > +     { LMP92001_ADC1,  0x0000 },
> > +     { LMP92001_ADC2,  0x0000 },
> > +     { LMP92001_ADC3,  0x0000 },
> > +     { LMP92001_ADC4,  0x0000 },
> > +     { LMP92001_ADC5,  0x0000 },
> > +     { LMP92001_ADC6,  0x0000 },
> > +     { LMP92001_ADC7,  0x0000 },
> > +     { LMP92001_ADC8,  0x0000 },
> > +     { LMP92001_ADC9,  0x0000 },
> > +     { LMP92001_ADC10, 0x0000 },
> > +     { LMP92001_ADC11, 0x0000 },
> > +     { LMP92001_ADC12, 0x0000 },
> > +     { LMP92001_ADC13, 0x0000 },
> > +     { LMP92001_ADC14, 0x0000 },
> > +     { LMP92001_ADC15, 0x0000 },
> > +     { LMP92001_ADC16, 0x0000 },
> > +     { LMP92001_LIH1,  0x0FFF },
> > +     { LMP92001_LIH2,  0x0FFF },
> > +     { LMP92001_LIH3,  0x0FFF },
> > +     { LMP92001_LIH9,  0x0FFF },
> > +     { LMP92001_LIH10, 0x0FFF },
> > +     { LMP92001_LIH11, 0x0FFF },
> > +     { LMP92001_LIL1,  0x0000 },
> > +     { LMP92001_LIL2,  0x0000 },
> > +     { LMP92001_LIL3,  0x0000 },
> > +     { LMP92001_LIL9,  0x0000 },
> > +     { LMP92001_LIL10, 0x0000 },
> > +     { LMP92001_LIL11, 0x0000 },
> > +     { LMP92001_DAC1,  0x0000 },
> > +     { LMP92001_DAC2,  0x0000 },
> > +     { LMP92001_DAC3,  0x0000 },
> > +     { LMP92001_DAC4,  0x0000 },
> > +     { LMP92001_DAC5,  0x0000 },
> > +     { LMP92001_DAC6,  0x0000 },
> > +     { LMP92001_DAC7,  0x0000 },
> > +     { LMP92001_DAC8,  0x0000 },
> > +     { LMP92001_DAC9,  0x0000 },
> > +     { LMP92001_DAC10, 0x0000 },
> > +     { LMP92001_DAC11, 0x0000 },
> > +     { LMP92001_DAC12, 0x0000 },
> > +     { LMP92001_DALL,  0x0000 },
> > +};
> > +
> > +static bool lmp92001_reg_readable(struct device *dev, unsigned int reg)
> > +{
> > +     switch (reg) {
> > +     case LMP92001_ID:
> > +     case LMP92001_VER:
> > +     case LMP92001_SGEN:
> > +     case LMP92001_SGPI:
> > +     case LMP92001_SHIL:
> > +     case LMP92001_SLOL:
> > +     case LMP92001_CGEN:
> > +     case LMP92001_CDAC:
> > +     case LMP92001_CGPO:
> > +     case LMP92001_CINH:
> > +     case LMP92001_CINL:
> > +     case LMP92001_CAD1:
> > +     case LMP92001_CAD2:
> > +     case LMP92001_CAD3:
> > +     case LMP92001_ADC1:
> > +     case LMP92001_ADC2:
> > +     case LMP92001_ADC3:
> > +     case LMP92001_ADC4:
> > +     case LMP92001_ADC5:
> > +     case LMP92001_ADC6:
> > +     case LMP92001_ADC7:
> > +     case LMP92001_ADC8:
> > +     case LMP92001_ADC9:
> > +     case LMP92001_ADC10:
> > +     case LMP92001_ADC11:
> > +     case LMP92001_ADC12:
> > +     case LMP92001_ADC13:
> > +     case LMP92001_ADC14:
> > +     case LMP92001_ADC15:
> > +     case LMP92001_ADC16:
> > +     case LMP92001_ADC17:
> > +     case LMP92001_LIH1:
> > +     case LMP92001_LIH2:
> > +     case LMP92001_LIH3:
> > +     case LMP92001_LIH9:
> > +     case LMP92001_LIH10:
> > +     case LMP92001_LIH11:
> > +     case LMP92001_LIL1:
> > +     case LMP92001_LIL2:
> > +     case LMP92001_LIL3:
> > +     case LMP92001_LIL9:
> > +     case LMP92001_LIL10:
> > +     case LMP92001_LIL11:
> > +     case LMP92001_CREF:
> > +     case LMP92001_DAC1:
> > +     case LMP92001_DAC2:
> > +     case LMP92001_DAC3:
> > +     case LMP92001_DAC4:
> > +     case LMP92001_DAC5:
> > +     case LMP92001_DAC6:
> > +     case LMP92001_DAC7:
> > +     case LMP92001_DAC8:
> > +     case LMP92001_DAC9:
> > +     case LMP92001_DAC10:
> > +     case LMP92001_DAC11:
> > +     case LMP92001_DAC12:
> > +     case LMP92001_BLK0:
> > +     case LMP92001_BLK1:
> > +     case LMP92001_BLK2:
> > +     case LMP92001_BLK3:
> > +     case LMP92001_BLK4:
> > +     case LMP92001_BLK5:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static bool lmp92001_reg_writeable(struct device *dev, unsigned int reg)
> > +{
> > +     switch (reg) {
> > +     case LMP92001_CGEN:
> > +     case LMP92001_CDAC:
> > +     case LMP92001_CGPO:
> > +     case LMP92001_CINH:
> > +     case LMP92001_CINL:
> > +     case LMP92001_CAD1:
> > +     case LMP92001_CAD2:
> > +     case LMP92001_CAD3:
> > +     case LMP92001_CTRIG:
> > +     case LMP92001_LIH1:
> > +     case LMP92001_LIH2:
> > +     case LMP92001_LIH3:
> > +     case LMP92001_LIH9:
> > +     case LMP92001_LIH10:
> > +     case LMP92001_LIH11:
> > +     case LMP92001_LIL1:
> > +     case LMP92001_LIL2:
> > +     case LMP92001_LIL3:
> > +     case LMP92001_LIL9:
> > +     case LMP92001_LIL10:
> > +     case LMP92001_LIL11:
> > +     case LMP92001_CREF:
> > +     case LMP92001_DAC1:
> > +     case LMP92001_DAC2:
> > +     case LMP92001_DAC3:
> > +     case LMP92001_DAC4:
> > +     case LMP92001_DAC5:
> > +     case LMP92001_DAC6:
> > +     case LMP92001_DAC7:
> > +     case LMP92001_DAC8:
> > +     case LMP92001_DAC9:
> > +     case LMP92001_DAC10:
> > +     case LMP92001_DAC11:
> > +     case LMP92001_DAC12:
> > +     case LMP92001_DALL:
> > +     case LMP92001_BLK0:
> > +     case LMP92001_BLK1:
> > +     case LMP92001_BLK4:
> > +     case LMP92001_BLK5:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static bool lmp92001_reg_volatile(struct device *dev, unsigned int reg)
> > +{
> > +     switch (reg) {
> > +     case LMP92001_SGEN:
> > +     case LMP92001_SGPI:
> > +     case LMP92001_SHIL:
> > +     case LMP92001_SLOL:
> > +     case LMP92001_CGEN:
> > +     case LMP92001_ADC1:
> > +     case LMP92001_ADC2:
> > +     case LMP92001_ADC3:
> > +     case LMP92001_ADC4:
> > +     case LMP92001_ADC5:
> > +     case LMP92001_ADC6:
> > +     case LMP92001_ADC7:
> > +     case LMP92001_ADC8:
> > +     case LMP92001_ADC9:
> > +     case LMP92001_ADC10:
> > +     case LMP92001_ADC11:
> > +     case LMP92001_ADC12:
> > +     case LMP92001_ADC13:
> > +     case LMP92001_ADC14:
> > +     case LMP92001_ADC15:
> > +     case LMP92001_ADC16:
> > +     case LMP92001_ADC17:
> > +     case LMP92001_BLK2:
> > +     case LMP92001_BLK3:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +struct regmap_config lmp92001_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 16,
> > +
> > +     .cache_type = REGCACHE_RBTREE,
> > +
> > +     .reg_defaults = lmp92001_defaults,
> > +     .num_reg_defaults = ARRAY_SIZE(lmp92001_defaults),
> > +
> > +     .max_register = LMP92001_BLK5,
> > +     .readable_reg = lmp92001_reg_readable,
> > +     .writeable_reg = lmp92001_reg_writeable,
> > +     .volatile_reg = lmp92001_reg_volatile,
> > +};
> > +
> > +int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id,
> int irq)
> > +{
> > +     int ret;
> > +     unsigned int comid, ver;
> > +
> > +     dev_set_drvdata(lmp92001->dev, lmp92001);
> > +
> > +     ret  = regmap_read(lmp92001->regmap, LMP92001_ID, &comid);
>
> Why the two spaces after ret...
>
> > +     if (ret < 0) {
> > +             dev_err(lmp92001->dev, "failed to read Company ID: %d\n",
> ret);
> > +             goto exit;
> > +     }
> > +
> > +     ret  = regmap_read(lmp92001->regmap, LMP92001_VER, &ver);
> > +     if (ret < 0) {
> > +             dev_err(lmp92001->dev, "failed to read Version: %d\n",
> ret);
> > +             goto exit;
> > +     }
> > +
> > +     dev_info(lmp92001->dev, "Company ID 0x%.2x, Version 0x%.2x\n",
> > +                     comid, ver);
> > +
> > +     ret = mfd_add_devices(lmp92001->dev, PLATFORM_DEVID_AUTO,
> > +                             lmp92001_devs, ARRAY_SIZE(lmp92001_devs),
> > +                             NULL, 0, NULL);
> > +     if (ret != 0) {
> > +             dev_err(lmp92001->dev, "failed to add children\n");
> > +             goto exit;
> > +     }
> > +
> > +     ret = lmp92001_debug_init(lmp92001);
> > +     if (ret < 0) {
> > +             dev_err(lmp92001->dev, "failed to initial debug fs.\n");
> > +             goto exit;
> > +     }
> > +
> > +exit:
> > +     return ret;
> > +}
> > +
> > +void lmp92001_device_exit(struct lmp92001 *lmp92001)
> > +{
> > +     lmp92001_debug_exit(lmp92001);
> > +     mfd_remove_devices(lmp92001->dev);
> > +}
>
> I'm not convinced there is any benefit in breaking this up into lots of
> files...
>
> > diff --git a/drivers/mfd/lmp92001-debug.c b/drivers/mfd/lmp92001-debug.c
> > new file mode 100644
> > index 0000000..d733e67
> > --- /dev/null
> > +++ b/drivers/mfd/lmp92001-debug.c
> > @@ -0,0 +1,67 @@
> > +/*
> > + * lmp92001-debug.c - Debug file system for TI LMP92001
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +static ssize_t lmp92001_id_ver_show(struct device *dev,
> > +     struct device_attribute *attr, char *buf)
> > +{
> > +     struct lmp92001 *lmp92001 = dev_get_drvdata(dev);
> > +     int ret;
> > +     unsigned int comid, ver;
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_ID, &comid);
> > +     if (ret < 0) {
> > +             dev_err(lmp92001->dev, "failed to read Company ID: %d\n",
> ret);
> > +             return 0;
> return ret... everywhere you've done this please.
> > +     }
> > +
> > +     ret = regmap_read(lmp92001->regmap, LMP92001_VER, &ver);
> > +     if (ret < 0) {
> > +             dev_err(lmp92001->dev, "failed to read Version: %d\n",
> ret);
> > +             return 0;
> > +     }
> > +
> > +     ret = sprintf(buf, "Company ID 0x%02x (%d), Version 0x%02x (%d)\n",
> > +                     comid, comid, ver, ver);
> > +
> > +     return ret;
> return sprintf(...
> > +}
> > +static DEVICE_ATTR(lmp92001_id_ver, 0444, lmp92001_id_ver_show, NULL);
> > +
> > +int lmp92001_debug_init(struct lmp92001 *lmp92001)
> > +{
> > +     int ret;
> > +
> > +     ret = device_create_file(lmp92001->dev,
> &dev_attr_lmp92001_id_ver);
> > +     if (ret != 0)
> > +             dev_err(lmp92001->dev,
> > +                     "unique ID attribute is not created: %d\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> > +void lmp92001_debug_exit(struct lmp92001 *lmp92001)
> > +{
> > +     device_remove_file(lmp92001->dev, &dev_attr_lmp92001_id_ver);
> > +}
> > diff --git a/drivers/mfd/lmp92001-i2c.c b/drivers/mfd/lmp92001-i2c.c
> > new file mode 100644
> > index 0000000..bbb1dad
> > --- /dev/null
> > +++ b/drivers/mfd/lmp92001-i2c.c
> > @@ -0,0 +1,215 @@
> > +/*
> > + * lmp92001-i2c.c - I2C access for TI LMP92001
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +#include <linux/mfd/lmp92001/core.h>
> > +
> > +static const unsigned short lmp92001_i2c_addresses[] = {
> > +     0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E, 0x50,
> I2C_CLIENT_END
> > +};
> > +
> > +/* TODO: To read/write block access, it may need to re-ordering
> endianness! */
> > +static int lmp92001_reg_read(void *context, unsigned int reg, unsigned
> int *val)
> > +{
> > +     struct device *dev = context;
> > +     struct i2c_client *i2c = to_i2c_client(dev);
> > +     int ret;
> > +
> > +     if (reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     switch (reg) {
> > +     case LMP92001_ID ... LMP92001_CTRIG:
> > +     case LMP92001_CREF:
> > +             ret = i2c_smbus_read_byte_data(i2c, reg);
> > +             break;
> > +     case LMP92001_ADC1 ... LMP92001_LIL11:
> > +     case LMP92001_DAC1 ... LMP92001_DALL:
> > +             ret = i2c_smbus_read_word_swapped(i2c, reg);
> > +             break;
> > +     case LMP92001_BLK0 ... LMP92001_BLK5:
> > +             ret = i2c_smbus_read_block_data(i2c, reg,
> > +                                             (u8 *)((uintptr_t)*val));
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (reg <= LMP92001_DALL)
> > +             *val = ret;
> Cleaner to push this up into the case statements perhaps? Or at least
> return ret for the BLK one up there.
> > +
> > +     return 0;
> > +}
> > +
> > +static int lmp92001_reg_write(void *context, unsigned int reg, unsigned
> int val)
> > +{
> > +     struct device *dev = context;
> > +     struct i2c_client *i2c = to_i2c_client(dev);
> > +     int ret;
> > +
> > +     if (reg > 0xff)
> > +             return -EINVAL;
> > +
> > +     switch (reg) {
> > +     case LMP92001_ID ... LMP92001_CTRIG:
> > +     case LMP92001_CREF:
> > +             ret = i2c_smbus_write_byte_data(i2c, reg, val);
> > +             break;
> > +     case LMP92001_ADC1 ... LMP92001_LIL11:
> > +     case LMP92001_DAC1 ... LMP92001_DALL:
> > +             ret = i2c_smbus_write_word_swapped(i2c, reg, val);
> > +             break;
> > +     /* To call this function/case, must be passed val as pointer */
> > +     case LMP92001_BLK0:
> > +     case LMP92001_BLK4:
> > +             ret = i2c_smbus_write_block_data(i2c, reg, 24,
> > +                                             (u8 *)((uintptr_t)val));
> > +             break;
> > +     case LMP92001_BLK1:
> > +     case LMP92001_BLK5:
> > +             ret = i2c_smbus_write_block_data(i2c, reg, 12,
> > +                                             (u8 *)((uintptr_t)val));
> > +             break;
> > +     case LMP92001_BLK2:
> > +             ret = i2c_smbus_write_block_data(i2c, reg, 34,
> > +                                             (u8 *)((uintptr_t)val));
> > +             break;
> > +     case LMP92001_BLK3:
> > +             ret = i2c_smbus_write_block_data(i2c, reg, 18,
> > +                                             (u8 *)((uintptr_t)val));
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int lmp92001_i2c_probe(struct i2c_client *i2c,
> > +     const struct i2c_device_id *id)
> > +{
> > +     struct lmp92001 *lmp92001;
> > +     int ret;
> > +
> > +     lmp92001 = devm_kzalloc(&i2c->dev, sizeof(struct lmp92001),
> GFP_KERNEL);
> > +     if (!lmp92001)
> > +             return -ENOMEM;
> > +
> > +     i2c_set_clientdata(i2c, lmp92001);
> > +     lmp92001->dev = &i2c->dev;
> > +
> > +     lmp92001_regmap_config.reg_read = lmp92001_reg_read;
> > +     lmp92001_regmap_config.reg_write = lmp92001_reg_write;
> > +
> > +     lmp92001->regmap = devm_regmap_init(&i2c->dev, NULL, &i2c->dev,
> > +                                             &lmp92001_regmap_config);
> > +     if (IS_ERR(lmp92001->regmap)) {
> > +             ret = PTR_ERR(lmp92001->regmap);
> > +             dev_err(lmp92001->dev, "failed to allocate register map:
> %d\n",
> > +                             ret);
> > +             return ret;
> > +     }
> > +
> > +     return lmp92001_device_init(lmp92001, id->driver_data, i2c->irq);
> > +}
> > +
> > +static int lmp92001_i2c_remove(struct i2c_client *i2c)
> > +{
> > +     struct lmp92001 *lmp92001 = i2c_get_clientdata(i2c);
> > +
> > +     lmp92001_device_exit(lmp92001);
> > +
> > +     return 0;
> > +}
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id lmp92001_dt_ids[] = {
> > +     { .compatible = "ti,lmp92001", },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, lmp92001_dt_ids);
> > +#endif
> > +
> > +static const struct i2c_device_id lmp92001_i2c_ids[] = {
> > +     { "lmp92001" },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, lmp92001_i2c_ids);
> > +
> > +static int lmp92001_i2c_detect(struct i2c_client *i2c,
> > +     struct i2c_board_info *info)
> > +{
> > +     struct i2c_adapter *adapter = i2c->adapter;
> > +     s32 comid, ver;
> > +
> > +     if (!i2c_check_functionality(adapter,
> > +                                     I2C_FUNC_SMBUS_BYTE_DATA |
> > +                                     I2C_FUNC_SMBUS_WORD_DATA |
> > +                                     I2C_FUNC_SMBUS_BLOCK_DATA))
> > +             return -ENODEV;
> > +
> > +     comid = i2c_smbus_read_byte_data(i2c, LMP92001_ID);
> > +     ver = i2c_smbus_read_byte_data(i2c, LMP92001_VER);
> > +
> > +     if (comid != 0x01 || ver != 0x10)
> > +             return -ENODEV;
> > +
> > +     return 0;
> > +}
> > +
> > +static struct i2c_driver lmp92001_i2c_driver = {
> > +     .driver = {
> > +             .name = "lmp92001",
> > +             .of_match_table = of_match_ptr(lmp92001_dt_ids),
> > +     },
> > +     .probe          = lmp92001_i2c_probe,
> > +     .remove         = lmp92001_i2c_remove,
> > +     .id_table       = lmp92001_i2c_ids,
> > +     .detect         = lmp92001_i2c_detect,
> > +     .address_list   = lmp92001_i2c_addresses,
> > +};
> > +
> > +static int __init lmp92001_i2c_init(void)
> > +{
> > +     return i2c_add_driver(&lmp92001_i2c_driver);
> > +}
> > +subsys_initcall(lmp92001_i2c_init);
> > +
> > +static void __exit lmp92001_i2c_exit(void)
> > +{
> > +     i2c_del_driver(&lmp92001_i2c_driver);
> > +}
> > +module_exit(lmp92001_i2c_exit);
> > +
> > +MODULE_DESCRIPTION("i2c driver for TI LMP92001");
> > +MODULE_AUTHOR("Abhisit Sangjan <s.abhisit@gmail.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/lmp92001/core.h
> b/include/linux/mfd/lmp92001/core.h
> > new file mode 100644
> > index 0000000..9039000
> > --- /dev/null
> > +++ b/include/linux/mfd/lmp92001/core.h
> > @@ -0,0 +1,119 @@
> > +/*
> > + * include/linux/mfd/lmp92001/core.h - Core interface for TI LMP92001
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#ifndef __MFD_LMP92001_CORE_H__
> > +#define __MFD_LMP92001_CORE_H__
> > +
> > +#include <linux/device.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +
> > +/*
> > + * Register values.
> > + */
> > +/* ID */
> > +#define LMP92001_ID  0x0E
> > +#define LMP92001_VER 0x0F
> > +/* STATUS */
> > +#define LMP92001_SGEN        0x10
> > +#define LMP92001_SGPI        0x11
> > +#define LMP92001_SHIL        0x12
> > +#define LMP92001_SLOL        0x13
> > +/* CONTROL */
> > +#define LMP92001_CGEN        0x14
> > +#define LMP92001_CDAC        0x15
> > +#define LMP92001_CGPO        0x16
> > +#define LMP92001_CINH        0x17
> > +#define LMP92001_CINL        0x18
> > +#define LMP92001_CAD1        0x19
> > +#define LMP92001_CAD2        0x1A
> > +#define LMP92001_CAD3        0x1B
> > +#define LMP92001_CTRIG       0x1C
> > +/* ADC OUTPUT DATA */
> > +#define LMP92001_ADC1        0x20
> > +#define LMP92001_ADC2        0x21
> > +#define LMP92001_ADC3        0x22
> > +#define LMP92001_ADC4        0x23
> > +#define LMP92001_ADC5        0x24
> > +#define LMP92001_ADC6        0x25
> > +#define LMP92001_ADC7        0x26
> > +#define LMP92001_ADC8        0x27
> > +#define LMP92001_ADC9        0x28
> > +#define LMP92001_ADC10       0x29
> > +#define LMP92001_ADC11       0x2A
> > +#define LMP92001_ADC12       0x2B
> > +#define LMP92001_ADC13       0x2C
> > +#define LMP92001_ADC14       0x2D
> > +#define LMP92001_ADC15       0x2E
> > +#define LMP92001_ADC16       0x2F
> > +#define LMP92001_ADC17       0x30
> > +/* ADC WINDOW COMPARATOR LIMITS */
> > +#define LMP92001_LIH1        0x40
> > +#define LMP92001_LIH2        0x41
> > +#define LMP92001_LIH3        0x42
> > +#define LMP92001_LIH9        0x43
> > +#define LMP92001_LIH10       0x44
> > +#define LMP92001_LIH11       0x45
> > +#define LMP92001_LIL1        0x46
> > +#define LMP92001_LIL2        0x47
> > +#define LMP92001_LIL3        0x48
> > +#define LMP92001_LIL9        0x49
> > +#define LMP92001_LIL10       0x4A
> > +#define LMP92001_LIL11       0x4B
> > +/* INTERNAL REFERENCE CONTROL */
> > +#define LMP92001_CREF        0x66
> > +/* DAC INPUT DATA */
> > +#define LMP92001_DAC1        0x80
> > +#define LMP92001_DAC2        0x81
> > +#define LMP92001_DAC3        0x82
> > +#define LMP92001_DAC4        0x83
> > +#define LMP92001_DAC5        0x84
> > +#define LMP92001_DAC6        0x85
> > +#define LMP92001_DAC7        0x86
> > +#define LMP92001_DAC8        0x87
> > +#define LMP92001_DAC9        0x88
> > +#define LMP92001_DAC10       0x89
> > +#define LMP92001_DAC11       0x8A
> > +#define LMP92001_DAC12       0x8B
> > +#define LMP92001_DALL        0x90
> > +/* MEMORY MAPPED BLOCK COMMANDS */
> > +#define LMP92001_BLK0        0xF0
> > +#define LMP92001_BLK1        0xF1
> > +#define LMP92001_BLK2        0xF2
> > +#define LMP92001_BLK3        0xF3
> > +#define LMP92001_BLK4        0xF4
> > +#define LMP92001_BLK5        0xF5
> > +
> > +struct lmp92001 {
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +
> > +     struct mutex adc_lock;
> > +     struct mutex dac_lock;
> > +};
> > +
> > +extern struct regmap_config lmp92001_regmap_config;
> > +
> > +int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id,
> int irq);
> > +void lmp92001_device_exit(struct lmp92001 *lmp92001);
> > +
> > +#endif /* __MFD_LMP92001_CORE_H__ */
> > diff --git a/include/linux/mfd/lmp92001/debug.h
> b/include/linux/mfd/lmp92001/debug.h
> > new file mode 100644
> > index 0000000..efef95f
> > --- /dev/null
> > +++ b/include/linux/mfd/lmp92001/debug.h
> > @@ -0,0 +1,28 @@
> > +/*
> > + * include/linux/mfd/lmp92001/debug.h - Debug interface for TI 92001
> > + *
> > + * Copyright 2016-2017 Celestica Ltd.
> > + *
> > + * Author: Abhisit Sangjan <s.abhisit@gmail.com>
> > + *
> > + * Inspired by wm831x driver.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + */
> > +
> > +#ifndef __MFD_LMP92001_DEBUG_H__
> > +#define __MFD_LMP92001_DEBUG_H__
> > +
> > +int lmp92001_debug_init(struct lmp92001 *lmp92001);
> > +void lmp92001_debug_exit(struct lmp92001 *lmp92001);
> > +
> > +#endif /* __MFD_LMP92001_DEBUG_H__ */
>
> Ran out of time towards the end of this so review was rather less detailed!
>
> Will take a look at the next version after you've broken this up.
>
> Jonathan
>
>
>

--001a114b24d45a1d370557586f10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jonathan - Thank you for your review, I will clean up a=
nd submit again.<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Tue, Aug 22, 2017 at 9:03 PM, Jonathan Cameron <span dir=3D"ltr">&lt;=
<a href=3D"mailto:Jonathan.Cameron@huawei.com" target=3D"_blank">Jonathan.C=
ameron@huawei.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Tue, 22 Aug 2017 13:26:11 +0700<br>
&lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt; wrot=
e:<br>
<br>
&gt; From: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abh=
isit@gmail.com</a>&gt;<br>
&gt;<br>
&gt; TI LMP92001 Analog System Monitor and Controller<br>
&gt;<br>
&gt; 8-bit GPIOs.<br>
&gt; 12 DACs with 12-bit resolution.<br>
&gt; The GPIOs and DACs are shared port function with Cy function pin to<br=
>
&gt; take control the pin suddenly from external hardware.<br>
&gt; DAC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; 16 + 1 ADCs with 12-bit resolution.<br>
&gt; Built-in internal Temperature Sensor on channel 17.<br>
&gt; Windows Comparator Function is supported on channel 1-3 and 9-11 for<b=
r>
&gt; monitoring with interrupt signal (pending to implement for interrupt).=
<br>
&gt; ADC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; Signed-off-by: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.c=
om">s.abhisit@gmail.com</a>&gt;<br>
<br>
</span>As Lee said, break this up.=C2=A0 I&#39;ve done a quick read through=
 but much easier<br>
to parse in smaller parts!<br>
<div><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001=C2=A0 |=
=C2=A0 92 ++++<br>
&gt;=C2=A0 .../devicetree/bindings/gpio/<wbr>gpio-lmp92001.txt=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 22 +<br>
&gt;=C2=A0 .../bindings/iio/adc/ti-<wbr>lmp92001-adc.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +<br>
&gt;=C2=A0 .../bindings/iio/dac/ti-<wbr>lmp92001-dac.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
&gt;=C2=A0 drivers/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/gpio/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpio/gpio-lmp92001.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 209 +++++++++<br>
&gt;=C2=A0 drivers/iio/adc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
&gt;=C2=A0 drivers/iio/adc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 drivers/iio/adc/lmp92001-adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 500 +++++++++++++++++++++<br>
&gt;=C2=A0 drivers/iio/dac/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<=
br>
&gt;=C2=A0 drivers/iio/dac/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 drivers/iio/dac/lmp92001-dac.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 390 ++++++++++++++++<br>
&gt;=C2=A0 drivers/mfd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
12 +<br>
&gt;=C2=A0 drivers/mfd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 drivers/mfd/lmp92001-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 308 +++++++++++++<br>
&gt;=C2=A0 drivers/mfd/lmp92001-debug.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 67 +++<br>
&gt;=C2=A0 drivers/mfd/lmp92001-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 215 +++++++++<br>
&gt;=C2=A0 include/linux/mfd/lmp92001/<wbr>core.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 119 +++++<br>
&gt;=C2=A0 include/linux/mfd/lmp92001/<wbr>debug.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 ++<br>
&gt;=C2=A0 20 files changed, 2051 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/ABI/testing/<wbr>sysfs-bus-iio-=
lmp920001<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/gpio/g=
pio-lmp92001.<wbr>txt<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/iio/ad=
c/ti-lmp92001-<wbr>adc.txt<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/iio/da=
c/ti-lmp92001-<wbr>dac.txt<br>
&gt;=C2=A0 create mode 100644 drivers/gpio/gpio-lmp92001.c<br>
&gt;=C2=A0 create mode 100644 drivers/iio/adc/lmp92001-adc.c<br>
&gt;=C2=A0 create mode 100644 drivers/iio/dac/lmp92001-dac.c<br>
&gt;=C2=A0 create mode 100644 drivers/mfd/lmp92001-core.c<br>
&gt;=C2=A0 create mode 100644 drivers/mfd/lmp92001-debug.c<br>
&gt;=C2=A0 create mode 100644 drivers/mfd/lmp92001-i2c.c<br>
&gt;=C2=A0 create mode 100644 include/linux/mfd/lmp92001/<wbr>core.h<br>
&gt;=C2=A0 create mode 100644 include/linux/mfd/lmp92001/<wbr>debug.h<br>
&gt;<br>
&gt; diff --git a/Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001 b/=
Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001<br>
&gt; new file mode 100644<br>
&gt; index 0000000..bd4e733<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001<br>
&gt; @@ -0,0 +1,92 @@<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/ii=
o:<wbr>deviceX/gang<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Controls the associat=
ion of analog output channels OUTx with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asynchronous control =
inputs Cy for DAC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;0&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;1&quo=
t;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0Cy to OUTx Assignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Cy | CDAC:GANG=3D0 =
| CDAC:GANG=3D1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| C1 | OUT[1:4]=C2=A0=
 =C2=A0 | OUT[1:3]=C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| C2 | OUT[5:6]=C2=A0=
 =C2=A0 | OUT[4:6]=C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| C3 | OUT[7:8]=C2=A0=
 =C2=A0 | OUT[7:9]=C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| C4 | OUT[9:12]=C2=
=A0 =C2=A0| OUT[10:12]=C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---------------------=
---------<wbr>----<br>
<br>
</div></div>Hmm. I&#39;ll want to think about this one.=C2=A0 It probably w=
ants a more<br>
descriptive name.<br>
<span class=3D"">&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/ii=
o:<wbr>deviceX/outx<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The pin output mode f=
or DAC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;hiz&q=
uot; =3D High impedance state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;dac&q=
uot; =3D DAC output.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;0&quot; =3D D=
rive it to low.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- &quot;1&quot; =3D D=
rive it to high.<br>
</span>Look at the existing ABI for powerdown modes.=C2=A0 Covers this.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/bus/iio/devices/ii=
o:<wbr>deviceX/vref<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is voltage refer=
ance source for DACs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;exter=
nal&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;inter=
nal&quot;<br>
<br>
</span>Normal assumption is that if an external reference is provided by<br=
>
the hardware (specified in DT of similar) then we want to use it,<br>
if not fall back to internal.<br>
<br>
i.e. I don&#39;t think we have ever exposed this to userspace.<br>
<br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX.<wbr>aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
<wbr>deviceX/en<br>
<br>
Why the insanely long path rather than<br>
/sys/bus/iio/device/iio:<wbr>deviceX/en ?<br>
<span class=3D""><br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is ADC Conversio=
n Enable for each channel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;enabl=
e&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;disab=
le&quot;<br>
<br>
</span>Current form isn&#39;t per channel. Should be covered by buffered mo=
de<br>
scan_elements or the driver should be able to figure it out based<br>
on what channel is being read.=C2=A0 Would not expect to see individual<br>
channel enables for an ADC.<br>
<br>
<br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX.<wbr>aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
<wbr>deviceX/mode<br>
<br>
Again, short path please.<br>
<span class=3D""><br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is conversion mo=
de for all of ADCs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;conti=
nuous&quot; =3D Continuously conversion all the time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;singl=
e-shot&quot; =3D Once time conversion and stop.<br>
<br>
</span>Which of these makes sense is usually possible to figure out from th=
e way the<br>
driver is being used.=C2=A0 This isn&#39;t something we want userspace to h=
ave to<br>
specify.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX.<wbr>aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
<wbr>deviceX/vref<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is voltage refer=
ance source for ADCs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Can be either=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;exter=
nal&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - &quot;inter=
nal&quot;<br>
<br>
</span>Again, tends to be a hardware platform defined thing rather than<br>
something it makes sense to expose to userspace.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX.<wbr>aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
<wbr>deviceX/events/in_voltageX_<wbr>thresh_{falling|rising}_en<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is ADC&#39;s Win=
dows Comparator Function enable for falling and rising.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Supported channels ar=
e 1-3 and 9-11.<br>
<br>
</span>This is standard ABI - you don&#39;t need to document it.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/socX/soc/X=
XXXXXX.<wbr>aips-bus/XXXXXXX.i2c/i2c-X/X-<wbr>00XX/lmp92001-adc.X.auto/iio:=
<wbr>deviceX/events/in_voltageX_<wbr>thresh_{falling|rising}_value<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 August 2=
016<br>
&gt; +KernelVersion:=C2=A0 4.1.15<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Abhisit Sangjan &lt;<a href=3D"ma=
ilto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>&gt;<br>
&gt; +Description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is ADC&#39;s Win=
dows Comparator Function value for falling and rising.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Supported channels ar=
e 1-3 and 9-11.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The possible range is=
 0 - 2047.<br>
<br>
</span>Standard ABI again, no need to document here.<br>
<div><div class=3D"h5"><br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001=
.<wbr>txt b/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr>=
txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c68784e<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/gpio/gpio-lmp92001.<wbr>t=
xt<br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 GPIOs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-gpio&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
&gt; + - gpio-controller: Marks the device node as a gpio controller.<br>
&gt; + - #gpio-cells : Should be two.=C2=A0 The first cell is the pin numbe=
r and the<br>
&gt; +=C2=A0 second cell is used to specify the gpio polarity:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Active high<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Active low<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001_gpio: lmp92001-gpio {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-controll=
er;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #gpio-cells =
=3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp9200=
1-<wbr>adc.txt b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001=
-<wbr>adc.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..34d7809<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/iio/adc/ti-lmp92001-<wbr>=
adc.txt<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 ADCs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-adc&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
&gt; + - ti,lmp92001-adc-mode: adc operation, either continuous or single-s=
hot.<br>
&gt; + - ti,lmp92001-adc-mask: bit mask for which channel is enable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D Off<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D On<br>
<br>
</div></div>There is a standard IIO syntax for defining which channels are =
enabled.<br>
Take a look at other bindings.<br>
<br>
There is often some extra stuff to be specified for each channel so a mask<=
br>
isn&#39;t sufficient.=C2=A0 Hence we use a child node to specify each chann=
el.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-adc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-adc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-a=
dc-mode =3D &quot;continuous&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-a=
dc-mask =3D &lt;0x00000079&gt;;<br>
<br>
</span>Would definitely expect to see an external reference specified here.=
.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; \ No newline at end of file<br>
<br>
</span>Add one please.<br>
<span class=3D""><br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp9200=
1-<wbr>dac.txt b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001=
-<wbr>dac.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..882db9c<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/iio/dac/ti-lmp92001-<wbr>=
dac.txt<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +* Texas Instruments&#39; LMP92001 DACs<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: Must be set to &quot;ti,lmp92001-dac&quot;.<br>
&gt; + - reg: i2c chip address for the device.<br>
&gt; + - ti,lmp92001-dac-hiz: hi-impedance control,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D Forces all OUT[1:12] outputs to hi-=
z, 0 =3D normal<br>
<br>
</span>Leave control of this to userspace unless it is a feature controlled=
<br>
by the associated circuitry.<br>
<span class=3D""><br>
&gt; + - ti,lmp92001-dac-outx:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 1 =3D will force associated OUT=
x outputs to VDD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cy =3D 0, 0 =3D will force associated OUT=
x outputs to GND<br>
&gt; + - ti,lmp92001-dac-gang: What group of Cy is governed to.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 Cy=C2=A0 =C2=A0| CDAC:GANG =3D 0 =
| CDAC:GANG =3D 1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C1=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
1:4]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[1:3]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C2=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
5:6]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[4:6]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C3=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
7:8]=C2=A0 =C2=A0 |=C2=A0 =C2=A0 OUT[7:9]=C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 C4=C2=A0 =C2=A0|=C2=A0 =C2=A0OUT[=
9:12]=C2=A0 =C2=A0|=C2=A0 =C2=A0 OUT[10:12] |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ------------------------------<wbr>------=
-----<br>
<br>
</span>If this is here, then why are we exposing it to userspace?<br>
Either this is a feature of the hardware or it&#39;s not...<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +Example:<br>
&gt; +lmp92001@20 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,lmp92001&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x20&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmp92001-dac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =
=3D &quot;ti,lmp92001-dac&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-hiz=C2=A0 =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-outx =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,lmp92001-d=
ac-gang =3D /bits/ 8 &lt;0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig<br>
&gt; index 461d6fc..5962ea0 100644<br>
&gt; --- a/drivers/gpio/Kconfig<br>
&gt; +++ b/drivers/gpio/Kconfig<br>
&gt; @@ -948,6 +948,13 @@ config GPIO_KEMPLD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a mo=
dule. If so, the module will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0called gpio-kempld.<br>
&gt;<br>
&gt; +config GPIO_LMP92001<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;LMP92001 GPIOs&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LMP92001<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to access the GPIO sig=
nals of TI LMP92001 Analog System<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Monitor and Controller.<br>
&gt; +<br>
&gt;=C2=A0 config GPIO_LP3943<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI/National Semiconductor LP3=
943 GPIO expander&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LP3943<br>
&gt; diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile<br>
&gt; index a9fda6c..560d59c 100644<br>
&gt; --- a/drivers/gpio/Makefile<br>
&gt; +++ b/drivers/gpio/Makefile<br>
&gt; @@ -62,6 +62,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL) +=3D gpio-janz-ttl.o<br>
&gt;=C2=A0 obj-$(CONFIG_GPIO_KEMPLD)=C2=A0 =C2=A0 +=3D gpio-kempld.o<br>
&gt;=C2=A0 obj-$(CONFIG_ARCH_KS8695)=C2=A0 =C2=A0 +=3D gpio-ks8695.o<br>
&gt;=C2=A0 obj-$(CONFIG_GPIO_INTEL_MID) +=3D gpio-intel-mid.o<br>
&gt; +obj-$(CONFIG_GPIO_LMP92001)=C2=A0 +=3D gpio-lmp92001.o<br>
&gt;=C2=A0 obj-$(CONFIG_GPIO_LOONGSON)=C2=A0 +=3D gpio-loongson.o<br>
&gt;=C2=A0 obj-$(CONFIG_GPIO_LP3943)=C2=A0 =C2=A0 +=3D gpio-lp3943.o<br>
&gt;=C2=A0 obj-$(CONFIG_GPIO_LPC18XX)=C2=A0 =C2=A0+=3D gpio-lpc18xx.o<br>
&gt; diff --git a/drivers/gpio/gpio-lmp92001.c b/drivers/gpio/gpio-lmp92001=
.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b80ba4e<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpio/gpio-lmp92001.c<br>
&gt; @@ -0,0 +1,209 @@<br>
&gt; +/*<br>
&gt; + * gpio-lmp92001.c - Support for TI LMP92001 GPIOs<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
<br>
</div></div>Drop this blank line.<br>
<div><div class=3D"h5"><br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/bitops.h&gt;<br>
&gt; +#include &lt;linux/gpio/driver.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +#define SGEN_GPI=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0) /* 1 - if any bit =
in SGPI is set. */<br>
&gt; +<br>
&gt; +struct lmp92001_gpio {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_chip gpio_chip;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_get_direction(<wbr>struct gpio_chip *chip, u=
nsigned offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CGPO, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (val &gt;&gt; offset) &amp; BIT(0);<br>
<br>
</div></div>return !!(val &amp; BIT(offset))?<br>
<div><div class=3D"h5"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_direction_in(<wbr>struct gpio_chip *chip, un=
signed offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_update_bits(lmp92001-&gt;<wbr>regma=
p, LMP92001_CGPO, BIT(offset),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(offset))=
;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_get(struct gpio_chip *chip, unsigned offset)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int val, sgen;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Does the GPIO input mode?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Does the GPIO was set?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Reading indicated logic level.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Clear indicated logic level.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_read(lmp92001-&gt;regmap, LMP92001_CGPO, &=
amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((val &gt;&gt; offset) &amp; BIT(0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(lmp92001-=
&gt;regmap, LMP92001_SGEN, &amp;sgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sgen &amp; SGEN_G=
PI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_read(lmp92001-&gt;regmap, LMP92001_SGPI, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP92001_CGPO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00xFF, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !!(val &amp; BIT(offset));<br>
<br>
</div></div>Consistency!<br>
<span class=3D""><br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_direction_out(<wbr>struct gpio_chip *chip, u=
nsigned offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int value)<br>
<br>
</span>Fix indenting of parameters to align please.<br>
<span class=3D""><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_update_bits(lmp92001-&gt;<wbr>regma=
p, LMP92001_CGPO, BIT(offset),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 &lt;&lt; o=
ffset);<br>
<br>
</span>shifting 0 does seem a little odd.<br>
<div><div class=3D"h5"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static void lmp92001_gpio_set(struct gpio_chip *chip, unsigned offset=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP9=
2001_CGPO, BIT(offset),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &lt;&lt; offset);<br>
&gt; +}<br>
&gt; +<br>
&gt; +#ifdef CONFIG_DEBUG_FS<br>
&gt; +static void lmp92001_gpio_dbg_show(struct seq_file *s, struct gpio_ch=
ip *chip)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D gpiochip_=
get_data(chip);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D lmp92001_gpio-&gt;l=
mp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cgpo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *label, *dir, *logic;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; chip-&gt;ngpio; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D i + chip-&gt=
;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D gpiochip_is=
_requested(chip, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!label)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(lmp92001-=
&gt;regmap, LMP92001_CGPO, &amp;cgpo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((cgpo&gt;&gt;i) &=
amp; BIT(0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dir =3D &quot;in&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dir =3D &quot;out&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lmp92001_gpio_get=
(chip, i))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0logic =3D &quot;hi&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0logic =3D &quot;lo&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(s, &quot; =
gpio-%-3d (%-20.20s) %-3.3s %-2.2s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio, label, dir, logic);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +#define lmp92001_gpio_dbg_show NULL<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static struct gpio_chip lmp92001_gpio_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.label=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;lmp92001&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get_direction=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D lmp92001_gpio_get_direction,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.direction_input=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D l=
mp92001_gpio_direction_in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.get=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp92001_gpio_get,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.direction_output=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D l=
mp92001_gpio_direction_out,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp92001_gpio_set,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dbg_show=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D lmp92001_gpio_dbg_show,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(pde=
v-&gt;dev.<wbr>parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio =3D devm_kzalloc(&amp;pdev-&gt;dev,=
 sizeof(*lmp92001_gpio),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!lmp92001_gpio)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;lmp92001 =3D lmp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip =3D lmp92001_gpio_chi=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.ngpio =3D 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.<wbr>parent =3D &amp;=
pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_gpio-&gt;gpio_chip.base =3D -1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_gpiochip_add_data(&amp;pdev-&gt;<wbr=
>dev, &amp;lmp92001_gpio-&gt;gpio_chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_gpi=
o);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;could not register gpiochip, %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, lmp92001_gpio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_gpio_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001_gpio *lmp92001_gpio =3D platform_=
get_drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_gpiochip_remove(&amp;pdev-&gt;<wbr>dev, &amp=
;lmp92001_gpio-&gt;gpio_chip);<br>
<br>
</div></div>Look up what devm is all about please.=C2=A0 This is not needed=
 - nor is the<br>
remove at all...<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_gpio_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-gpio&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_gpio_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_gpio_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_gpio_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp9200=
1_gpio_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_<wbr>gpio_init);<br>
<br>
</span>Do we actually need to do this as a subsys_initcall rather than<br>
relying on deferred probing?<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +static void __exit lmp92001_gpio_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_gpi=
o_driver);<br>
&gt; +}<br>
&gt; +module_exit(lmp92001_gpio_<wbr>exit);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@g=
mail.com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;GPIO interface for TI LMP92001&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; +MODULE_ALIAS(&quot;platform:<wbr>lmp92001-gpio&quot;);<br>
&gt; diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig<br>
&gt; index 614fa41..2adeba5 100644<br>
&gt; --- a/drivers/iio/adc/Kconfig<br>
&gt; +++ b/drivers/iio/adc/Kconfig<br>
&gt; @@ -331,6 +331,16 @@ config IMX7D_ADC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a mo=
dule. If so, the module will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0called imx7d_adc.<br>
&gt;<br>
&gt; +config LMP92001_ADC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI LMP92001 ADC Driver&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LMP92001<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you say yes here you get support=
 for TI LMP92001 ADCs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conversion.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a =
module. If so, the module will<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be called lmp92001_adc.<br>
&gt; +<br>
&gt;=C2=A0 config LP8788_ADC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;LP8788 ADC driver&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MFD_LP8788<br>
&gt; diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile<br>
&gt; index b546736a..2ed8986 100644<br>
&gt; --- a/drivers/iio/adc/Makefile<br>
&gt; +++ b/drivers/iio/adc/Makefile<br>
&gt; @@ -31,6 +31,7 @@ obj-$(CONFIG_HI8435) +=3D hi8435.o<br>
&gt;=C2=A0 obj-$(CONFIG_HX711) +=3D hx711.o<br>
&gt;=C2=A0 obj-$(CONFIG_IMX7D_ADC) +=3D imx7d_adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_INA2XX_ADC) +=3D ina2xx-adc.o<br>
&gt; +obj-$(CONFIG_LMP92001_ADC) +=3D lmp92001-adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_LP8788_ADC) +=3D lp8788_adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_LPC18XX_ADC) +=3D lpc18xx_adc.o<br>
&gt;=C2=A0 obj-$(CONFIG_LPC32XX_ADC) +=3D lpc32xx_adc.o<br>
&gt; diff --git a/drivers/iio/adc/lmp92001-<wbr>adc.c b/drivers/iio/adc/lmp=
92001-<wbr>adc.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8e64b51<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/iio/adc/lmp92001-<wbr>adc.c<br>
&gt; @@ -0,0 +1,500 @@<br>
&gt; +/*<br>
&gt; + * lmp92001-adc.c - Support for TI LMP92001 ADCs<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x and ad5064 drivers.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/iio/iio.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/mfd/core.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +#define CGEN_STRT=C2=A0 =C2=A0 (1 &lt;&lt; 0) /* Is continuous conver=
sion all of ADCs? */<br>
&gt; +#define CGEN_LCK=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1) /* Is lock the HW =
register? */<br>
<br>
</div></div>BIT() where appropriate.<br>
<span class=3D""><br>
&gt; +#define CGEN_RST=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7) /* Reset all regis=
ters. */<br>
&gt; +<br>
&gt; +#define CREF_AEXT=C2=A0 =C2=A0 (1 &lt;&lt; 1) /* 1 - ADC external ref=
erence.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 - ADC internal reference.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
</span>Just move the comments above rather than doing this - also<br>
please use standard multiline comment syntax.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +static int lmp92001_read_raw(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int *val, int *val2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long mask)<br>
<br>
</span>Align paramaters.<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int code, cgen, sgen, try;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;adc_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CGEN, &amp;cgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Is not continuous conversion?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Lock the HW registers (if needed).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Triggering single-short conversion.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Waiting for conversion successfully.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CGEN_STRT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(cgen &amp; CGEN=
_LCK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CGE=
N, CGEN_LCK, CGEN_LCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Writing any value =
to triggered Single-Shot conversion. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(=
lmp92001-&gt;regmap, LMP92001_CTRIG, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* In case of convers=
ion is in-progress, repeat for 10 times. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try =3D 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0LMP92001_SGEN, &amp;sgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((sgen &amp; =
CGEN_RST) &amp;&amp; (--try &gt; 0));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!try) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D -ETIME;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
</div></div>Move this whole block to be single shot only.=C2=A0 Keep contin=
uous for<br>
triggered buffer usage.<br>
<br>
Does this device have a dataready interrupt? Otherwise you&#39;ll probably =
want to<br>
do buffers with out the trigger and use a thread to monitor this complete<b=
r>
signal at 2x the expected frequency (so we don&#39;t miss any samples).<br>
<span class=3D""><br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, 0x1F + c=
hannel-&gt;channel, &amp;code);<br>
</span>unlock here.<br>
<span class=3D"">&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;t=
ype) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_TEMP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*val =3D code;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D IIO_VAL_INT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* In case of no match channel info/type is retur=
n here. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
</span>Move this into the default and direct return in the switch statement=
.<br>
<br>
You will need an error handling path still to do the unlock of course.<br>
<span class=3D""><br>
<br>
&gt; +<br>
&gt; +exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;adc_<wbr>lock);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_info lmp92001_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read_raw =3D lmp92001_read_raw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_module =3D THIS_MODULE,<br>
<br>
</span>I&#39;ll probably clean this up during a merge, but the need<br>
to set driver_module is going away very soon.<br>
<div><div class=3D"h5"><br>
&gt; +};<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_avref_read(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CREF, &amp;cref);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cref &amp; =
CREF_AEXT ? &quot;external&quot; : &quot;internal&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_avref_write(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;external&quot;, buf, 8) =3D=3D =
0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;internal&quot;, buf, 8) =
=3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CREF, CREF_AEXT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_enable_read(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int reg, cad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
</div></div>As stated below, do this all by supplying triggered=C2=A0 buffe=
r support.<br>
For sysfs reads the overhead is huge anyway so just use oneshot.<br>
It&#39;s not a fast path in any sensible userspace code.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (channel-&gt;channel) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 1 ... 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 9 ... 16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD2=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 17:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD3=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, reg, &am=
p;cad);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (channel-&gt;channel &lt;=3D 8)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D chann=
el-&gt;channel - 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (channel-&gt;channel &gt; 8)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D chann=
el-&gt;channel - 9;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (channel-&gt;channel &gt; 16)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad &gt;&gt;=3D chann=
el-&gt;channel - 17;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cad &amp; B=
IT(0) ? &quot;enable&quot; : &quot;disable&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_enable_write(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int reg, enable, shif, mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (channel-&gt;channel) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 1 ... 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&gt=
;channel - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 9 ... 16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD2=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&gt=
;channel - 9);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 17:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D LMP92001_CAD3=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shif =3D (channel-&gt=
;channel - 17);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;enable&quot;, buf, 6) =3D=3D 0)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;disable&quot;, buf, 7) =3D=
=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enable &lt;&lt;=3D shif;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D 1 &lt;&lt; shif;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, reg, mask, enable);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_mode_read(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cgen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CGEN, &amp;cgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cgen &amp; BIT(0) ? &quot;continuous&quot; : &quot;single-shot&quot;=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_mode_write(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uintptr_t private, struct iio_chan_spec const *ch=
annel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
</div></div>iio_priv.<br>
<span class=3D"">&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cgen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;continuous&quot;, buf, 10) =3D=
=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;single-shot&quot;, buf, 11=
) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Unlock the HW registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Set conversion mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Lock the HW registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CGEN, CGEN_LCK, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
</span>I&#39;d suggest a utility function for the unlock, update, lock cycl=
e.<br>
<span class=3D"">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CGEN, CGEN_STRT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CGEN, CGEN_LCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGEN_LCK);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_chan_spec_ext_info lmp92001_ext_info[] =3D {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vref&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_av=
ref_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_a=
vref_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHARED_BY_ALL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
</span>}, { preferred.<br>
<span class=3D"">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.nam=
e =3D &quot;en&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_en=
able_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_e=
nable_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SEPAR=
ATE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;mode&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_mo=
de_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_m=
ode_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHARE=
D_BY_ALL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
<br>
</span>As ever with custom ABI, these need a lot of justifying before we&#3=
9;ll<br>
take them.=C2=A0 The result of this stuff is that standard userspace code h=
as<br>
no idea what to do with this device to make it work.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct iio_event_spec lmp92001_events[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D IIO_EV_TYPE=
_THRESH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dir =3D IIO_EV_DIR_R=
ISING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask_separate =3D BI=
T(IIO_EV_INFO_ENABLE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT(IIO_EV_INFO_VALUE),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D IIO_EV_TYPE=
_THRESH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.dir =3D IIO_EV_DIR_F=
ALLING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask_separate =3D BI=
T(IIO_EV_INFO_ENABLE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT(IIO_EV_INFO_VALUE),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define LMP92001_CHAN_SPEC(_ch, _type, _event, _nevent) \<br>
&gt; +{ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.channel =3D _ch, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.type =3D _type, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.indexed =3D 1, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.event_spec =3D _event, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.num_event_specs =3D _nevent, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.ext_info =3D lmp92001_ext_info, \<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_chan_spec lmp92001_adc_channels[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(1, IIO_VOLTAGE, lmp92001_event=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(2, IIO_VOLTAGE, lmp92001_event=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(3, IIO_VOLTAGE, lmp92001_event=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(4, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(5, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(6, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(7, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(8, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(9, IIO_VOLTAGE, lmp92001_event=
s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(10, IIO_VOLTAGE, lmp92001_even=
ts,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(11, IIO_VOLTAGE, lmp92001_even=
ts,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ARRAY_SIZE(lmp92001_events)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(12, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(13, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(14, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(15, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(16, IIO_VOLTAGE, NULL, 0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(17,=C2=A0 =C2=A0 IIO_TEMP, NUL=
L, 0),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int lmp92001_adc_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(pde=
v-&gt;dev.<wbr>parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *conversion;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cgen =3D 0, cad1, cad2, cad3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pdev-&gt=
;<wbr>dev, sizeof(*lmp92001));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;adc_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iio_device_set_drvdata(indio_<wbr>dev, lmp92001);=
<br>
<br>
</div></div>Why?=C2=A0 You can always get the lmp92001 from iio_priv(indio_=
dev)<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;dev.parent =3D &amp;pdev-&gt;dev;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_adc_channels;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp9200=
1_adc_<wbr>channels);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CGEN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CGEN_RST, CG=
EN_RST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to self reset all registers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Turn on all of them, if you are pretty sure th=
ey are must be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * real-time update or specify which channel is n=
eeded to be used to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * save conversion time for a cycle.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32(np, &quot;ti,lmp9200=
1-adc-mask&quot;, &amp;mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D cad2 =3D cad=
3 =3D 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&g=
t;dev, &quot;turn on all of channels by default\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad1 =3D mask &amp; 0=
xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad2 =3D (mask &gt;&g=
t; 8) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cad3 =3D (mask &gt;&g=
t; 16) &amp; 0xFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</div></div>If you need these efficiencies, use the buffered mode interface=
 of IIO and<br>
switch into continuous mode with just the right channels.=C2=A0 For single =
reads<br>
use oneshot.<br>
<br>
This will then all be handled in the update_scan_mask callback.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CAD1, 0xFF, cad1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable/disable channels 1-8\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CAD2, 0xFF, cad2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to enable/disable channels 9-16\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CAD3, BIT(0), cad3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to enable/disable channel 17 (temperature)\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string_index(<wbr>np, &q=
uot;ti,lmp92001-adc-mode&quot;, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;conversion);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;con=
tinuous&quot;, conversion, 10) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cgen |=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strncmp(&q=
uot;single-shot&quot;, conversion, 11) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Okay */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;wrong adc mode! set to single-short conversion\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&g=
t;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;single-short conversion was chosen by default\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Lock the HW registers and set conversion mode.=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMP92001_CGE=
N, CGEN_LCK | CGEN_STRT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgen | CGEN_=
LCK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, indio_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return devm_iio_device_register(&amp;<wbr>pdev-&g=
t;dev, indio_dev);<br>
<br>
</div></div>Can&#39;t do this as you need to unwind some setup. Do it with =
iio_device_register<br>
and manually unwind in remove.<br>
<span class=3D""><br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_adc_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D platform_get_drvdat=
a(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * To stop ADC conversion to save power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Unlock the HW registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Set conversion mode to single-shot.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Lock the HW registers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP9=
2001_CGEN, CGEN_LCK, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP9=
2001_CGEN, CGEN_STRT, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(lmp92001-&gt;<wbr>regmap, LMP9=
2001_CGEN, CGEN_LCK, CGEN_LCK);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_iio_device_unregister(&amp;<wbr>pdev-&gt;dev=
, indio_dev);<br>
<br>
</span>Again, look up what devm does.=C2=A0 =C2=A0You can&#39;t use it here=
 though as when used<br>
correctly it will result in remove not being the reverse order of probe.<br=
>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_adc_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-adc&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_adc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_adc_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_adc_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp9200=
1_adc_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_adc_<wbr>init);<br>
</span>Why?<br>
<span class=3D"">&gt; +<br>
&gt; +static void __exit lmp92001_adc_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_adc=
_driver);<br>
&gt; +}<br>
&gt; +module_exit(lmp92001_adc_<wbr>exit);<br>
<br>
</span>use the magic platform macros to drop this boiler plate unless<br>
you have a good reason for the subsys_initcall.<br>
<div><div class=3D"h5">&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@g=
mail.com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;IIO ADC interface for TI LMP92001&quot;);<br=
>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; +MODULE_ALIAS(&quot;platform:<wbr>lmp92001-adc&quot;);<br>
&gt; diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig<br>
&gt; index 25bed2d..3e0d816 100644<br>
&gt; --- a/drivers/iio/dac/Kconfig<br>
&gt; +++ b/drivers/iio/dac/Kconfig<br>
&gt; @@ -221,6 +221,15 @@ config DPOT_DAC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module, c=
hoose M here: the module will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0called dpot-dac.<br>
&gt;<br>
&gt; +config LMP92001_DAC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;TI LMP92001 DAC Driver&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on MFD_LMP92001<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you say yes here you get suppor=
t for TI LMP92001 DACs.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver can also be built as a=
 module. If so, the module will<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be called lmp92001_dac.<br>
&gt; +<br>
&gt;=C2=A0 config LPC18XX_DAC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;NXP LPC18xx DAC driver&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_LPC18XX || COMPILE_TEST<br>
&gt; diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile<br>
&gt; index 603587c..516d2be 100644<br>
&gt; --- a/drivers/iio/dac/Makefile<br>
&gt; +++ b/drivers/iio/dac/Makefile<br>
&gt; @@ -23,6 +23,7 @@ obj-$(CONFIG_AD7303) +=3D ad7303.o<br>
&gt;=C2=A0 obj-$(CONFIG_AD8801) +=3D ad8801.o<br>
&gt;=C2=A0 obj-$(CONFIG_CIO_DAC) +=3D cio-dac.o<br>
&gt;=C2=A0 obj-$(CONFIG_DPOT_DAC) +=3D dpot-dac.o<br>
&gt; +obj-$(CONFIG_LMP92001_DAC) +=3D lmp92001-dac.o<br>
&gt;=C2=A0 obj-$(CONFIG_LPC18XX_DAC) +=3D lpc18xx_dac.o<br>
&gt;=C2=A0 obj-$(CONFIG_LTC2632) +=3D ltc2632.o<br>
&gt;=C2=A0 obj-$(CONFIG_M62332) +=3D m62332.o<br>
&gt; diff --git a/drivers/iio/dac/lmp92001-<wbr>dac.c b/drivers/iio/dac/lmp=
92001-<wbr>dac.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8ea981b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/iio/dac/lmp92001-<wbr>dac.c<br>
&gt; @@ -0,0 +1,390 @@<br>
&gt; +/*<br>
&gt; + * lmp92001-dac.c - Support for TI LMP92001 DACs<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
<br>
</div></div>Lots of comments would be about the ABI but we&#39;ve already c=
overed that above.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +#include &lt;linux/iio/iio.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/mfd/core.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +#define CREF_DEXT=C2=A0 =C2=A0 (1 &lt;&lt; 0) /* 1 - DAC external ref=
erence.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 - DAC internal reference.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +#define CDAC_OFF=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0) /* 1 - Forces all =
outputs to high impedance. */<br>
&gt; +#define CDAC_OLVL=C2=A0 =C2=A0 (1 &lt;&lt; 1) /* 1 - Cy=3D0 will forc=
e associated OUTx outputs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0to VDD.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0 - Cy=3D0 will force associate=
d OUTx outputs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0to GND.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +#define CDAC_GANG=C2=A0 =C2=A0 (1 &lt;&lt; 2) /* Controls the associa=
tion of analog output<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* channels OUTx with asynchronous=
 control<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* inputs Cy.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Cy to OUTx Assignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | Cy | CDAC:GANG =3D 0 | CDAC:G=
ANG =3D 1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C1 | OUT[1:4]=C2=A0 =C2=A0 =
=C2=A0 | OUT[1:3]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C2 | OUT[5:6]=C2=A0 =C2=A0 =
=C2=A0 | OUT[4:6]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C3 | OUT[7:8]=C2=A0 =C2=A0 =
=C2=A0 | OUT[7:9]=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* | C4 | OUT[9:12]=C2=A0 =C2=A0 =
=C2=A0| OUT[10:12]=C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ------------------------------<=
wbr>--------<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt; +static int lmp92001_read_raw(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int *val, int *val2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long mask)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;t=
ype) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7F + chann=
el-&gt;channel, val);<br>
</div></div>Again, move the lock in here.<br>
<div><div class=3D"h5">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D IIO_VAL_INT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* In case of no match channel info/type is retur=
n here. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; +<br>
&gt; +exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;dac_<wbr>lock);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int lmp92001_write_raw(struct iio_dev *indio_dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int val, int val2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0long mask)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val &lt; 0 || val &gt; 4095) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (mask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case IIO_CHAN_INFO_RAW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (channel-&gt;t=
ype) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case IIO_VOLTAGE:<br>
</div></div>Move lock in here... Will simplify code flow by allowing direct=
 returns.<br>
<div><div class=3D"h5">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(lmp92001-&gt;regmap,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7F + chann=
el-&gt;channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* In case of no match channel info/type is retur=
n here. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; +<br>
&gt; +exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;lmp92001-&gt;dac_<wbr>lock);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_info lmp92001_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read_raw =3D lmp92001_read_raw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.write_raw =3D lmp92001_write_raw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver_module =3D THIS_MODULE,<br>
&gt; +};<br>
&gt; +<br>
&gt; +ssize_t lmp92001_dvref_read(struct iio_dev *indio_dev, uintptr_t priv=
ate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, char *buf)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CREF, &amp;cref);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cref &amp; =
CREF_DEXT ? &quot;external&quot; : &quot;internal&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +ssize_t lmp92001_dvref_write(struct iio_dev *indio_dev, uintptr_t pri=
vate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, const char *=
buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cref;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;external&quot;, buf, 8) =3D=3D =
0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;internal&quot;, buf, 8) =
=3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CREF, CREF_DEXT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cref);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +ssize_t lmp92001_outx_read(struct iio_dev *indio_dev, uintptr_t priva=
te,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, char *buf)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *outx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CDAC, &amp;cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cdac &amp; CDAC_OFF)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outx =3D &quot;hiz&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cdac &amp; CDAC_O=
LVL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0outx =3D &quot;1 or dac&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0outx =3D &quot;0 or dac&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, outx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +ssize_t lmp92001_outx_write(struct iio_dev *indio_dev, uintptr_t priv=
ate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, const char *=
buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac, mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;hiz&quot;, buf, 3) =3D=3D 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_OFF;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OFF;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;dac&quot;, buf, 3) =3D=
=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~CDAC_OFF;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OFF;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;0&quot;, buf, 1) =3D=3D =
0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~(CDAC_OLVL =
| CDAC_OFF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OLVL | =
CDAC_OFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (strncmp(&quot;1&quot;, buf, 1) =3D=3D =
0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_OLVL;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D CDAC_OLVL | =
CDAC_OFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CDAC, mask, cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +ssize_t lmp92001_gang_read(struct iio_dev *indio_dev, uintptr_t priva=
te,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, char *buf)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_CDAC, &amp;cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, cdac &amp; =
CDAC_GANG ? &quot;1&quot; : &quot;0&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +ssize_t lmp92001_gang_write(struct iio_dev *indio_dev, uintptr_t priv=
ate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_chan_spec const *channel, const char *=
buf, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D iio_device_get_drvd=
ata(indio_<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strncmp(&quot;0&quot;, buf, 1) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D ~CDAC_GANG;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (strncmp(&quot;1&quot;, buf, 1) =3D=3D 0)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac =3D CDAC_GANG;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CDAC, CDAC_GANG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_chan_spec_ext_info lmp92001_ext_info[] =3D {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vref&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_dv=
ref_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_d=
vref_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHARE=
D_BY_ALL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;outx&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_ou=
tx_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_o=
utx_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHARE=
D_BY_ALL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;gang&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D lmp92001_ga=
ng_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D lmp92001_g=
ang_write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D IIO_SHARE=
D_BY_ALL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define LMP92001_CHAN_SPEC(_ch) \<br>
&gt; +{ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.channel =3D _ch, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.type =3D IIO_VOLTAGE, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.indexed =3D 1, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.ext_info =3D lmp92001_ext_info, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.output =3D 1, \<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct iio_chan_spec lmp92001_dac_channels[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(1),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(2),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(3),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(5),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(6),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(7),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(8),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(9),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(10),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(11),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LMP92001_CHAN_SPEC(12),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int lmp92001_dac_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(pde=
v-&gt;dev.<wbr>parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 gang =3D 0, outx =3D 0, hiz =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int cdac =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pdev-&gt=
;<wbr>dev, sizeof(*lmp92001));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;lmp92001-&gt;dac_<wbr>lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iio_device_set_drvdata(indio_<wbr>dev, lmp92001);=
<br>
</div></div>again, why? Use iio_priv(indio_dev) where ever you have been us=
ing<br>
drvdata.<br>
<span class=3D"">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;name =3D pdev-&gt;name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;modes =3D INDIO_DIRECT_MODE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;info =3D &amp;lmp92001_info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;channels =3D lmp92001_dac_channels;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0indio_dev-&gt;num_channels =3D ARRAY_SIZE(lmp9200=
1_dac_<wbr>channels);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-hiz=
&quot;, &amp;hiz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D hiz;<br>
</span>cdac =3D hiz and drop the =3D 0 above.=C2=A0 Also handle errors.<br>
<span class=3D"">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-out=
x&quot;, &amp;outx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D outx &lt;&lt; 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_property_read_u8(np, &quot;ti,lmp92001-dac-gan=
g&quot;, &amp;gang);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cdac |=3D gang &lt;&lt; 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_update_bits(lmp92001-&gt;<wbr>regm=
ap, LMP92001_CDAC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CDAC_GANG | =
CDAC_OLVL | CDAC_OFF, cdac);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, indio_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return devm_iio_device_register(&amp;<wbr>pdev-&g=
t;dev, indio_dev);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_dac_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev =3D platform_get_drvdat=
a(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_iio_device_unregister(&amp;<wbr>pdev-&gt;dev=
, indio_dev);<br>
</span>Same as for the ADC.<br>
<span class=3D"">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver lmp92001_dac_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.<a href=3D"http://driver.name" rel=3D"noreferrer=
" target=3D"_blank">driver.name</a>=C2=A0 =C2=A0 =3D &quot;lmp92001-dac&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_dac_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_dac_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_dac_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>lmp9200=
1_dac_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_dac_<wbr>init);<br>
</span>Why subsys_initcall?<br>
<span class=3D""><br>
&gt; +<br>
&gt; +static void __exit lmp92001_dac_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;<wbr>lmp92001_dac=
_driver);<br>
&gt; +}<br>
&gt; +module_exit(lmp92001_dac_<wbr>exit);<br>
<br>
</span>Standard boilerplate remove macro once you have gotten rid<br>
of the subsys initcall.<br>
<div><div class=3D"h5">&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@g=
mail.com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;IIO DAC interface for TI LMP92001&quot;);<br=
>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; +MODULE_ALIAS(&quot;platform:<wbr>lmp92001-dac&quot;);<br>
&gt; diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig<br>
&gt; index 94ad2c1..a20389a 100644<br>
&gt; --- a/drivers/mfd/Kconfig<br>
&gt; +++ b/drivers/mfd/Kconfig<br>
&gt; @@ -1528,6 +1528,18 @@ config MFD_LM3533<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0additional drivers must be enabled in=
 order to use the LED,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backlight or ambient-light-sensor fun=
ctionality of the device.<br>
&gt;<br>
&gt; +config MFD_LMP92001<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;TI LMP92001 Analog System M=
onitor and Controller&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select MFD_CORE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGMAP_I2C<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say yes here to enable support for =
TI LMP92001 Analog System<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Monitor and Controller<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provide support for 16 =
ADC, 12 DAC, Voltage Reference,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Analog Temperature Sensor and 8-bit=
 GPIO Port.<br>
&gt; +<br>
&gt;=C2=A0 config MFD_TIMBERDALE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Timberdale FPGA&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select MFD_CORE<br>
&gt; diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile<br>
&gt; index 080793b..20d2e65 100644<br>
&gt; --- a/drivers/mfd/Makefile<br>
&gt; +++ b/drivers/mfd/Makefile<br>
&gt; @@ -199,6 +199,10 @@ obj-$(CONFIG_MFD_RN5T618)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D rn5t618.o<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_SEC_CORE)=C2=A0 =C2=A0+=3D sec-core.o sec-irq.o=
<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_SYSCON)=C2=A0 =C2=A0 =C2=A0+=3D syscon.o<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_LM3533)=C2=A0 =C2=A0 =C2=A0+=3D lm3533-core.o l=
m3533-ctrlbank.o<br>
&gt; +<br>
&gt; +lmp92001-objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D lmp92001-core.o lmp92001-i2c.o lmp92001-de=
bug.o<br>
&gt; +obj-$(CONFIG_MFD_LMP92001)=C2=A0 =C2=A0+=3D lmp92001.o<br>
&gt; +<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_VEXPRESS_<wbr>SYSREG)=C2=A0 =C2=A0 +=3D vexpres=
s-sysreg.o<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_RETU)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+=3D retu-mfd.o<br>
&gt;=C2=A0 obj-$(CONFIG_MFD_AS3711)=C2=A0 =C2=A0 =C2=A0+=3D as3711.o<br>
&gt; diff --git a/drivers/mfd/lmp92001-core.c b/drivers/mfd/lmp92001-core.c=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000..55bc9ab<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/mfd/lmp92001-core.c<br>
&gt; @@ -0,0 +1,308 @@<br>
&gt; +/*<br>
&gt; + * lmp92001-core.c - Device access for TI LMP92001<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +#include &lt;linux/mfd/lmp92001/debug.h&gt;<br>
&gt; +<br>
&gt; +static const struct mfd_cell lmp92001_devs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp92=
001-gpio&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D &q=
uot;ti,lmp92001-gpio&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp92=
001-adc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D &q=
uot;ti,lmp92001-adc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp92=
001-dac&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_compatible =3D &q=
uot;ti,lmp92001-dac&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct reg_default lmp92001_defaults[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_SGEN,=C2=A0 0x40=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_SHIL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_SLOL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CGEN,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CDAC,=C2=A0 0x03=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CGPO,=C2=A0 0xFF=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CINH,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CINL,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD1,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD2,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CAD3,=C2=A0 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CTRIG, 0x00=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_CREF,=C2=A0 0x07=C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC1,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC2,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC3,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC4,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC5,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC6,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC7,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC8,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC9,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC10, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC11, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC12, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC13, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC14, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC15, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_ADC16, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH1,=C2=A0 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH2,=C2=A0 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH3,=C2=A0 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH9,=C2=A0 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH10, 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIH11, 0x0FFF },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL1,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL2,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL3,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL9,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL10, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_LIL11, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC1,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC2,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC3,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC4,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC5,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC6,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC7,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC8,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC9,=C2=A0 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC10, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC11, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DAC12, 0x0000 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ LMP92001_DALL,=C2=A0 0x0000 },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static bool lmp92001_reg_readable(struct device *dev, unsigned int re=
g)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ID:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_VER:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SGEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SGPI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SHIL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SLOL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CDAC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CGPO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CINH:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CINL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC7:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC13:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC14:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC15:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC17:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC7:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool lmp92001_reg_writeable(struct device *dev, unsigned int r=
eg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CDAC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CGPO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CINH:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CINL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CAD3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CTRIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIH11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_LIL11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC7:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DALL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool lmp92001_reg_volatile(struct device *dev, unsigned int re=
g)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SGEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SGPI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SHIL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_SLOL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CGEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC7:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC10:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC13:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC14:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC15:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC17:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct regmap_config lmp92001_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 16,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cache_type =3D REGCACHE_RBTREE,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_defaults =3D lmp92001_defaults,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.num_reg_defaults =3D ARRAY_SIZE(lmp92001_default=
s),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_register =3D LMP92001_BLK5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.readable_reg =3D lmp92001_reg_readable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.writeable_reg =3D lmp92001_reg_writeable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.volatile_reg =3D lmp92001_reg_volatile,<br>
&gt; +};<br>
&gt; +<br>
&gt; +int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id,=
 int irq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int comid, ver;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(lmp92001-&gt;dev, lmp92001);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret=C2=A0 =3D regmap_read(lmp92001-&gt;regmap, LM=
P92001_ID, &amp;comid);<br>
<br>
</div></div>Why the two spaces after ret...<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to read Company ID: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret=C2=A0 =3D regmap_read(lmp92001-&gt;regmap, LM=
P92001_VER, &amp;ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to read Version: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(lmp92001-&gt;dev, &quot;Company ID 0x%.2=
x, Version 0x%.2x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0comid, ver);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mfd_add_devices(lmp92001-&gt;dev, PLATFOR=
M_DEVID_AUTO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmp92001_devs, ARRAY_SIZE(lmp92001_devs)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to add children\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D lmp92001_debug_init(lmp92001);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to initial debug fs.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +exit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void lmp92001_device_exit(struct lmp92001 *lmp92001)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_debug_exit(lmp92001);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mfd_remove_devices(lmp92001-&gt;<wbr>dev);<br>
&gt; +}<br>
<br>
</div></div>I&#39;m not convinced there is any benefit in breaking this up =
into lots of files...<br>
<div><div class=3D"h5"><br>
&gt; diff --git a/drivers/mfd/lmp92001-debug.c b/drivers/mfd/lmp92001-debug=
.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d733e67<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/mfd/lmp92001-debug.c<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +/*<br>
&gt; + * lmp92001-debug.c - Debug file system for TI LMP92001<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +static ssize_t lmp92001_id_ver_show(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_attribute *attr, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D dev_get_drvdata(dev=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int comid, ver;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_ID, &amp;comid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to read Company ID: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
</div></div>return ret... everywhere you&#39;ve done this please.<br>
<span class=3D"">&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(lmp92001-&gt;regmap, LMP92001=
_VER, &amp;ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to read Version: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprintf(buf, &quot;Company ID 0x%02x (%d)=
, Version 0x%02x (%d)\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0comid, comid, ver, ver);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
</span>return sprintf(...<br>
<div><div class=3D"h5">&gt; +}<br>
&gt; +static DEVICE_ATTR(lmp92001_id_ver, 0444, lmp92001_id_ver_show, NULL)=
;<br>
&gt; +<br>
&gt; +int lmp92001_debug_init(struct lmp92001 *lmp92001)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D device_create_file(lmp92001-&gt;<wbr>dev,=
 &amp;dev_attr_lmp92001_id_ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;unique ID attribute is not created: %d\n&quot;, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void lmp92001_debug_exit(struct lmp92001 *lmp92001)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0device_remove_file(lmp92001-&gt;<wbr>dev, &amp;de=
v_attr_lmp92001_id_ver);<br>
&gt; +}<br>
&gt; diff --git a/drivers/mfd/lmp92001-i2c.c b/drivers/mfd/lmp92001-i2c.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000..bbb1dad<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/mfd/lmp92001-i2c.c<br>
&gt; @@ -0,0 +1,215 @@<br>
&gt; +/*<br>
&gt; + * lmp92001-i2c.c - I2C access for TI LMP92001<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_gpio.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;linux/mfd/lmp92001/core.h&gt;<br>
&gt; +<br>
&gt; +static const unsigned short lmp92001_i2c_addresses[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A00x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E, 0=
x50, I2C_CLIENT_END<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* TODO: To read/write block access, it may need to re-ordering endia=
nness! */<br>
&gt; +static int lmp92001_reg_read(void *context, unsigned int reg, unsigne=
d int *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *i2c =3D to_i2c_client(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ID ... LMP92001_CTRIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_byte_data(i2c, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1 ... LMP92001_LIL11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1 ... LMP92001_DALL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_word_swapped(<wbr>i2c, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0 ... LMP92001_BLK5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_rea=
d_block_data(i2c, reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)*val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &lt;=3D LMP92001_DALL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D ret;<br>
</div></div>Cleaner to push this up into the case statements perhaps? Or at=
 least<br>
return ret for the BLK one up there.<br>
<div><div class=3D"h5">&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_reg_write(void *context, unsigned int reg, unsign=
ed int val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D context;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *i2c =3D to_i2c_client(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg &gt; 0xff)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ID ... LMP92001_CTRIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_CREF:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_byte_data(i2c, reg, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_ADC1 ... LMP92001_LIL11:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_DAC1 ... LMP92001_DALL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_word_swapped(<wbr>i2c, reg, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* To call this function/case, must be passed val=
 as pointer */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_block_data(<wbr>i2c, reg, 24,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK5:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_block_data(<wbr>i2c, reg, 12,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_block_data(<wbr>i2c, reg, 34,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case LMP92001_BLK3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_wri=
te_block_data(<wbr>i2c, reg, 18,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(u8 *)((uintptr_t)val));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_i2c_probe(struct i2c_client *i2c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct i2c_device_id *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001 =3D devm_kzalloc(&amp;i2c-&gt;dev, sizeo=
f(struct lmp92001), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!lmp92001)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(i2c, lmp92001);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001-&gt;dev =3D &amp;i2c-&gt;dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_regmap_config.reg_<wbr>read =3D lmp92001=
_reg_read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_regmap_config.reg_<wbr>write =3D lmp9200=
1_reg_write;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001-&gt;regmap =3D devm_regmap_init(&amp;i2c=
-&gt;dev, NULL, &amp;i2c-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;lmp92001_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(lmp92001-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(lmp92=
001-&gt;regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(lmp92001-&gt;=
dev, &quot;failed to allocate register map: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return lmp92001_device_init(lmp92001, id-&gt;driv=
er_data, i2c-&gt;irq);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lmp92001_i2c_remove(struct i2c_client *i2c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct lmp92001 *lmp92001 =3D i2c_get_clientdata(=
i2c);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0lmp92001_device_exit(lmp92001)<wbr>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +static const struct of_device_id lmp92001_dt_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;ti,lmp92001&quot;, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, lmp92001_dt_ids);<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static const struct i2c_device_id lmp92001_i2c_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;lmp92001&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(i2c, lmp92001_i2c_ids);<br>
&gt; +<br>
&gt; +static int lmp92001_i2c_detect(struct i2c_client *i2c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_board_info *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_adapter *adapter =3D i2c-&gt;adapter;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0s32 comid, ver;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!i2c_check_functionality(<wbr>adapter,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_SMB=
US_BYTE_DATA |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_SMB=
US_WORD_DATA |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2C_FUNC_SMB=
US_BLOCK_DATA))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0comid =3D i2c_smbus_read_byte_data(i2c, LMP92001_=
ID);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ver =3D i2c_smbus_read_byte_data(i2c, LMP92001_VE=
R);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (comid !=3D 0x01 || ver !=3D 0x10)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct i2c_driver lmp92001_i2c_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;lmp92=
001&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D o=
f_match_ptr(lmp92001_dt_ids),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D lmp9=
2001_i2c_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_i2c_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp92001_=
i2c_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.detect=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D lmp9=
2001_i2c_detect,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.address_list=C2=A0 =C2=A0=3D lmp92001_i2c_addres=
ses,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init lmp92001_i2c_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return i2c_add_driver(&amp;lmp92001_i2c_<wbr>driv=
er);<br>
&gt; +}<br>
&gt; +subsys_initcall(lmp92001_i2c_<wbr>init);<br>
&gt; +<br>
&gt; +static void __exit lmp92001_i2c_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c_del_driver(&amp;lmp92001_i2c_<wbr>driver);<br=
>
&gt; +}<br>
&gt; +module_exit(lmp92001_i2c_<wbr>exit);<br>
&gt; +<br>
&gt; +MODULE_DESCRIPTION(&quot;i2c driver for TI LMP92001&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@g=
mail.com">s.abhisit@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; diff --git a/include/linux/mfd/lmp92001/<wbr>core.h b/include/linux/mf=
d/lmp92001/<wbr>core.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9039000<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/linux/mfd/lmp92001/<wbr>core.h<br>
&gt; @@ -0,0 +1,119 @@<br>
&gt; +/*<br>
&gt; + * include/linux/mfd/lmp92001/<wbr>core.h - Core interface for TI LMP=
92001<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __MFD_LMP92001_CORE_H__<br>
&gt; +#define __MFD_LMP92001_CORE_H__<br>
&gt; +<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/mfd/core.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Register values.<br>
&gt; + */<br>
&gt; +/* ID */<br>
&gt; +#define LMP92001_ID=C2=A0 0x0E<br>
&gt; +#define LMP92001_VER 0x0F<br>
&gt; +/* STATUS */<br>
&gt; +#define LMP92001_SGEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10<br>
&gt; +#define LMP92001_SGPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x11<br>
&gt; +#define LMP92001_SHIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x12<br>
&gt; +#define LMP92001_SLOL=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x13<br>
&gt; +/* CONTROL */<br>
&gt; +#define LMP92001_CGEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x14<br>
&gt; +#define LMP92001_CDAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x15<br>
&gt; +#define LMP92001_CGPO=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x16<br>
&gt; +#define LMP92001_CINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x17<br>
&gt; +#define LMP92001_CINL=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x18<br>
&gt; +#define LMP92001_CAD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x19<br>
&gt; +#define LMP92001_CAD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1A<br>
&gt; +#define LMP92001_CAD3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1B<br>
&gt; +#define LMP92001_CTRIG=C2=A0 =C2=A0 =C2=A0 =C2=A00x1C<br>
&gt; +/* ADC OUTPUT DATA */<br>
&gt; +#define LMP92001_ADC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20<br>
&gt; +#define LMP92001_ADC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x21<br>
&gt; +#define LMP92001_ADC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x22<br>
&gt; +#define LMP92001_ADC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x23<br>
&gt; +#define LMP92001_ADC5=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x24<br>
&gt; +#define LMP92001_ADC6=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x25<br>
&gt; +#define LMP92001_ADC7=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x26<br>
&gt; +#define LMP92001_ADC8=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x27<br>
&gt; +#define LMP92001_ADC9=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x28<br>
&gt; +#define LMP92001_ADC10=C2=A0 =C2=A0 =C2=A0 =C2=A00x29<br>
&gt; +#define LMP92001_ADC11=C2=A0 =C2=A0 =C2=A0 =C2=A00x2A<br>
&gt; +#define LMP92001_ADC12=C2=A0 =C2=A0 =C2=A0 =C2=A00x2B<br>
&gt; +#define LMP92001_ADC13=C2=A0 =C2=A0 =C2=A0 =C2=A00x2C<br>
&gt; +#define LMP92001_ADC14=C2=A0 =C2=A0 =C2=A0 =C2=A00x2D<br>
&gt; +#define LMP92001_ADC15=C2=A0 =C2=A0 =C2=A0 =C2=A00x2E<br>
&gt; +#define LMP92001_ADC16=C2=A0 =C2=A0 =C2=A0 =C2=A00x2F<br>
&gt; +#define LMP92001_ADC17=C2=A0 =C2=A0 =C2=A0 =C2=A00x30<br>
&gt; +/* ADC WINDOW COMPARATOR LIMITS */<br>
&gt; +#define LMP92001_LIH1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40<br>
&gt; +#define LMP92001_LIH2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x41<br>
&gt; +#define LMP92001_LIH3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x42<br>
&gt; +#define LMP92001_LIH9=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x43<br>
&gt; +#define LMP92001_LIH10=C2=A0 =C2=A0 =C2=A0 =C2=A00x44<br>
&gt; +#define LMP92001_LIH11=C2=A0 =C2=A0 =C2=A0 =C2=A00x45<br>
&gt; +#define LMP92001_LIL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x46<br>
&gt; +#define LMP92001_LIL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x47<br>
&gt; +#define LMP92001_LIL3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x48<br>
&gt; +#define LMP92001_LIL9=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x49<br>
&gt; +#define LMP92001_LIL10=C2=A0 =C2=A0 =C2=A0 =C2=A00x4A<br>
&gt; +#define LMP92001_LIL11=C2=A0 =C2=A0 =C2=A0 =C2=A00x4B<br>
&gt; +/* INTERNAL REFERENCE CONTROL */<br>
&gt; +#define LMP92001_CREF=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x66<br>
&gt; +/* DAC INPUT DATA */<br>
&gt; +#define LMP92001_DAC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x80<br>
&gt; +#define LMP92001_DAC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x81<br>
&gt; +#define LMP92001_DAC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x82<br>
&gt; +#define LMP92001_DAC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x83<br>
&gt; +#define LMP92001_DAC5=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x84<br>
&gt; +#define LMP92001_DAC6=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x85<br>
&gt; +#define LMP92001_DAC7=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x86<br>
&gt; +#define LMP92001_DAC8=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x87<br>
&gt; +#define LMP92001_DAC9=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x88<br>
&gt; +#define LMP92001_DAC10=C2=A0 =C2=A0 =C2=A0 =C2=A00x89<br>
&gt; +#define LMP92001_DAC11=C2=A0 =C2=A0 =C2=A0 =C2=A00x8A<br>
&gt; +#define LMP92001_DAC12=C2=A0 =C2=A0 =C2=A0 =C2=A00x8B<br>
&gt; +#define LMP92001_DALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x90<br>
&gt; +/* MEMORY MAPPED BLOCK COMMANDS */<br>
&gt; +#define LMP92001_BLK0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF0<br>
&gt; +#define LMP92001_BLK1=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF1<br>
&gt; +#define LMP92001_BLK2=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF2<br>
&gt; +#define LMP92001_BLK3=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF3<br>
&gt; +#define LMP92001_BLK4=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF4<br>
&gt; +#define LMP92001_BLK5=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF5<br>
&gt; +<br>
&gt; +struct lmp92001 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex adc_lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex dac_lock;<br>
&gt; +};<br>
&gt; +<br>
&gt; +extern struct regmap_config lmp92001_regmap_config;<br>
&gt; +<br>
&gt; +int lmp92001_device_init(struct lmp92001 *lmp92001, unsigned long id,=
 int irq);<br>
&gt; +void lmp92001_device_exit(struct lmp92001 *lmp92001);<br>
&gt; +<br>
&gt; +#endif /* __MFD_LMP92001_CORE_H__ */<br>
&gt; diff --git a/include/linux/mfd/lmp92001/<wbr>debug.h b/include/linux/m=
fd/lmp92001/<wbr>debug.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..efef95f<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/linux/mfd/lmp92001/<wbr>debug.h<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +/*<br>
&gt; + * include/linux/mfd/lmp92001/<wbr>debug.h - Debug interface for TI 9=
2001<br>
&gt; + *<br>
&gt; + * Copyright 2016-2017 Celestica Ltd.<br>
&gt; + *<br>
&gt; + * Author: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com"=
>s.abhisit@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Inspired by wm831x driver.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __MFD_LMP92001_DEBUG_H__<br>
&gt; +#define __MFD_LMP92001_DEBUG_H__<br>
&gt; +<br>
&gt; +int lmp92001_debug_init(struct lmp92001 *lmp92001);<br>
&gt; +void lmp92001_debug_exit(struct lmp92001 *lmp92001);<br>
&gt; +<br>
&gt; +#endif /* __MFD_LMP92001_DEBUG_H__ */<br>
<br>
</div></div>Ran out of time towards the end of this so review was rather le=
ss detailed!<br>
<br>
Will take a look at the next version after you&#39;ve broken this up.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jonathan<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a114b24d45a1d370557586f10--
