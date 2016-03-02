From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 2/4] mmc: meson: Add driver for the SD/MMC host found
 on Amlogic Meson SoCs
Date: Wed, 2 Mar 2016 03:14:50 +0100
Message-ID: <56D64C9A.3030004@suse.de>
References: <1456596108-1406-1-git-send-email-carlo@caione.org>
 <1456596108-1406-3-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456596108-1406-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Carlo,

Am 27.02.2016 um 19:01 schrieb Carlo Caione:
> Add a driver for the SD/MMC host found on the Amlogic Meson SoCs. Thi=
s
> is an MMC controller which provides an interface between the applicat=
ion
> processor and various memory cards. It supports the SD specification
> v2.0 and the eMMC specification v4.41.
>=20
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Enabling this driver on top of my v2 arm64 gxbb series, I get:

  CC      drivers/mmc/host/meson-mmc.o
drivers/mmc/host/meson-mmc.c: In function 'meson_mmc_probe':
drivers/mmc/host/meson-mmc.c:471:12: error: implicit declaration of
function 'devm_pinctrl_get' [-Werror=3Dimplicit-function-declaration]
  pinctrl =3D devm_pinctrl_get(&pdev->dev);
            ^
drivers/mmc/host/meson-mmc.c:471:10: warning: assignment makes pointer
from integer without a cast [-Wint-conversion]
  pinctrl =3D devm_pinctrl_get(&pdev->dev);
          ^
cc1: some warnings being treated as errors
scripts/Makefile.build:258: recipe for target
'drivers/mmc/host/meson-mmc.o' failed
make[3]: *** [drivers/mmc/host/meson-mmc.o] Error 1
scripts/Makefile.build:407: recipe for target 'drivers/mmc/host' failed
make[2]: *** [drivers/mmc/host] Error 2
scripts/Makefile.build:407: recipe for target 'drivers/mmc' failed
make[1]: *** [drivers/mmc] Error 2
Makefile:959: recipe for target 'drivers' failed
make: *** [drivers] Error 2

Either this is missing a Kconfig dependency on PINCTRL, or should be
using #ifdef CONFIG_PINCTRL or some other guard.

=46or gxbb we could just ignore this in the hopes that Nicolas will hav=
e a
working pinctrl driver soon, but it might reappear for COMPILE_TEST.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
