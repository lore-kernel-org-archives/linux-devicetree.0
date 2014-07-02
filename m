From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] reset: stih407: Add softreset, powerdown and
 picophy controllers
Date: Wed, 2 Jul 2014 16:40:59 +0100
Message-ID: <20140702154059.GA17665@lee--X1>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
 <1404310129-14667-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404310129-14667-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 02 Jul 2014, Peter Griffin wrote:

> This patch adds softreset, powerdown and picophy reset controllers fo=
r
> the STiH407 SoC.
>=20
> With this patch three new devices are registered: -
> 1. st,stih407-powerdown
> 2. st,stih407-softreset
> 3. st,stih407-picophyreset
>=20
> All three devices use system configuration registers mapped via regma=
p to
> perform the reset or powerdown. The powerdown controller also has
> an acknowledgement.
>=20
> A separate picophy reset controller manages the different reset chann=
els within
> the picophy, which have a different polarity to the other system soft=
resets.
> Managing these different picophy softreset channels is necessary to c=
orrectly
> handle resuming from suspend when USB2 devices are plugged into the U=
SB3 port.
>=20
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/reset/sti/Kconfig                          |   4 +
>  drivers/reset/sti/Makefile                         |   1 +
>  drivers/reset/sti/reset-stih407.c                  | 158 +++++++++++=
++++++++++
>  .../dt-bindings/reset-controller/stih407-resets.h  |  61 ++++++++
>  4 files changed, 224 insertions(+)
>  create mode 100644 drivers/reset/sti/reset-stih407.c
>  create mode 100644 include/dt-bindings/reset-controller/stih407-rese=
ts.h

Looks good to me now:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

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
