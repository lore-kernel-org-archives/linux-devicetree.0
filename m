From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/10] pinctrl: axp209: use drv_data of
 pinctrl_pin_desc to store pin reg
Date: Tue, 26 Sep 2017 15:45:27 +0200
Message-ID: <20170926134527.kmhpxn4ysfmvdulf@flea>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <7993a30fbc2e50a2d228fa0c8fad643c4034b101.1506428208.git-series.quentin.schulz@free-electrons.com>
 <20170926130108.uibnri32b73elfy6@flea>
 <0ae64e95-ee49-fb4c-e79b-e8c25c86580c@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjqmg4hqb6yittcl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBAVUVHHAKGQEWT3AQDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0ae64e95-ee49-fb4c-e79b-e8c25c86580c-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zjqmg4hqb6yittcl
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Sep 26, 2017 at 01:17:05PM +0000, Quentin Schulz wrote:
> Hi Maxime,
> 
> On 26/09/2017 15:01, Maxime Ripard wrote:
> > On Tue, Sep 26, 2017 at 12:17:13PM +0000, Quentin Schulz wrote:
> >> Instead of using a function to retrieve each pin's correct control
> >> register, use drv_data within pinctrl_pin_desc to store the ctrl reg.
> >>
> >> Remove axp20x_gpio_get_reg and replace every occurrence by a get from
> >> drv_data.
> > 
> > Why do you need to do that? This should be explained.
> > 
> 
> Agreed that it misses an explanation.
> 
> Today, to get a register addr of one of the GPIOs in the PMIC, we
> basically get the GPIO number and returns the register via this info.
> 
> There are 3 GPIOs in AXP209, 2 in AXP813. I didn't want to have a switch
> case for the GPIO number and then an if/else inside one of the case to
> check if the device is AXP209 or AXP813 in which case we return -EINVAL
> instead of the GPIO2 reg. With support for new PMIC, we would have a
> bunch of if conditions and complexify the process for something really
> simple.

I'm not sure how that relates to your code actually. The only thing
that patch is doing is to move the register offset from a function to
the structure associated to the pin.

However, even in the AXP813 case, you're using exactly the same
values, so that's not really needed.

Now, you also mentionned the pin number. While this patch doesn't
really address it, it's also no really needed. The number of pins is
already known and registered in the GPIO framework. If the framework
doesn't already do it (which would be surprising), you can just check
that the pin number passed is not going to be higher than the one you
registered.

> IMHO, this also allows easier integration of future PMICs which might
> have different regs for the GPIOs.

Let's worry about future PMICs in the future.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--zjqmg4hqb6yittcl--
