From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/5] Add rockchip RK808 pmic driver
Date: Tue, 26 Aug 2014 17:26:06 +0100
Message-ID: <20140826162606.GC26707@lee--X1>
References: <1409062218-11844-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409062218-11844-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Aug 2014, Chris Zhong wrote:
> This is the initial version of the RK808 PMIC. This is a power manage=
ment IC
> for multimedia products.
>=20
> It provides regulators that are able to supply power to processor cor=
es
> and other components. The chip provides other modules including RTC, =
Clockout
>=20
> Chris Zhong (5):
>   dt-bindings: Add RK808 device tree bindings document
>   MFD: RK808: Add new mfd driver for RK808
>   RTC: RK808: add RTC driver for RK808
>   clk: RK808: Add clkout driver for RK808
>   regulator: RK808: remove redundant code

You're still sending your sets un-threaded.  Please see the `git
send-email` help for information on how to do that.  It makes things
so much easier to cross-reference if the patches stay together in ones
INBOX.

>  Documentation/devicetree/bindings/mfd/rk808.txt |  150 +++++++++
>  drivers/clk/Kconfig                             |    9 +
>  drivers/clk/Makefile                            |    1 +
>  drivers/clk/clk-rk808.c                         |  163 +++++++++
>  drivers/mfd/Kconfig                             |   13 +
>  drivers/mfd/Makefile                            |    1 +
>  drivers/mfd/rk808.c                             |  257 +++++++++++++=
+
>  drivers/regulator/rk808-regulator.c             |   17 +-
>  drivers/rtc/Kconfig                             |   10 +
>  drivers/rtc/Makefile                            |    1 +
>  drivers/rtc/rtc-rk808.c                         |  412 +++++++++++++=
++++++++++
>  include/dt-bindings/clock/rockchip,rk808.h      |   11 +
>  include/linux/mfd/rk808.h                       |  202 +++++++++++
>  13 files changed, 1234 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rk808.txt
>  create mode 100644 drivers/clk/clk-rk808.c
>  create mode 100644 drivers/mfd/rk808.c
>  create mode 100644 drivers/rtc/rtc-rk808.c
>  create mode 100644 include/dt-bindings/clock/rockchip,rk808.h
>  create mode 100644 include/linux/mfd/rk808.h
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
