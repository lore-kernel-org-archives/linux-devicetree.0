From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers: reset: Add STM32 reset driver
Date: Tue, 05 Jul 2016 15:29:30 +0200
Message-ID: <1467725370.2978.64.camel@pengutronix.de>
References: <1467640052-6770-1-git-send-email-gabriel.fernandez@st.com>
	 <1467640052-6770-3-git-send-email-gabriel.fernandez@st.com>
	 <1467653810.2224.77.camel@pengutronix.de> <577B61EA.5080703@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <577B61EA.5080703-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 05.07.2016, 09:29 +0200 schrieb Gabriel Fernandez:
[...]
> >> +static const struct reset_control_ops stm32_reset_ops = {
> >> +	.assert		= stm32_reset_assert,
> >> +	.deassert	= stm32_reset_deassert,
> > Are the registers not readable, or did you choose not to
> > implement .status on purpose?
> We choose to not implement.

Ok. Because of size issues or just because you don't need them in any of
your drivers?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
