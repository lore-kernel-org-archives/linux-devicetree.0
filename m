From: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RFC/PATCH 0/8] pinctrl-rockchip: Change wrong initial assumptions
Date: Thu, 01 May 2014 12:43:13 +0200
Message-ID: <699502106.fEF2JGVO0i@typ>
References: <1414506.B4e2jZujVm@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414506.B4e2jZujVm@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 30 April 2014 at 00:07:12, Heiko St=FCbner wrote:
> While this wasn't a problem until now, the upcoming rk3288 introduces
> additional changes to both the grf and pmu areas. On it even part of
> the pinmux registers move into the pmu space.

Could you give us more information on that? I tried to find details on =
the=20
RK3288 but came up with nothing. How are the pinmux registers divided?

Would adding a third reg element for the pinmux register to the gpio su=
bnodes=20
suffice to fix your problem?

> For this my current gut-feeling is, that providing both the grf and p=
mu
> as syscons to the pinctrl driver might be more future proof for the n=
ext
> socs. But as I'm not sure on this, I'd like of course comments :-)

I don't see the problem with the current solution. In my mind it's clea=
ner to=20
specify register mappings explicitly in the dt rather than map one larg=
e block=20
and let the drivers figure out themselves where their registers are.

There are some question marks for me on the syscon solution. Regmap use=
s=20
locking internally, which means separate drivers can't access separate=20
registers simultaneously. We have an SMP machine here, so that's not fa=
r-
fetched. And that locking is completely unnecessary, as we *know* in mo=
st=20
cases that the accessed areas do not overlap.

> The other option would be to leave the grf as it is and create separa=
te
> syscons for real small individual parts like the soc-conf and usb-phy=
s.
> But apart from creating these real small syscons that would
> also make it necessary to introduce another register map for the
> drive-strength settings of the pin-controller, which are sitting in t=
he
> middle of everything at least on rk3066 and rk3188.

Wy do we need a syscon for usb-phys? Is it shared by multiple drivers?
My instinctive approach would be two usb-phys devices mapping the GRF_U=
OC0/1=20
spaces directly via reg properties. Or did I miss something?

The only register space I see that is used from many drivers is the GRF=
_SOC_*=20
space. So in my mind that should be the only syscon device.

> @Max: sorry to come up with this now, but I feel this should be resol=
ved
> (in whatever direction) before we introduce any grf syscon. Because d=
ue
> to dt being an API we will be tied for a long time to it.

Yes, I agree. If we want to change something, we should change it now. =
All in=20
all I would vote for the current solution. But it seems you have more=20
information than me, so my vote is somewhat uneducated ;-)

Cheers,
  Max
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
