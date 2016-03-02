From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/4] mmc: meson: Add driver for the SD/MMC host found
 on Amlogic Meson SoCs
Date: Wed, 2 Mar 2016 09:11:06 +0100
Message-ID: <CAOQ7t2b0NBuBh913xGenUsdqu2KTfZ-cbkvEfbrhk0vdsQMBaQ@mail.gmail.com>
References: <1456596108-1406-1-git-send-email-carlo@caione.org>
	<1456596108-1406-3-git-send-email-carlo@caione.org>
	<56D64C9A.3030004@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D64C9A.3030004-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 2, 2016 at 3:14 AM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> =
wrote:
> Hi Carlo,
>
> Am 27.02.2016 um 19:01 schrieb Carlo Caione:
>> Add a driver for the SD/MMC host found on the Amlogic Meson SoCs. Th=
is
>> is an MMC controller which provides an interface between the applica=
tion
>> processor and various memory cards. It supports the SD specification
>> v2.0 and the eMMC specification v4.41.
>>
>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> Enabling this driver on top of my v2 arm64 gxbb series, I get:
>
>   CC      drivers/mmc/host/meson-mmc.o
> drivers/mmc/host/meson-mmc.c: In function 'meson_mmc_probe':
> drivers/mmc/host/meson-mmc.c:471:12: error: implicit declaration of
> function 'devm_pinctrl_get' [-Werror=3Dimplicit-function-declaration]
>   pinctrl =3D devm_pinctrl_get(&pdev->dev);
>             ^
> drivers/mmc/host/meson-mmc.c:471:10: warning: assignment makes pointe=
r
> from integer without a cast [-Wint-conversion]
>   pinctrl =3D devm_pinctrl_get(&pdev->dev);
>           ^
> cc1: some warnings being treated as errors
> scripts/Makefile.build:258: recipe for target
> 'drivers/mmc/host/meson-mmc.o' failed
> make[3]: *** [drivers/mmc/host/meson-mmc.o] Error 1
> scripts/Makefile.build:407: recipe for target 'drivers/mmc/host' fail=
ed
> make[2]: *** [drivers/mmc/host] Error 2
> scripts/Makefile.build:407: recipe for target 'drivers/mmc' failed
> make[1]: *** [drivers/mmc] Error 2
> Makefile:959: recipe for target 'drivers' failed
> make: *** [drivers] Error 2
>
> Either this is missing a Kconfig dependency on PINCTRL, or should be
> using #ifdef CONFIG_PINCTRL or some other guard.

I think that we can actually drop the whole devm_pinctrl_get().
I'll wait for some comments from Ulf before submitting a fix.

> For gxbb we could just ignore this in the hopes that Nicolas will hav=
e a
> working pinctrl driver soon, but it might reappear for COMPILE_TEST.

AFAIR from a discussion with Amlogic it seems that they totally
changed the SD controller in the S905 so probably we will need a new
driver for the gxbb. At this point I also wonder if it's not worthy it
already to change the compatible for this driver to something more
specific for Meson8 / Meson8b.
Probably we will have some more news when the documentation will be ava=
ilable.

Thank you for testing this,

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
