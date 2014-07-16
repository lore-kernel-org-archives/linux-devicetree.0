From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: rockchip: add core rk3288 dtsi
Date: Wed, 16 Jul 2014 13:04:46 -0700
Message-ID: <CAD=FV=Wqt+psd52rdbag7tKg4Cj1h-Mtp=fZzJ04sKT2qG4WHw@mail.gmail.com>
References: <1471578.ILeMmG2DL6@diego>
	<1868508.hOA6VOBqnH@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1868508.hOA6VOBqnH@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Tue, Jul 15, 2014 at 4:02 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> +                       i2c0 {
> +                               i2c0_xfer: i2c0-xfer {
> +                                       rockchip,pins =3D <0 15 RK_FU=
NC_1 &pcfg_pull_none>,
> +                                                       <0 16 RK_FUNC=
_1 &pcfg_pull_none>;
> +                               };
> +                       };
> +
> +                       i2c1 {
> +                               i2c1_xfer: i2c1-xfer {
> +                                       rockchip,pins =3D <8 4 RK_FUN=
C_1 &pcfg_pull_none>,
> +                                                       <8 5 RK_FUNC_=
1 &pcfg_pull_none>;
> +                               };
> +                       };
> +
> +                       i2c2 {
> +                               i2c2_xfer: i2c2-xfer {
> +                                       rockchip,pins =3D <6 9 RK_FUN=
C_1 &pcfg_pull_none>,
> +                                                       <6 10 RK_FUNC=
_1 &pcfg_pull_none>;
> +                               };
> +                       };
> +
> +                       i2c3 {
> +                               i2c3_xfer: i2c3-xfer {
> +                                       rockchip,pins =3D <2 16 RK_FU=
NC_1 &pcfg_pull_none>,
> +                                                       <2 17 RK_FUNC=
_1 &pcfg_pull_none>;
> +                               };
> +                       };
> +
> +                       i2c4 {
> +                               i2c4_xfer: i2c4-xfer {
> +                                       rockchip,pins =3D <7 17 RK_FU=
NC_1 &pcfg_pull_none>,
> +                                                       <7 18 RK_FUNC=
_1 &pcfg_pull_none>;
> +                               };
> +                       };
> +
> +                       i2c5 {
> +                               i2c5_xfer: i2c5-xfer {
> +                                       rockchip,pins =3D <7 19 RK_FU=
NC_1 &pcfg_pull_none>,
> +                                                       <7 20 RK_FUNC=
_1 &pcfg_pull_none>;
> +                               };
> +                       };

Since there's a strong concept of numbering of i2c busses on this SoC,
could you add aliases so that they show up nicely with the right ID?

Thanks!

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
