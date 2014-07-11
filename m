From: Jianqun <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: randconfig build error with next-20140710, in sound/soc/rockchip/rockchip_i2s.c
Date: Fri, 11 Jul 2014 08:07:20 +0800
Message-ID: <53BF2AB8.7050307@rock-chips.com>
References: <CA+r1ZhgB=BG5jsSaWBLMvRUjZ=X4gKJzv6KysyvPSOtFuUTbng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+r1ZhgB=BG5jsSaWBLMvRUjZ=X4gKJzv6KysyvPSOtFuUTbng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko:

Is it caused by the headfile ?
#include <linux/module.h>

Adviced by the maintainers, I tried not to include the headfile one by =
one, then to compile
driver each time, I found that is success to compile it without module.=
h, of course
I just compiled driver with command "ARCH=3Darm".

Look up the codes, I found the functions like
	MODULE_DESCRIPTION
will be defined as
	#define MODULE_DESCRIPTION(x)	/* x */
so the code in rockchip iis driver
	"MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface") "
will be defined as
	"ROCKCHIP IIS ASoC Interface"
that should cause the error while robot to compile.

Am I right ?

If it is, do I need to make a new patch or just reply to the mail ? or =
how ...


On 2014=E5=B9=B407=E6=9C=8810=E6=97=A5 21:53, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> sound/soc/rockchip/rockchip_i2s.c:526:20: error: expected declaration=
 specifiers
>  or =E2=80=98...=E2=80=99 before string constant
>  MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface");
>                     ^
> sound/soc/rockchip/rockchip_i2s.c:527:15: error: expected declaration=
 specifiers
>  or =E2=80=98...=E2=80=99 before string constant
>  MODULE_AUTHOR("jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
>                ^
> sound/soc/rockchip/rockchip_i2s.c:528:16: error: expected declaration=
 specifiers
>  or =E2=80=98...=E2=80=99 before string constant
>  MODULE_LICENSE("GPL v2");
>                 ^
> sound/soc/rockchip/rockchip_i2s.c:529:14: error: expected declaration=
 specifiers
>  or =E2=80=98...=E2=80=99 before string constant
>  MODULE_ALIAS("platform:" DRV_NAME);
>               ^
> sound/soc/rockchip/rockchip_i2s.c:530:1: warning: data definition has=
 no type or
>  storage class [enabled by default]
>  MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
>  ^
> sound/soc/rockchip/rockchip_i2s.c:530:1: error: type defaults to =E2=80=
=98int=E2=80=99
> in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=3Dim=
plicit-int]
> sound/soc/rockchip/rockchip_i2s.c:530:1: warning: parameter names (wi=
thout types
> ) in function declaration [enabled by default]
> cc1: some warnings being treated as errors
> make[3]: *** [sound/soc/rockchip/rockchip_i2s.o] Error 1
>=20

--=20
-------------
=E8=AE=B8 =E5=89=91 =E7=BE=A4 Jay
Rockchip Electronics Co.Ltd
***********************************************************************=
*****
*IMPORTANT NOTICE:*This email is from Fuzhou Rockchip Electronics Co.,
Ltd .The contents of this email and any attachments may contain
information that is privileged, confidential and/or exempt from
disclosure under applicable law and relevant NDA. If you are not the
intended recipient, you are hereby notified that any disclosure,
copying, distribution, or use of the information is STRICTLY PROHIBITED=
=2E
Please immediately contact the sender as soon as possible and destroy
the material in its entirety in any format. Thank you.
***********************************************************************=
*****

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
