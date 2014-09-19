From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 1/2] regulator: st-pwm: get voltage and duty table from dts
Date: Fri, 19 Sep 2014 13:22:54 -0700
Message-ID: <CAD=FV=Vm-XgNvfQjtaXML3_1ROoir5Kv2fosSr94jkcG6K3P6A@mail.gmail.com>
References: <1411113739-1934-1-git-send-email-zyw@rock-chips.com>
	<1411113739-1934-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411113739-1934-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Fri, Sep 19, 2014 at 1:02 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Get voltage & duty table from device tree might be better, other platforms can also use this
> driver without any modify.
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v3:
> Adviced by Doug Anderson
> - Make Kconfig & Makefile alphabetical
> - remove pwm_reg_period from pwm_regulator_data
> - modify the calculation in pwm_regulator_set_voltage_sel
> - add length validity check
>
> Changes in v2:
> Adviced by Lee Jones
> - rename the file
> - remove all the prefix st_
> - add depend on PWM in Kconfig
>
>  drivers/regulator/Kconfig         |   13 +--
>  drivers/regulator/Makefile        |    2 +-
>  drivers/regulator/pwm-regulator.c |  197 +++++++++++++++++++++++++++++++++++++
>  drivers/regulator/st-pwm.c        |  190 -----------------------------------
>  4 files changed, 205 insertions(+), 197 deletions(-)
>  create mode 100644 drivers/regulator/pwm-regulator.c
>  delete mode 100644 drivers/regulator/st-pwm.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index fb32bab..320751a 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -449,6 +449,13 @@ config REGULATOR_PFUZE100
>           Say y here to support the regulators found on the Freescale
>           PFUZE100/PFUZE200 PMIC.
>
> +config REGULATOR_PWM
> +       tristate "PWM voltage regulator"
> +       depends on PWM
> +       help
> +         This driver supports PWM controlled voltage regulators. Config PWM
> +         duty can increasing or decreasing the voltage.

Slightly more proper English:
        This driver supports PWM controlled voltage regulators. PWM
        duty cycle can increase or decrease the voltage.


> +static struct regulator_desc pwm_regulator_desc = {
> +       .name           = "pwm-regulator",
> +       .ops            = &pwm_regulator_voltage_ops,
> +       .type           = REGULATOR_VOLTAGE,
> +       .owner          = THIS_MODULE,
> +       .supply_name    = "pwm",
> +};

nit: the pwm_regulator_desc can now be "const".


Neither of those is huge.  If you get no other feedback, Mark could
maybe give advice on whether you should spin your series or whether
he'd like to fix them when he applies.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
