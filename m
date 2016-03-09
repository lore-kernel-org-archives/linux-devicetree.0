From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] Add AXP209 GPIO driver
Date: Wed, 9 Mar 2016 16:28:22 +0100
Message-ID: <20160309152822.GQ8418@lukather>
References: <1457520614-32239-1-git-send-email-maxime.ripard@free-electrons.com>
 <56E0146E.6050102@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0kFaR1LGCHUiJxSD"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBF4CQG3QKGQEAIRQGVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E0146E.6050102-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--0kFaR1LGCHUiJxSD
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Mar 09, 2016 at 01:17:50PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 09-03-16 11:50, Maxime Ripard wrote:
> >Hi,
> >
> >The axp209 PMIC used in combination to some Allwinner SoCs has a bunch
> >of GPIOs accessible. Some boards use these to control their backlight
> >or a few LEDs.
> 
> Thanks for working on this, but IMHO this cannot go upstream like this,
> the gpio pins on the axp pmics need a pinctrl driver, not a gpio
> driver. I.E. on the axp209 gpio0 and gpio1 can also be used to output
> an additional low-noise ldo (so as a regulator), or as an adc input.

Eventually, yes, it needs both. But they don't even have to be the
same driver, since they provide two different features. The only
reason we have that construct in the pio case is because they share
the same address space, but in the AXP case, the regmap and our mfd
take care of that already.

> I've been working on gsl1680 touchscreen support lately and on at least
> a few a23 tablets, the low-noise ldo is used as AVCC for the touchscreen
> controller.

Yeah, the AXP209 also has an ADC connected to these pins.

> Now these use an axp223 pmic, but nothing is stopping someone from
> doing something similar with an axp209 and I think it would be best
> to support this from day one, rather then hope we can retro-fit this
> later without breaking dts.

I considered that, but I don't see how it would break the DT later. If
someone wants to enable say the ADC, he will of course have to add the
pinctrl driver, and the pinctrl handles, but the old DT will only
reference the gpio driver directly, which would still be something
that would work.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--0kFaR1LGCHUiJxSD--
