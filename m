From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] mfd: axp20x: Split the driver into core
 and i2c bits
Date: Thu, 15 Oct 2015 09:37:19 +1100
Message-ID: <CAGRGNgXAtuV+9+i=rRerRX6T9=i6W+dDCBJN8Jh8QS7A82r+VA@mail.gmail.com>
References: <1444840342-9233-1-git-send-email-wens@csie.org> <1444840342-9233-3-git-send-email-wens@csie.org>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBM5S7OYAKGQEMKCQZVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1444840342-9233-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

On Thu, Oct 15, 2015 at 3:32 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> The axp20x driver assumes the device is i2c based. This is not the
> case with later models, which use a proprietary 2 wire serial bus
> called "Reduced Serial Bus".
>
> This patch follows the example of mfd/wm831x and splits it into
> an interface independet core, and an i2c specific glue layer.
>
> The old MFD_AXP20X Kconfig symbol is kept until sub-device drivers
> and defconfigs have migrated to the new MFD_AXP20X_CORE symbol.
>
> Included but unused header files are removed as well.
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/mfd/Kconfig                     |  18 ++++-
>  drivers/mfd/Makefile                    |   3 +-
>  drivers/mfd/{axp20x.c => axp20x-core.c} | 105 +++-----------------------
>  drivers/mfd/axp20x-i2c.c                | 127 ++++++++++++++++++++++++++++++++
>  include/linux/mfd/axp20x.h              |  33 ++++++++-
>  5 files changed, 186 insertions(+), 100 deletions(-)
>  rename drivers/mfd/{axp20x.c => axp20x-core.c} (87%)
>  create mode 100644 drivers/mfd/axp20x-i2c.c
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 99d63675f073..9ba3feb3f2fc 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -79,15 +79,25 @@ config MFD_BCM590XX
>         help
>           Support for the BCM590xx PMUs from Broadcom
>
> +# Keep the old symbol until subdevice driver dependencies and defconfigs
> +# have been updated.
>  config MFD_AXP20X
> -       bool "X-Powers AXP20X"
> +       bool "X-Powers AXP series PMICs"
> +       select MFD_AXP20X_I2C

Unless something has changed in KConfig, (and my knowledge on this is
likely to be outdated) I don't believe this will work as I don't think
selects don't get propagated like you expect. Have you checked that
all possible configuration options survive make oldconfig and build
without warnings?

Also, unless there's some compelling reason not to, it's probably a
good idea to update the dependent drivers and defconfigs now. (or make
this change in a gentler manner.)

> +
> +config MFD_AXP20X_CORE
> +       bool
>         select MFD_CORE
> -       select REGMAP_I2C
>         select REGMAP_IRQ
> +
> +config MFD_AXP20X_I2C
> +       bool "X-Powers AXP series I2C PMICs"
> +       select MFD_AXP20X_CORE
> +       select REGMAP_I2C
>         depends on I2C=y
>         help
> -         If you say Y here you get support for the X-Powers AXP202, AXP209 and
> -         AXP288 power management IC (PMIC).
> +         If you say Y here you get support for the X-Powers AXP series I2C
> +         based power management ICs (PMICs).
>           This driver include only the core APIs. You have to select individual
>           components like regulators or the PEK (Power Enable Key) under the
>           corresponding menus.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
