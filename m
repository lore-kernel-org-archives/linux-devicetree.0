From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Date: Mon, 22 May 2017 19:55:56 +0200
Message-ID: <3164416.5xR36OcyjH@jernej-laptop>
References: <20170517164354.16399-1-icenowy@aosc.io> <1958057.WDKm0nQKgW@jernej-laptop> <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBMGMRTEQKGQEU3HAUII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai napisal(a):
> On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec <jernej.skrabec@siol=
.net>=20
wrote:
> > Hi,
> >=20
> > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng napisal(a):
> >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=882:03:30, Maxime Ripard <maxime.ripard@free-
> >=20
> > electrons.com> =E5=86=99=E5=88=B0:
> >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng wrote:
> >> >> Allwinner H3 features a TV encoder similar to the one in earlier
> >> >
> >> >SoCs,
> >> >
> >> >> but with some different points about clocks:
> >> >> - It has a mod clock and a bus clock.
> >> >> - The mod clock must be at a fixed rate to generate signal.
> >> >
> >> >Why?
> >>=20
> >> It's experiment result by Jernej.
> >>=20
> >> The clock rates in BSP kernel is also specially designed
> >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> >=20
> > My experiments and search through BSP code showed that TVE seems to hav=
e
> > additional fixed predivider 8. So if you want to generate 27 MHz clock,
> > unit has to be feed with 216 MHz.
> >=20
> > TVE has only one PLL source PLL_DE. And since 216 MHz is a bit low for
> > DE2,
> > BSP defaults to 432 MHz for PLL_DE and use divider 2 to generate 216 MH=
z.
> > This clock is then divided by 8 internaly to get final 27 MHz.
> >=20
> > Please note that I don't have any hard evidence to support that, only
> > experimental data. However, only that explanation make sense to me.
> >=20
> > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which both use 27 M=
Hz
> > base clock. Further experiments are needed to check if there is any
> > possibility to have other resolutions by manipulating clocks and give
> > other proper settings. I plan to do that, but not in very near future.
>=20
> You only have composite video output, and those are the only 2 standard
> resolutions that make any sense.

Right, other resolutions are for VGA.

Anyway, I did some more digging in A10 and R40 datasheets. I think that H3 =
TVE=20
unit is something in between. R40 TVE has a setting to select "up sample".=
=20
Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP driver on R4=
0=20
has this setting enabled only for PAL and NTSC and it is always 216 MHz. I=
=20
think that H3 may have this hardwired to 216 MHz and this would be the reas=
on=20
why 216 MHz is needed.

Has anyone else any better explanation?

Best regards,
Jernej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
