From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] pinctrl: sunxi: add support for pin
 controllers without bus gate
Date: Thu, 11 Jan 2018 11:41:00 +0100
Message-ID: <20180111104100.j5rwitma3wgtdivm@flea.lan>
References: <20180106042326.46519-1-icenowy@aosc.io>
 <2ca1ee96-8dc6-c80b-ae11-45895d6a8484@arm.com>
 <CAGb2v64E-XOHVJG0Q-uZeCAdxF37QSVCDfiYmqtv7ydvseQwrw@mail.gmail.com>
 <ba83f00d-c1e5-6f6a-84df-04169860c7eb@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7drrvdoa2nxa6d2m"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSH63TJAKGQEJ5YHMYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <ba83f00d-c1e5-6f6a-84df-04169860c7eb-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7drrvdoa2nxa6d2m
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jan 11, 2018 at 10:23:52AM +0000, Andre Przywara wrote:
> Hi,
> 
> On 11/01/18 10:14, Chen-Yu Tsai wrote:
> > On Thu, Jan 11, 2018 at 6:08 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> >> Hi,
> >>
> >> On 06/01/18 04:23, Icenowy Zheng wrote:
> >>> The Allwinner H6 pin controllers (both the main one and the CPUs one)
> >>> have no bus gate clocks.
> >>>
> >>> Add support for this kind of pin controllers.
> >>>
> >>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >>> ---
> >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 30 ++++++++++++++++++++----------
> >>>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
> >>>  2 files changed, 21 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >>> index 4b6cb25bc796..68cd505679d9 100644
> >>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >>> @@ -1182,7 +1182,12 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
> >>>       unsigned int hosc_div, losc_div;
> >>>       struct clk *hosc, *losc;
> >>>       u8 div, src;
> >>> -     int i, ret;
> >>> +     int i, ret, clk_count;
> >>> +
> >>> +     if (pctl->desc->without_bus_gate)
> >>> +             clk_count = 2;
> >>> +     else
> >>> +             clk_count = 3;
> >>>
> >>>       /* Deal with old DTs that didn't have the oscillators */
> >>>       if (of_count_phandle_with_args(node, "clocks", "#clock-cells") != 3)
> >>> @@ -1360,15 +1365,19 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
> >>>                       goto gpiochip_error;
> >>>       }
> >>>
> >>> -     clk = devm_clk_get(&pdev->dev, NULL);
> >>> -     if (IS_ERR(clk)) {
> >>> -             ret = PTR_ERR(clk);
> >>> -             goto gpiochip_error;
> >>> -     }
> >>> +     if (!desc->without_bus_gate) {
> >>
> >> Do we really need explicit support for that case?
> >> Can't we have something that works automatically?
> >>
> >> if (node has clock-names property)              (A)
> >>         use clocks as enumerated and named there
> > 
> > You still need to know if the hardware has a bus gate or not.
> > If it's missing, and it's disabled, you end up with unusable
> > hardware.
> 
> Yes. So what? If you have a broken DT, it will not work. Just don't do
> it. I don't understand why we want to defend against this case.

This is not the point, but rather: if we have a way to detect easily
that the device tree is missing a property that is missing in our
binding, why shouldn't we do it?

We're already doing it for reg and interrupts for example, why not for
the clocks?

> > Unless you are fully trusting the device tree to be correct.
> 
> Sorry, but what else do we trust?
> 
> > IMHO that makes for hard to find bugs during SoC bringup.
> 
> I am not sure if that is really an issue. I would expect people
> doing SoC bringup to be able to cope with those kinds of problems.

Riiiight, because it worked so well in the past. We definitely didn't
overlooked some clocks used for debouncing in this particular driver,
or some to get the timekeeping right in the RTC.

The argument that "anyone who codes in the kernel should just know
better" doesn't work, on multiple levels. Because anyone that actually
knows better can make a mistake or overlook some feature (because you
didn't have your morning coffee yet, or because it was undocumented)
and because you just make someone that doesn't feel bad.

So, yes, we cannot not trust the device tree. But if we have a way to
detect simple mistakes in the binding, we should also do it.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--7drrvdoa2nxa6d2m--
