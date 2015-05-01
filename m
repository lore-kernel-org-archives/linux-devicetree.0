From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 0/4] clk: si5351: Some fixes
Date: Fri, 1 May 2015 11:14:06 +0200
Message-ID: <20150501111406.0aa23c7b@armhf>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430415954-29517-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Russell King <rmk+linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Apr 2015 19:45:50 +0200
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> For Si5351 clock driver, Michael Welling and Jean-Francois Moine repo=
rted
> issues with recent v4.x kernels due to broken/missing/wrong parent cl=
ock
> claming. This patch set now deals with the issues reported.
>=20
> Patch 1 amends the binding documentation mention clock-names property
> for the "xtal" and "clkin" parent clock inputs of Si5351 variants.
>=20
> Patch 2 adds the clock-names property for the SolidRun CuBox using Si=
5351
> with a fixed oscillator connected to "xtal" input.
>=20
> Patch 3 reworks the way we claim parent clocks by using devm_clk_get(=
)
> for both DT and platform_data based registration. Also, properly chec=
k
> for errors returned by devm_clk_get() and prepare/enable the parent c=
locks.
>=20
> Patch 4 introduces a function to reset PLLs on rate change. This shou=
ld
> improve generated clock output stability. I currently have no scope a=
t hand
> to actually test that properly, so there may be more issues remaining=
=2E
>=20
> @Michael, Jean-Francois: Please test and report if there are still
> issues remaining.

I applied the patches 2 and 3, and the audio and video in the Cubox
work fine again. Thanks.

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
