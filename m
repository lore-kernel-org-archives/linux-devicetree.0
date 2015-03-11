From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v9 0/5] i.MX6 PU power domain support
Date: Wed, 11 Mar 2015 10:06:01 +0100
Message-ID: <1426064761.3101.37.camel@pengutronix.de>
References: <1424713215-3357-1-git-send-email-p.zabel@pengutronix.de>
	 <20150311011236.GV20455@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311011236.GV20455@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

Am Mittwoch, den 11.03.2015, 09:12 +0800 schrieb Shawn Guo:
> On Mon, Feb 23, 2015 at 06:40:10PM +0100, Philipp Zabel wrote:
> > Philipp Zabel (6):
> >   Documentation: Add device tree bindings for Freescale i.MX GPC
> >   ARM: imx6: gpc: Add PU power domain for GPU/VPU
> >   ARM: dts: imx6qdl: Add power-domain information to gpc node
> >   ARM: dts: imx6sl: Add power-domain information to gpc node
> >   ARM: dts: imx6qdl: Allow disabling the PU regulator, add a enable ramp
> >     delay
> 
> Applied above 5.
> 
> >   ARM: imx6: gpc: Allow PU regulator bypass
> 
> I only received 5 patches in the series.

Thank you, this shouldn't have appeared in the list at all.

Allowing regulator bypass isn't part of the series because I still
didn't manage to get rid of race conditions when enabling bypass on the
regulator used in two places (gpc and imx6q-cpufreq).

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
