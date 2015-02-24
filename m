From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/4] clk: st: New always-on clock domain
Date: Tue, 24 Feb 2015 17:42:59 +0000
Message-ID: <20150224174259.GD21323@x1>
References: <1424799222-9301-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424799222-9301-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 Feb 2015, Lee Jones wrote:

> v2 =3D> v3:
>   - Ensure DT actually reflects h/w
>     - i.e. Nodes should not contain a mishmash of different IP
>       blocks, but should identify related h/w.  In the current
>       example we use interconnects
>   - Change naming from clkdomain to clk-always-on
>   - Place "do not abuse" warning in documentation
>=20
> v1 =3D> v2:
>   - Turned the ST specific driver into a generic one
>  =20
> Hardware can have a bunch of clocks which must not be turned off.
> If drivers a) fail to obtain a reference to any of these or b) give
> up a previously obtained reference during suspend, the common clk
> framework will attempt to turn them off and the hardware will
> subsequently die.  The only way to recover from this failure is to
> restart.
>  =20
> To avoid either of these two scenarios from catastrophically
> disabling the running system we have implemented a clock domain
> where clocks are consumed and references are taken, thus preventing
> them from being shut down by the framework.
>=20
> *** BLURB HERE ***

*grumble*, that's annoying, as I removed this.

I guess Git caches the patches before sending them.

> Lee Jones (4):
>   ARM: sti: stih407-family: Supply defines for CLOCKGEN A0
>   ARM: sti: stih407-family: Add platform interconnects to always-on c=
lk
>     domain
>   clk: Provide an always-on clock domain framework
>   clk: dt: Introduce always-on clock domain documentation
>=20
>  .../devicetree/bindings/clock/clk-always-on.txt    | 35 ++++++++++++
>  arch/arm/boot/dts/stih407-family.dtsi              | 15 ++++++
>  drivers/clk/Makefile                               |  1 +
>  drivers/clk/clk-always-on.c                        | 62 ++++++++++++=
++++++++++
>  include/dt-bindings/clock/stih407-clks.h           |  4 ++
>  5 files changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-alway=
s-on.txt
>  create mode 100644 drivers/clk/clk-always-on.c
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
