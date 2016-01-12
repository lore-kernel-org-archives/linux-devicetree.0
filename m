From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v6 4/9] mfd: axp20x: Split the driver into
 core and i2c bits
Date: Tue, 12 Jan 2016 10:06:13 +0800
Message-ID: <CAGb2v65hCaCJAhBvuLugfD=5mzFQdMfktOTwbCO_CM04UtYemw@mail.gmail.com>
References: <1450283538-25067-1-git-send-email-wens@csie.org>
 <1450283538-25067-5-git-send-email-wens@csie.org> <20160111092530.GL14104@x1>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLN72G2AKGQE7JMTHZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160111092530.GL14104@x1>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 11, 2016 at 5:25 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 17 Dec 2015, Chen-Yu Tsai wrote:
>
>> The axp20x driver assumes the device is i2c based. This is not the
>> case with later chips, which use a proprietary 2 wire serial bus
>> by Allwinner called "Reduced Serial Bus".
>>
>> This patch follows the example of mfd/wm831x and splits it into
>> an interface independent core, and an i2c specific glue layer.
>> MFD_AXP20X and the new MFD_AXP20X_I2C are changed to tristate
>> symbols, allowing the driver to be built as modules.
>>
>> Whitespace and other style errors in the moved i2c specific code
>> have been fixed. Included but unused header files are removed as
>> well.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  drivers/mfd/Kconfig        |  14 ++++---
>>  drivers/mfd/Makefile       |   1 +
>>  drivers/mfd/axp20x-i2c.c   | 102 +++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/mfd/axp20x.c       |  88 +++++++-------------------------------
>>  include/linux/mfd/axp20x.h |  33 ++++++++++++++-
>>  5 files changed, 158 insertions(+), 80 deletions(-)
>>  create mode 100644 drivers/mfd/axp20x-i2c.c
>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>

[..]

>> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>> new file mode 100644
>> index 000000000000..b54205677bb2
>> --- /dev/null
>> +++ b/drivers/mfd/axp20x-i2c.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * axp20x-i2c.c - I2C driver for the X-Powers' Power Management ICs

Do you want me to remove the filenames from these 2 files (axp20x.c and
axp20x-i2c.c) as well?

>> + *
>> + * AXP20x typically comprises an adaptive USB-Compatible PWM charger, BUCK DC-DC
>> + * converters, LDOs, multiple 12-bit ADCs of voltage, current and temperature
>> + * as well as configurable GPIOs.
>> + *
>> + * This driver supports the I2C variants.
>> + *
>> + * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Not sure about the copyright, since it's not mine.

>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +

[..]

Regards
ChenYu
