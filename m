From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v16 3/4] soc: rockchip: power-domain: Add power domain driver
Date: Tue, 25 Aug 2015 13:57:16 -0700
Message-ID: <7hwpwjaxxv.fsf@deeprootsystems.com>
References: <1440487486-6154-1-git-send-email-wxt@rock-chips.com>
	<1440487486-6154-4-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440487486-6154-4-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> (Caesar
	Wang's message of "Tue, 25 Aug 2015 15:24:45 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:

> This driver is found on RK3288 SoCs.
>
> In order to meet high performance and low power requirements, a power
> management unit is designed or saving power when RK3288 in low power
> mode.
> The RK3288 PMU is dedicated for managing the power of the whole chip.
>
> PMU can work in the Low Power Mode by setting bit[0] of PMU_PWRMODE_CON
> register. After setting the register, PMU would enter the Low Power mode.
> In the low power mode, pmu will auto power on/off the specified power
> domain, send idle req to specified power domain, shut down/up pll and
> so on. All of above are configurable by setting corresponding registers.
>
> Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

[...]

> diff --git a/drivers/soc/rockchip/Kconfig b/drivers/soc/rockchip/Kconfig
> new file mode 100644
> index 0000000..87a09c3
> --- /dev/null
> +++ b/drivers/soc/rockchip/Kconfig
> @@ -0,0 +1,13 @@
> +#
> +# Rockchip Soc drivers
> +#
> +config PM_GENERIC_DOMAINS

Why are you (re)defining this config option?  This name is already used in kernel/pm/Kconfig.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
