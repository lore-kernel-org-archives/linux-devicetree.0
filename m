From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1] mfd: da9063: Add device tree support
Date: Mon, 19 Jan 2015 09:56:49 +0000
Message-ID: <20150119095649.GO21886@x1>
References: <201501141438.t0EEcMBg010491@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201501141438.t0EEcMBg010491-GMeof6ifPvyPZR/jWPPeGKXmvbD0mHlG@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Dajun Chen <david.chen-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 14 Jan 2015, Steve Twiss wrote:

> From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>=20
> Add device tree support for DA9063 regulators; Real-Time Clock
> and Watchdog.
>=20
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>=20
> ---
> Checks performed with linux-next/v3.19-rc4/scripts/checkpatch.pl
>  da9063.txt                total: 0 errors, 0 warnings, 94 lines chec=
ked
>  da9063-core.c             total: 0 errors, 0 warnings, 192 lines che=
cked
>  da9063-i2c.c              total: 0 errors, 0 warnings, 277 lines che=
cked
>  core.h                    total: 0 errors, 0 warnings, 99 lines chec=
ked
> This patch applies against linux-next and v3.19-rc4=20
>=20
>=20
>=20
>  Documentation/devicetree/bindings/mfd/da9063.txt | 94 ++++++++++++++=
++++++++++

Ah, and this should be in a separate patch.

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
