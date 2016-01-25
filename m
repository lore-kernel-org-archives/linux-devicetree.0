From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/5] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 25 Jan 2016 11:29:36 +0000
Message-ID: <20160125112936.GB3368@x1>
References: <1453198783-28383-1-git-send-email-ldewangan@nvidia.com>
 <1453198783-28383-3-git-send-email-ldewangan@nvidia.com>
 <569F199D.9020207@samsung.com>
 <56A214EB.30905@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56A214EB.30905-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Jan 2016, Laxman Dewangan wrote:

> Thanks Krzysztof for review.
>=20
> Hi Lee,
> Are you taking the patches from your tree? Or will go in individual
> subsystem?

I can take the set if there are build dependencies.  If there aren't,
then they should be routed via their respective subsystem trees.

> On Wednesday 20 January 2016 10:52 AM, Krzysztof Kozlowski wrote:
> >On 19.01.2016 19:19, Laxman Dewangan wrote:
> >>MAX77620/MAX20024 are Power Management IC from the MAXIM.
> >>It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> >>watchdog, clock etc.
> >>
> >>Add MFD drier to provides common support for accessing the
> >>device; additional drivers is developed on respected subsystem
> >>in order to use the functionality of the device.
> >>
> >>Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>Signed-off-by: Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>---
> >>Changes from V1:
> >>- Code cleanups per review from V1.
> >>- Move register acccess APIs from header to c file.
> >>- Remove some of non required variable, remove duplication in error=
 message
> >>  and simplify some of function implementation.
> >>- Register RTC driver such that it can get the regmap handle form p=
arent device
> >>
> >>Changes from V2:
> >>- Run coccicheck and checkpatch in strict mode for the alignment.
> >>- Drop RTC driver and its i2c client registration.
> >>
> >>Changes from V3:
> >>- Change all sys initcall to module driver.
> >>- change the max77620_read argument to unisgned int from u8.
> >>
> >>  drivers/mfd/Kconfig          |  15 +
> >>  drivers/mfd/Makefile         |   1 +
> >>  drivers/mfd/max77620.c       | 871 ++++++++++++++++++++++++++++++=
+++++++++++++
> >>  include/linux/mfd/max77620.h | 404 ++++++++++++++++++++
> >>  4 files changed, 1291 insertions(+)
> >>  create mode 100644 drivers/mfd/max77620.c
> >>  create mode 100644 include/linux/mfd/max77620.h
> >>
> >
> >Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >
> >Best regards,
> >Krzysztof
> >
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
