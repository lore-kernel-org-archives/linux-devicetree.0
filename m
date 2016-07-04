From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers: reset: Add STM32 reset driver
Date: Mon, 04 Jul 2016 19:36:50 +0200
Message-ID: <1467653810.2224.77.camel@pengutronix.de>
References: <1467640052-6770-1-git-send-email-gabriel.fernandez@st.com>
	 <1467640052-6770-3-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467640052-6770-3-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gabriel.fernandez-qxv4g6HH51o@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

Am Montag, den 04.07.2016, 15:47 +0200 schrieb gabriel.fernandez-qxv4g6HH51o@public.gmane.org:
> From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

Isn't Maxime the author of this driver?

> The STM32 MCUs family IPs can be reset by accessing some registers
> from the RCC block.
> 
> The list of available reset lines is documented in the DT bindings.
> 
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/reset/Makefile      |   1 +
>  drivers/reset/reset-stm32.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 drivers/reset/reset-stm32.c
> 
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 03dc1bb..3776b7b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
[...]
> +static const struct reset_control_ops stm32_reset_ops = {
> +	.assert		= stm32_reset_assert,
> +	.deassert	= stm32_reset_deassert,

Are the registers not readable, or did you choose not to
implement .status on purpose?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
