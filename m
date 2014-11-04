From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: imx: clean up machine mxc_arch_reset_init_dt reset
 init
Date: Tue, 4 Nov 2014 14:12:14 +0800
Message-ID: <20141104061212.GH10821@tiger>
References: <1414748393-20799-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414748393-20799-1-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 31, 2014 at 05:39:53PM +0800, Jingchang Lu wrote:
> diff --git a/arch/arm/mach-imx/imx31-dt.c b/arch/arm/mach-imx/imx31-d=
t.c
> index 418dbc8..e0a4e2f 100644
> --- a/arch/arm/mach-imx/imx31-dt.c
> +++ b/arch/arm/mach-imx/imx31-dt.c
> @@ -15,16 +15,8 @@
>  #include <asm/mach/arch.h>
>  #include <asm/mach/time.h>
> =20
> -#include "common.h"

The change causes the build errors below.

  CC      arch/arm/mach-imx/imx31-dt.o
=2E./arch/arm/mach-imx/imx31-dt.c: In function =E2=80=98imx31_dt_timer_=
init=E2=80=99:
=2E./arch/arm/mach-imx/imx31-dt.c:27:2: error: implicit declaration of =
function =E2=80=98mx31_clocks_init_dt=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
=2E./arch/arm/mach-imx/imx31-dt.c: At top level:
=2E./arch/arm/mach-imx/imx31-dt.c:31:13: error: =E2=80=98mx31_map_io=E2=
=80=99 undeclared here (not in a function)
=2E./arch/arm/mach-imx/imx31-dt.c:32:16: error: =E2=80=98imx31_init_ear=
ly=E2=80=99 undeclared here (not in a function)
=2E./arch/arm/mach-imx/imx31-dt.c:33:14: error: =E2=80=98mx31_init_irq=E2=
=80=99 undeclared here (not in a function)

So the common.h inclusion needs to be kept.  I fixed it up and applied =
the patch.

Shawn

>  #include "mx31.h"
> =20
> -static void __init imx31_dt_init(void)
> -{
> -	mxc_arch_reset_init_dt();
> -
> -	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> -}
> -
>  static const char * const imx31_dt_board_compat[] __initconst =3D {
>  	"fsl,imx31",
>  	NULL
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
