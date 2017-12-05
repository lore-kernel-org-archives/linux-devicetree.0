From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 02/10] pinctrl: axp209: add pinctrl features
Date: Tue, 5 Dec 2017 09:53:40 +0100
Message-ID: <20171205085340.z2mb4uujencw7bct@flea.lan>
References: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
 <71c9da94df2a5938cb8c092e40f8e36eec0b01c3.1512135804.git-series.quentin.schulz@free-electrons.com>
 <20171201155702.irfox7vf3kfjvpjx@flea.lan>
 <2207ddcb-21fc-e3e1-1a1c-11e11690a02e@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i4sblixkcnkossi4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFN5THIQKGQEIN7MPCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2207ddcb-21fc-e3e1-1a1c-11e11690a02e-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--i4sblixkcnkossi4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Mon, Dec 04, 2017 at 09:07:52AM +0100, Quentin Schulz wrote:
> >> +static int axp20x_pmx_set_mux(struct pinctrl_dev *pctldev,
> >> +			      unsigned int function, unsigned int group)
> >> +{
> >> +	struct axp20x_gpio *gpio = pinctrl_dev_get_drvdata(pctldev);
> >> +	unsigned int mask;
> >> +
> >> +	/* Every pin supports GPIO_OUT and GPIO_IN functions */
> >> +	if (function <= AXP20X_FUNC_GPIO_IN)
> >> +		return axp20x_pmx_set(pctldev, group,
> >> +				      gpio->funcs[function].muxval);
> >> +
> >> +	if (function == AXP20X_FUNC_LDO)
> >> +		mask = gpio->desc->ldo_mask;
> >> +	else
> >> +		mask = gpio->desc->adc_mask;
> > 
> > What is the point of this test...
> > 
> >> +	if (!(BIT(group) & mask))
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * We let the regulator framework handle the LDO muxing as muxing bits
> >> +	 * are basically also regulators on/off bits. It's better not to enforce
> >> +	 * any state of the regulator when selecting LDO mux so that we don't
> >> +	 * interfere with the regulator driver.
> >> +	 */
> >> +	if (function == AXP20X_FUNC_LDO)
> >> +		return 0;
> > 
> > ... if you know that you're not going to do anything with one of the
> > outcomes. It would be better to just move that part above, instead of
> > doing the same test twice.
> > 
> 
> Return value is different. In one case, it is an error to request "ldo"
> for a pin that does not support it. In the other case, the ldo request
> is valid but nothing's done on driver side.
> 
> Both cases are handled differently by the core:
> http://elixir.free-electrons.com/linux/latest/source/drivers/pinctrl/pinmux.c#L439
> 
> I think that's the behavior we're expecting from this driver.

Ah, right.

> Or maybe you're asking to do:
> 
> +	if (function == AXP20X_FUNC_LDO) {
> +		if (!(BIT(group) & gpio->desc->ldo_mask))
> +			return -EINVAL;
> +		return 0;
> +	} else if (!(BIT(group) & gpio->desc->adc_mask)) {
> +		return -EINVAL;
> +	}
> 
> ?

No, it's definitely better the way you did it.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--i4sblixkcnkossi4--
