From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/10] mfd: axp20x: add pinctrl cell for AXP813
Date: Thu, 28 Sep 2017 20:06:14 +0100
Message-ID: <20170928190614.v5jgejvgdlyxbxrh@dell>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <5345a2e94013f4e4f7b545cd4d84b098bd2fa349.1506428208.git-series.quentin.schulz@free-electrons.com>
 <20170926131445.xo2uawiovjtmyivj@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170926131445.xo2uawiovjtmyivj@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Sep 2017, Maxime Ripard wrote:

> On Tue, Sep 26, 2017 at 12:17:17PM +0000, Quentin Schulz wrote:
> > As pinctrl and GPIO driver now supports AXP813, add a cell for it.
> > 
> > Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/mfd/axp20x.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index 336de66..a457528 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
> > @@ -876,6 +876,9 @@ static struct mfd_cell axp813_cells[] = {
> >  		.name			= "axp221-pek",
> >  		.num_resources		= ARRAY_SIZE(axp803_pek_resources),
> >  		.resources		= axp803_pek_resources,
> > +	}, {
> > +		.name			= "axp20x-gpio",
> > +		.of_compatible		= "x-powers,axp813-pctl",
> 
> This was probably introduced in the previous driver, but why are you
> using the pctl suffix? Can't we just use the GPIO one to remain
> consistent with the previous users and the datasheet?

Right.  Pinctrl is a Linuxisum.  GPIO sounds more appropriate.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
