From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 07/08] ARM: dts: enable clock binding on Hi3620
Date: Tue, 17 Dec 2013 16:20:07 -0800
Message-ID: <878uvjnh6w.fsf@linaro.org>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
	<1386748497-11290-8-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-8-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Haojian Zhuang's message of "Wed, 11 Dec 2013 15:54:56 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Turquette, Mike" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> Enable clock binding for Hi3620 common clock driver.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/hi3620.dtsi | 79 ++++++++++++++++++++++++-------------------
>  arch/arm/boot/dts/hi4511.dts  |  3 +-
>  2 files changed, 46 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm/boot/dts/hi3620.dtsi b/arch/arm/boot/dts/hi3620.dtsi
> index e311937..ab1116d 100644
> --- a/arch/arm/boot/dts/hi3620.dtsi
> +++ b/arch/arm/boot/dts/hi3620.dtsi
> @@ -11,7 +11,8 @@
>   * publishhed by the Free Software Foundation.
>   */
>  
> -/include/ "skeleton.dtsi"
> +#include "skeleton.dtsi"
> +#include <dt-bindings/clock/hi3620-clock.h>

This file doesn't exist in this series, so fails to build.  This appears
to depend on the clock series that Mike has merged into his clk-next
branch, so I tested the build with clk-next and it works.

In the future, please be sure to mention external dependencies like
this.  Maintainers don't like to be surprised by this kind of thing.

I'll just merge this as is now, but builds for hi3xxx_defconfig will be
broken until everything hits -next.

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
