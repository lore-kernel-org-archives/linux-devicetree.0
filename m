From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/6] mfd: Add hi6421 PMIC core driver
Date: Tue, 26 Aug 2014 10:07:06 +0100
Message-ID: <20140826090706.GF9574@lee--X1>
References: <1408367356-2628-1-git-send-email-guodong.xu@linaro.org>
 <1408367356-2628-5-git-send-email-guodong.xu@linaro.org>
 <20140820080912.GG4266@lee--X1>
 <53FAFF03.1000301@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FAFF03.1000301-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org, zhangnian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Aug 2014, Guodong Xu wrote:
> On 08/20/2014 04:09 PM, Lee Jones wrote:
> > On Mon, 18 Aug 2014, Guodong Xu wrote:
> >> This adds driver to support HiSilicon Hi6421 PMIC. Hi6421 includes=
 multi-
> >> functions, such as regulators, codec, ADCs, Coulomb counter, etc.
> >> This driver includes core APIs _only_.
> >>
> >> Drivers for individul components, like voltage regulators, are
> >> implemented in corresponding driver directories and files.
> >>
> >> Registers in Hi6421 are memory mapped, so using regmap-mmio API.
> >>
> >> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/mfd/hi6421.txt |  37 +++++++

[...]

> >> + * Author: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> + *
> >> + * This program is free software; you can redistribute it and/or =
modify
> >> + * it under the terms of the GNU General Public License version 2=
 as
> >> + * published by the Free Software Foundation.
> >=20
> > This should also contain a link to the full licence.
> >=20
> > See: COPYING
> >=20
>=20
> Thanks. I checked COPYING, but there is no 'link' to full license. I

I was making reference to the fact that COPYING tells you to provide a
link to the full notice:

"To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
convey the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found."

> copied a link from other c source: http://www.gnu.org/licenses/
> is that OK?

Yes, that's fine.

> >> +	platform_set_drvdata(pdev, pmic);
> >=20
> > It's not _that_ important, but I like to see this at the end after =
you
> > know everything else has succeeded.
>=20
> When I move this after mfd_add_devices(), it fails to boot. In mfd
> devices's probe, pmic->regmap is used.

You can move it to just before mfd_add_devices().

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
