From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 00/11] Support for H3 Composite Output support
Date: Wed, 07 Jun 2017 08:26:01 +0800
Message-ID: <35fbf653e1c1d4638059913901216245@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBGUQ3XEQKGQEMROQMLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170604160149.30230-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?Q?Jernej_?= =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-06-05 00:01=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=EF=BC=
=9A
> Allwinner H3 SoC features a TV Encoder like the one in Allwinner A13,
> which can only output TV Composite signal.
>=20
> The display pipeline of H3 is also special -- it has two mixers and
> two TCONs, of which the connection can be swapped. The TCONs do not
> have channel 0 (as they are all connected to internal bridges, TVE
> and HDMI TX).
>=20
> Add support for the display pipeline and the TVE in H3, in order to
> make it possible to display something with mainline kernel with H3.
>=20
> The image quality of TVE is bad, so HDMI is a better output -- this
> patchset also prepared the mixers and TCONs for HDMI output, and
> the HDMI controller driver is already done by Jernej Skrabec.
>=20
> So if possible, please apply PATCH 1~5 and 8,9 as soon as possible,
> so that Jernej can submit his HDMI patches.
>=20
> Currently the jack detection feature of the TVE is still not so
> clear -- so it's not implemented in this version. Thus the TV
> output shouldn't be defaultly enabled now.
>=20
> Icenowy Zheng (11):
>   dt-bindings: update the binding for Allwinner H3 TVE support
>   drm: sun4i: add support for H3 mixers
>   drm: sun4i: ignore swapped mixer<->tcon connection for DE2
>   drm: sun4i: add support for H3's TCON0/1
>   drm: sun4i: add compatible for H3 display engine
>   drm: sun4i: add color space correction support for DE2 mixer
>   drm: sun4i: add support for the TV encoder in H3 SoC
>   clk: sunxi-ng: allow CLK_DE to set CLK_PLL_DE for H3
>   clk: sunxi-ng: export CLK_PLL_DE for H3
>   ARM: sun8i: h3: add display engine pipeline for TVE
>   [DO NOT MERGE] ARM: sun8i: h3: enable TV output on Orange Pi PC

Maxime, could you pick some patches that you think appliable in this
series? (especially PATCH 1, the binding patch)

I think they can be useful.

Thanks!

>=20
>  .../bindings/display/sunxi/sun4i-drm.txt           |  37 +++-
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |  12 ++
>  arch/arm/boot/dts/sun8i-h3.dtsi                    | 186=20
> +++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   2 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |   3 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c                  |  46 +++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 | 113 ++++++++++---
>  drivers/gpu/drm/sun4i/sun4i_tcon.h                 |   3 +
>  drivers/gpu/drm/sun4i/sun4i_tv.c                   |  35 +++-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c                |  53 ++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h                |   6 +-
>  include/dt-bindings/clock/sun8i-h3-ccu.h           |   2 +
>  12 files changed, 463 insertions(+), 35 deletions(-)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
