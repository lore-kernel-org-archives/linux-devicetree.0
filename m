From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/2] clk: rockchip: leave npll for DCLK_VOP0(HDMI) only
Date: Wed, 14 Jan 2015 14:16:15 -0800
Message-ID: <20150114221615.22722.24878@quantum>
References: <1416236138-11010-1-git-send-email-kever.yang@rock-chips.com>
 <3353483.Eif0pChkY5@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3353483.Eif0pChkY5@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dkl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Heiko St=C3=BCbner (2015-01-08 14:30:01)
> Hi Kever,
>=20
> Am Montag, 17. November 2014, 22:55:36 schrieb Kever Yang:
> > To support all kinds of frequency requirement for HDMI on rk3288,
> > we need a PLL that can change rate at run time.
> >=20
> > There are some discussion before at [0], I think we can just leave
> > the npll for HDMI(DCLK_VOP0) used to make it simple.
> >=20
> > Comments are welcome.
>=20
> I think I said it in private somewhere already, but just so it's also=
=20
> available publically:
>=20
> I don't think customizing/limiting the clock usage like this will fly=
,=20
> especially as this would require each and every rk3288 board to use v=
op0 for=20
> hdmi and vop1 for other stuff.
>=20
> With the new rk3288 Firefly devboard this concern already becomes rea=
lity.=20
> There a vga converter is connected to VOP0, which leaves only vop1 fo=
r hdmi if=20
> one wants to support the vga connection.
>=20
>=20
> From our discussion about this problem I remember that the missing cl=
ock=20
> frequencies only affected more esotheric screen resolutions, so perso=
nally I'm=20
> not this much concerned an would like to wait till we find a better s=
olution to=20
> the problem.

Ack. We shouldn't have to limit the possible hardware configurations in
software just to keep things simple. This points to a deficiency in the
clock framework. This is a common concern: how to change a clock
frequency for one user without exploding all of the other users.

Do you think Tomeu's constraints API[0] might be a step in the right
direction for you?

[0] http://lkml.kernel.org/r/<1421071809-17402-3-git-send-email-tomeu.v=
izoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Regards,
Mike

>=20
>=20
> Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
