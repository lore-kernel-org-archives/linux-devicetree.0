From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/4] of: introduce of_dev_get_platdata()
Date: Fri, 28 Aug 2015 07:59:06 -0500
Message-ID: <CAL_JsqKH2_w2E9zAA=aJ3q+p4zr88Q6KMS1U-sWdw3JUndUnEA@mail.gmail.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440753128-3288-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 4:12 AM, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org> wrote:
> New function, 'of_dev_get_platdata()'
>  - provides unified handling of getting device platform data
>  - supports DT and non-DT(legacy) cases
>  - removes duplicated code from each driver
>  - keeps driver specific code simple in each driver

This works in cases where DT data and platform_data are aligned. In
many cases they are not. A common binding problem is people blindly
copying platform_data fields to DT properties for things that are not
h/w properties. I worry that this would encourage this behavior.

We already have a generalized method for retrieving properties
independent of DT or ACPI. There's no reason this couldn't be extended
to retrieve properties out of platform_data using the same interface.

Also, perhaps in some drivers we can remove platform_data now if all
users are converted to DT.

Rob

>
> Issues
> ------
> On loading a driver, the driver tries to get the platform data.
> * Check conditions prior to parsing the DT
>   You can see various/not general way of checking the platform data.
>
>   case 1) driver checks whether the platform data is null or not.
>
>         foo_platform_data *pdata = dev_get_platdata(dev);
>         if (!pdata) {
>                 pdata = foo_parse_dt();
>                 if (IS_ERR(pdata))
>                         return PTR_ERR(pdata);
>         }
>
>   case 2) driver checks whether 'of_node' exists or not.
>
>         if (dev.of_node) {
>                 pdata = foo_parse_dt();
>                 if (IS_ERR(pdata))
>                         return PTR_ERR(pdata);
>         }
>
>   case 3) check both
>
>         if (pdata) {
>                 copy pdata into driver private data
>         } else if (dev.of_node) {
>                 pdata = foo_parse_dt();
>         }
>
>   Check conditions are very depend on the driver, but it can be unified.
>   of_dev_get_platdata() provides unified handling. So the driver can reduce
>   if-condition statements.
>
> * Memory allocation in each parser
>   In most cases, driver allocates the platform data inside its DT parser.
>
>   static struct foo_platform_data *foo_parse_dt()
>   {
>         allocates memory for generating platform data.
>         parsing DT properties and copy them into the platform data.
>   }
>
>   of_dev_get_platdata() allocates the platform data internally.
>   And it calls back to the driver specific parser function. It removes
>   memory allocation code in each driver.
>
> * Two types of parser definition
>   Many drivers implement DT parser in two cases, '#ifdef CONFIG_OF' and
>   '#else'.
>
>   #ifdef CONFIG_OF
>   static struct foo_platform_data *foo_parse_dt()
>   {
>         (snip)
>   }
>   #else
>   static struct foo_platform_data *foo_parse_dt()
>   {
>         return NULL;
>   }
>   #endif
>
>   of_dev_get_platdata() supports both cases. It removes few lines of code
>   in each driver.
>
> What of_dev_get_platdata() does
> -------------------------------
>   if CONFIG_OF is not defined, return legacy code, 'dev_get_platdata()'.
>   if platform data exists, just return it.
>   if platform data is null, check the 'of node'.
>     if of_node is null, then return NULL.
>     Otherwise, allocates memory for platform data.
>     Call back to the driver(caller) with allocated platform data and
>     private data if needed.
>     Then, driver will parse the DT internally and handle errors.
>
> Examples
> --------
>   Following patches are examples.
>
>   drivers/input/touchscreen/mms114.c
>   drivers/mfd/tps65910.c
>   drivers/usb/musb/ux500.c
>
> Driver list
> -----------
> of_dev_get_platdata() can be applied into files below. You may find more
> if you're interested in this. :)
>
>   drivers/dma/ste_dma40.c
>   drivers/gpio/gpio-rcar.c
>   drivers/gpu/drm/exynos/exynos_dp_core.c
>   drivers/gpu/drm/exynos/exynos_hdmi.c
>   drivers/hwmon/ntc_thermistor.c
>   drivers/i2c/busses/i2c-s3c2410.c
>   drivers/iio/frequency/adf4350.c
>   drivers/input/keyboard/matrix_keypad.c
>   drivers/input/keyboard/samsung-keypad.c
>   drivers/input/misc/drv260x.c
>   drivers/input/misc/regulator-haptic.c
>   drivers/input/misc/rotary_encoder.c
>   drivers/input/touchscreen/atmel_mxt_ts.c
>   drivers/input/touchscreen/auo-pixcir-ts.c
>   drivers/input/touchscreen/bu21013_ts.c
>   drivers/input/touchscreen/mms114.c
>   drivers/input/touchscreen/pixcir_i2c_ts.c
>   drivers/input/touchscreen/zforce_ts.c
>   drivers/leds/leds-lp5521.c
>   drivers/leds/leds-lp5523.c
>   drivers/leds/leds-lp5562.c
>   drivers/leds/leds-lp55xx-common.c
>   drivers/leds/leds-lp8501.c
>   drivers/leds/leds-mc13783.c
>   drivers/leds/leds-pca963x.c
>   drivers/leds/leds-tca6507.c
>   drivers/mfd/max8997.c
>   drivers/mfd/max8998.c
>   drivers/mfd/sec-core.c
>   drivers/mfd/tps6586x.c
>   drivers/mfd/tps65910.c
>   drivers/misc/lis3lv02d/lis3lv02d.c
>   drivers/mmc/host/davinci_mmc.c
>   drivers/mmc/host/dw_mmc.c
>   drivers/mmc/host/sdhci-s3c.c
>   drivers/mtd/devices/spear_smi.c
>   drivers/mtd/nand/fsmc_nand.c
>   drivers/mtd/nand/lpc32xx_mlc.c
>   drivers/mtd/nand/lpc32xx_slc.c
>   drivers/mtd/nand/sh_flctl.c
>   drivers/net/can/sja1000/sja1000_platform.c
>   drivers/net/ethernet/davicom/dm9000.c
>   drivers/net/ethernet/marvell/mv643xx_eth.c
>   drivers/net/ethernet/renesas/sh_eth.c
>   drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c
>   drivers/power/bq24735-charger.c
>   drivers/power/gpio-charger.c
>   drivers/power/sbs-battery.c
>   drivers/power/tps65090-charger.c
>   drivers/power/twl4030_charger.c
>   drivers/pwm/pwm-lp3943.c
>   drivers/pwm/pwm-samsung.c
>   drivers/spi/spi-sh-msiof.c
>   drivers/spi/spi/spi-s3c64xx.c
>   drivers/thermal/db8500_thermal.c
>   drivers/usb/misc/usb3503.c
>   drivers/usb/musb/omap2430.c
>   drivers/usb/musb/ux500.c
>   drivers/usb/renesas_usbhs/common.c
>   drivers/video/fbdev/simplefb.c
>   drivers/video/backlight/lp855x_bl.c
>   drivers/video/backlight/pwm_bl.c
>   drivers/video/backlight/sky81452-backlight.c
>   drivers/video/backlight/tps65217_bl.c
>
> This is the RFC, so I would like to get some feedback prior to patching all
> drivers. Any comments are welcome.
>
> Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> Milo Kim (4):
>   of: introduce of_dev_get_platdata()
>   input: touchscree: mms114: use of_dev_get_platdata()
>   mfd: tps65910: use of_dev_get_platdata()
>   usb: musb: use of_dev_get_platdata()
>
>  drivers/input/touchscreen/mms114.c | 34 ++++++++------------------
>  drivers/mfd/tps65910.c             | 49 +++++++++++++-------------------------
>  drivers/of/device.c                | 46 +++++++++++++++++++++++++++++++++++
>  drivers/usb/musb/ux500.c           | 40 +++++++++++++------------------
>  include/linux/of_device.h          | 12 ++++++++++
>  5 files changed, 100 insertions(+), 81 deletions(-)
>
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
