From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, Regulator and Clk, due for v3.19
Date: Fri, 28 Nov 2014 21:13:02 -0800
Message-ID: <20141129051302.8497.54128@quantum>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
 <20141125155918.GO4241@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141125155918.GO4241@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Lee Jones (2014-11-25 07:59:18)
> Mark, Mike,
>=20
> Please merge this into your trees for v3.19.
>=20
> The following changes since commit f114040e3ea6e07372334ade75d1ee0775=
c355e1:
>=20
>   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-m=
fd-regulator-clk-v3.19
>=20
> for you to fetch changes up to 159a5e920446aed12fe373ecc3c7b3dc667091=
ae:
>=20
>   mfd: s2mps11: Add binding documentation for Samsung S2MPS13 PMIC (2=
014-11-25 15:55:12 +0000)

Pulled.

Thanks,
Mike

>=20
> ----------------------------------------------------------------
> Immutable branch between MFD, Regulator and Clk, due for v3.19
>=20
> ----------------------------------------------------------------
> Chanwoo Choi (4):
>       mfd: sec-core: Add support for S2MPS13 device
>       regulator: s2mps11: Add support S2MPS13 regulator device
>       clk: s2mps11: Add the support for S2MPS13 PMIC clock
>       mfd: s2mps11: Add binding documentation for Samsung S2MPS13 PMI=
C
>=20
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |  22 +--
>  drivers/clk/clk-s2mps11.c                         |  24 +++
>  drivers/mfd/sec-core.c                            |  29 ++++
>  drivers/mfd/sec-irq.c                             |  23 ++-
>  drivers/regulator/Kconfig                         |  10 +-
>  drivers/regulator/s2mps11.c                       | 102 +++++++++++-
>  include/linux/mfd/samsung/core.h                  |   2 +
>  include/linux/mfd/samsung/s2mps13.h               | 186 ++++++++++++=
++++++++++
>  8 files changed, 374 insertions(+), 24 deletions(-)
>  create mode 100644 include/linux/mfd/samsung/s2mps13.h
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
