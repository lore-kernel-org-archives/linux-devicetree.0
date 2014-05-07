From: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/8] pinctrl-rockchip: Change wrong initial assumptions
Date: Wed, 07 May 2014 12:04:36 +0200
Message-ID: <4611044.dLc2GHPYxV@xq-nb>
References: <11862890.WUjscWaP3U@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11862890.WUjscWaP3U@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 5. Mai 2014, 13:57:31 schrieb Heiko St=FCbner:
> Initially due to lack of documentation and (personal) understanding
> I assumed that the area holding the iomux settings would be separate
> from everything else, while in fact the grf registers contain not onl=
y
> pinctrl stuff but also dma, usb-phy and general soc-status settings.
> Also things like drive-strength we do not support currently are inter=
mixed.
>=20
> The same is true for the pmu, which does not only contain power domai=
ns
> but also the system reset as well as well as general registers surviv=
ing
> system-resets. Additionally the rk3188 moved parts of the pull-settin=
g
> registers into the pmu space.
>=20
> While this wasn't a problem until now, the upcoming rk3288 introduces
> additional changes to both the grf and pmu areas. On it even part of
> the pinmux registers move into the pmu space.
>=20
> The code in it's current form supports both the old as well as the
> changed bindings.
>=20
> As stated in the v1 thread, this is also a first step to deprecate th=
e
> wrongly included gpio-controllers which now duplicate the recently ad=
ded
> gpio-dwapb, that should be used instead.
>=20
>=20
> changes since v1:
> - add select MFD_SYSCON as suggested by Max
>=20
> Heiko Stuebner (8):
>   pinctrl: rockchip: do not require 2nd register area
>   pinctrl: rockchip: use regmaps instead of raw mappings
>   pinctrl: rockchip: rockchip_pinctrl in rockchip_get_bank_data
>   pinctrl: rockchip: let pmu registers be supplied by a syscon
>   pinctrl: rockchip: only map bank0-pull-region when pmu regmap missi=
ng
>   pinctrl: rockchip: base regmap supplied by a syscon
>   dt-bindings: adapt rockchip-pinctrl doc to changed bindings
>   ARM: dts: rockchip: convert pinctrl nodes to new bindings
>=20
>  .../bindings/pinctrl/rockchip,pinctrl.txt          |  28 +++-
>  arch/arm/boot/dts/rk3066a.dtsi                     |   2 +-
>  arch/arm/boot/dts/rk3188.dtsi                      |   9 +-
>  arch/arm/boot/dts/rk3xxx.dtsi                      |   9 +-
>  drivers/pinctrl/Kconfig                            |   1 +
>  drivers/pinctrl/pinctrl-rockchip.c                 | 178
> +++++++++++++++------ 6 files changed, 165 insertions(+), 62 deletion=
s(-)

This series
Acked-by: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>

Cheers,
  Max
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
