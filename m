From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pinctrl: axp209: add pinctrl features
Date: Wed, 27 Sep 2017 11:28:15 +0200
Message-ID: <20170927092815.4y57ej5qbilioxr5@flea>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <6b89df1bf07dac2ab295fca5fdf0e55179c47ed6.1506428208.git-series.quentin.schulz@free-electrons.com>
 <20170926130009.r5isgrjvkwmm44nn@flea>
 <5596280a-51bb-7491-31f4-5800219888ad@free-electrons.com>
 <20170926132709.od3myumh5xtungvs@flea>
 <0bc7efe6-8d0e-ddae-617b-36e4357f76ce@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sktdlgeaimlfa47o"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOW6VXHAKGQEZZVRACY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0bc7efe6-8d0e-ddae-617b-36e4357f76ce-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sktdlgeaimlfa47o
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Sep 26, 2017 at 01:37:37PM +0000, Quentin Schulz wrote:
> On 26/09/2017 15:27, Maxime Ripard wrote:
> > On Tue, Sep 26, 2017 at 01:08:21PM +0000, Quentin Schulz wrote:
> >> Hi Maxime,
> >>
> >> On 26/09/2017 15:00, Maxime Ripard wrote:
> >>> On Tue, Sep 26, 2017 at 12:17:12PM +0000, Quentin Schulz wrote:
> >>>> +static const struct axp20x_desc_pin axp209_pins[] = {
> >>>> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(0, "GPIO0"),
> >>>> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> >>>> +		   AXP20X_FUNCTION(0x2, "gpio_in"),
> >>>> +		   AXP20X_FUNCTION(0x3, "ldo"),
> >>>> +		   AXP20X_FUNCTION(0x4, "adc")),
> >>>> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(1, "GPIO1"),
> >>>> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> >>>> +		   AXP20X_FUNCTION(0x2, "gpio_in"),
> >>>> +		   AXP20X_FUNCTION(0x3, "ldo"),
> >>>> +		   AXP20X_FUNCTION(0x4, "adc")),
> >>>> +	AXP20X_PIN(AXP20X_PINCTRL_PIN(2, "GPIO2"),
> >>>> +		   AXP20X_FUNCTION(0x0, "gpio_out"),
> >>>> +		   AXP20X_FUNCTION(0x2, "gpio_in")),
> >>>> +};
> >>>
> >>> If all the functions are the same, and at the same offset, can't we
> >>> just hardcode it, instead of having (and duplicate) all the logic
> >>> below?
> >>>
> >>
> >> AXP20X_PIN(AXP20X_PINCTRL_PIN(0, "GPIO0"),
> >> 		AXP20X_GPIO_OUT,
> >> 		AXP20X_GPIO_IN,
> >> 		AXP20X_LDO,
> >> 		AXP20X_ADC))
> >>
> >> That's what you mean?
> > 
> > What I mean is:
> > 
> > static int axp20x_get_func(char *func)
> > {
> > 	if (!strcmp(func, "gpio_out"))
> > 		return 0;
> > 
> > 	if (!strcmp(func, "gpio_in"))
> > 		return 2;
> >  
> > 	if (!strcmp(func, "ldo"))
> >  		return 3;
> >  
> > 	if (!strcmp(func, "adc"))
> >  		return 4;
> > 
> > 	return -EINVAL;
> > }
> > 
> 
> GPIO2 on AXP209 does not support ldo nor adc.
> GPIO1 on AXP813 does not support adc.

Right, and surely that can be caught as well. This was a global
approach. You could add a bitmap for example to encode whether ldo and
adc are available. It takes two bytes, and two or operations.

> I find it more complex to handle those two cases in a function than by
> hardcoding it in structures like above.

You find more complex to add a 10 lines function than 450 lines of
code that you ripped off from another driver, that generates 4
structures many structures (groups, functions, pins and pins'
functions) and will provide three different lookup methods? Really? :)

It's way overkill for that driver. Most of these lists can be
hardcoded as well.

> Moreover, nothing tells us that it would be the same offset for
> other PMICs.

Again, let's worry about those PMICs when we'll need to support
them. Unless you already have an example in mind of course. Otherwise,
it's just building things on theories that have never been proven (and
might never be).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--sktdlgeaimlfa47o--
