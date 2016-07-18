From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: zynq: avoid retrieving clock names from DT property
Date: Mon, 18 Jul 2016 10:22:44 -0700
Message-ID: <20160718172244.GF3847@xsjsorenbubuntu>
References: <1468682123-1434-1-git-send-email-yamada.masahiro@socionext.com>
 <20160717161110.GY3847@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160717161110.GY3847@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-07-17 at 09:11:10 -0700, S=C3=B6ren Brinkmann wrote:
> On Sun, 2016-07-17 at 00:15:23 +0900, Masahiro Yamada wrote:
> > The "clock-output-names" property is useful for generic clock
> > providers such as fixed-clock, fixed-factor-clock, etc.
> >=20
> > On the other hand, it should not be used for really SoC-specific
> > clock providers like this one.  As you see in "enum zynq_clk" in
> > this driver, it is written as if it already knows all the clock
> > names.  Besides, this is instantiated only once, so no clock name
> > conflict would happen even if the clock names are hard-coded in the
> > driver.
> >=20
> > The device tree (arch/arm/boot/dts/zynq-7000.dtsi) will be fixed
> > later.
> >=20
> > Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>=20
> IIRC, this was the only way to allow circular clock routing. E.g. the=
re
> are use-cases that route an FCLK back into the PS to use it as input =
for
> the GEM. With the introduction of deferred probing this might all be
> possible now but it would be good to verify that this kind of circula=
r
> clock routing still works with this change.

Yep, this breaks this kind of routing. E.g. if you remove the
clk-output-names from the DT and add an EMIO clock input like this:
	clocks =3D <&clkc 15>;
	clock-names =3D "gem1_emio_clk";
the code will no longer be able to correctly obtain the clock name for =
that input.

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
