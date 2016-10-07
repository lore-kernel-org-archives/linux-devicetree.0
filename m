From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/9] drm/sun4i: Put dotclock range into tcon quirks and
 check against them
Date: Fri, 7 Oct 2016 10:54:02 +0200
Message-ID: <20161007085402.GI4684@lukather>
References: <20161006160629.11198-1-wens@csie.org>
 <20161006160629.11198-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aFi3jz1oiPowsTUB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161006160629.11198-4-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aFi3jz1oiPowsTUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2016 at 12:06:23AM +0800, Chen-Yu Tsai wrote:
> In commit bb43d40d7c83 ("drm/sun4i: rgb: Validate the clock rate") the
> driver was rounding the requested clock rate and then checking the
> result against the original requested rate.
>=20
> This does not work well for a number of reasons:
>=20
>   - The pixel clock does not have enough resolution to be able to
>     provide all sub-MHz clock rates. This makes it filter out most modes
>     found in simple-panel.
>=20
>   - When first introduced, the main limiting factors were the video PLL
>     clock range (27 ~ 381 MHz) and the lowest divider (6). On sun6i and
>     later, the valid PLL clock range is extended to 30 ~ 600 MHz. The
>     PLL's multiplier and divider can make it go much higher out of range,
>     but the clock driver currently has no checks for it.
>=20
> Since the limits are well known, we can hard code the range into the
> tcon driver, and check against them. And we really only care about the
> upper limit, which affects the highest resolutions we can support.

We already discussed this, but this is really the wrong way to fix
that issue.

clk_round_rate already gives you the maximum clock rate that can be
handled in a generic and abstracted way, disregarding the current
state of the clock driver.

However, the issue that you're trying to solve is that panels might
have a pixel clock requirement that is not aligned on the resolution
on the pixel clock we can generate.

And this can actually happen at any rate, you could very well have a
display that requires a pixel clock of 63501kHz that you would reject,
while using the 63,5 MHz clock rate would be just fine.

On the other hand, (totally made up example) some panel that requires
a pixel clock of 43MHz, with a +- 1MHz tolerance, that we wouldn't be
able to generate since we would only generate 41 or 45 MHz.

And on yet another hand, the panel might be requesting a pixel clock
well below what we can generate, which is also something that we want
to reject.

I can see two way of fixing this so far, the second being a solution
if the first one fails:
   - Look to a decent amount of panels and bridges datasheet to see
     what their usual tolerance on the pixel clock rate is, then use
     that to make a decision.
   - If there's not really a common tolerance that we can find out,
     extend the panel and bridges API to be able for the panel to
     provide its tolerance on the timings, and make a function that we
     can call to see if a given rate is within boundaries.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--aFi3jz1oiPowsTUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX92KqAAoJEBx+YmzsjxAg7YwP/j52pDCk791W4QKQXGkppDE4
d424q+Ybk7YvcTmSvI6WjSUuWWHsIlO9I7u1lfcCBp25nBXTKDBLs6/mKZFYHJlQ
lL5M704O03E0/5BqPmp3rlEwzSgQzqVSYdYAgQPbnR/C/raShT41f9SjRhmyuoMK
MeCHZRTXYoZHmeZTHijmI20IIiGgY/a1bpb3me2zZmM1/J1+eeRHv/4OgD8fRagg
kfLbCuTPcMSEj+tCD4SV1TVjPky8/clCG0KnCu2AVuK1Xwv2JcAO4r94QrnaoJOE
5Lccz/pwRLvUkNfprcoytyITNu0lxv5a5LOhOavbPYc9mbdOJ78BC1IgDzExMCmS
3dZWKElrZXDQfeP3O9nMTL0ZkxXHHQBc17ByLCDldMwLo5E4txH+8QcPbyiZmCzP
21AzApJDXXsdtzX3CwHgRTp/sroFf14sTEa4ah5kaZl3anNxkikka7vKqnFZcB5S
AlnUMEQXI+njRT5giAb/38W5SOsC3evOmFp3G/jcPLXWPRpiwJ2ggO18GFJj7T/c
NNC2rLr48YkFBlCpJ6Gz8e777gZp5E3nOwOB+WAVssa6uCt+uWdEea/IvrVn0S8M
L0QqGmHRDxGO/bqu62753/epB+oT6UvhFUj2hbzaN17Pbuuf6PJ74+uc/bPvdlln
agyg3girIZuvDp8OA/SN
=HcIu
-----END PGP SIGNATURE-----

--aFi3jz1oiPowsTUB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
