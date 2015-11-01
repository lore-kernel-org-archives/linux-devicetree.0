From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v4 3/6] pinctrl: sunxi: Add H3 PIO
 controller support
Date: Sun, 1 Nov 2015 23:25:44 +0800
Message-ID: <CAGb2v671DbzUkoK8MQR_i5nZat=0eDYDfeQd-W3x2QyhsPEVCw@mail.gmail.com>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-4-git-send-email-jenskuske@gmail.com> <CAGb2v66wsCgoxedFY1mvVmQkLoRCRz_yeLaa0F8wG10JYHvXRg@mail.gmail.com>
 <56361100.2020903@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBEG63CYQKGQEZXKTJHY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <56361100.2020903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 1, 2015 at 9:17 PM, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 30/10/15 09:08, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Wed, Oct 28, 2015 at 12:50 AM, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> The H3 uses the same pin controller as previous SoC's from Allwinner.
>>> Add support for the pins controlled by the main PIO controller.
>>>
>>> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>>>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>>>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>>>  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           | 516 +++++++++++++++++++++
>>>  4 files changed, 522 insertions(+)
>>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>>> index b321b26..e6ba602 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>>> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>>> @@ -18,6 +18,7 @@ Required properties:
>>>    "allwinner,sun8i-a23-r-pinctrl"
>>>    "allwinner,sun8i-a33-pinctrl"
>>>    "allwinner,sun8i-a83t-pinctrl"
>>> +  "allwinner,sun8i-h3-pinctrl"
>>>
>>>  - reg: Should contain the register physical address and length for the
>>>    pin controller.
>>> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
>>> index e68fd95..89ab7f5 100644
>>> --- a/drivers/pinctrl/sunxi/Kconfig
>>> +++ b/drivers/pinctrl/sunxi/Kconfig
>>> @@ -51,6 +51,10 @@ config PINCTRL_SUN8I_A23_R
>>>         depends on RESET_CONTROLLER
>>>         select PINCTRL_SUNXI_COMMON
>>>
>>> +config PINCTRL_SUN8I_H3
>>> +       def_bool MACH_SUN8I
>>> +       select PINCTRL_SUNXI_COMMON
>>> +
>>>  config PINCTRL_SUN9I_A80
>>>         def_bool MACH_SUN9I
>>>         select PINCTRL_SUNXI_COMMON
>>> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
>>> index e080290..6bd818e 100644
>>> --- a/drivers/pinctrl/sunxi/Makefile
>>> +++ b/drivers/pinctrl/sunxi/Makefile
>>> @@ -13,4 +13,5 @@ obj-$(CONFIG_PINCTRL_SUN8I_A23)               += pinctrl-sun8i-a23.o
>>>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)      += pinctrl-sun8i-a23-r.o
>>>  obj-$(CONFIG_PINCTRL_SUN8I_A33)                += pinctrl-sun8i-a33.o
>>>  obj-$(CONFIG_PINCTRL_SUN8I_A83T)       += pinctrl-sun8i-a83t.o
>>> +obj-$(CONFIG_PINCTRL_SUN8I_H3)         += pinctrl-sun8i-h3.o
>>>  obj-$(CONFIG_PINCTRL_SUN9I_A80)                += pinctrl-sun9i-a80.o
>>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
>>> new file mode 100644
>>> index 0000000..98d465d
>>> --- /dev/null
>>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
>>> @@ -0,0 +1,516 @@
>>> +/*
>>> + * Allwinner H3 SoCs pinctrl driver.
>>> + *
>>> + * Copyright (C) 2015 Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> + *
>>> + * Based on pinctrl-sun8i-a23.c, which is:
>>> + * Copyright (C) 2014 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>> + * Copyright (C) 2014 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> + *
>>> + * This file is licensed under the terms of the GNU General Public
>>> + * License version 2.  This program is licensed "as is" without any
>>> + * warranty of any kind, whether express or implied.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/pinctrl/pinctrl.h>
>>> +
>>> +#include "pinctrl-sunxi.h"
>>> +
>>> +static const struct sunxi_desc_pin sun8i_h3_pins[] = {
>>
>> <snip>
>>
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXD3 */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXD2 */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXD1 */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXD0 */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXCK */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXCTL/RCDV */
>>
>> RXDV?
>>
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* RXERR */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* TXD3 */
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* TXD2L */
>>
>> Trailing "L" there.
>>
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "emac")),         /* TXD1 */
>>
>> <snip>
>>
>>> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
>>> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
>>> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
>>> +                 SUNXI_FUNCTION(0x2, "mmc1"),          /* CLK */
>>> +                 SUNXI_FUNCTION_IRQ_BANK(0x4, 1, 0)),  /* PG_EINT0 */
>>
>> Datasheet say EINT is function 0x6. Same for all the other pins in group G.
>
> Thanks. I had checked the whole list at least three times, but one
> always overlooks something it seems.

As someone who's done this a few times, I can say that it all starts
to look the same after a few rounds. :)

ChenYu
