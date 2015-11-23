From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 6/10] watchdog: bcm63xx_wdt: Obtain watchdog clock HZ from
 "periph" clk
Date: Mon, 23 Nov 2015 16:02:22 +0100
Message-ID: <CAOiHx==Z=4H=-L2CY-FE5m6WMV0XzgsCmy1b9tUbsmOHydzkEw@mail.gmail.com>
References: <5650BFD6.5030700@simon.arlott.org.uk> <5650C08C.6090300@simon.arlott.org.uk>
 <5650E2FA.6090408@roeck-us.net> <5650E5BB.6020404@simon.arlott.org.uk>
 <56512937.6030903@roeck-us.net> <5651CB13.4090704@simon.arlott.org.uk> <5651CC3C.5090200@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5651CC3C.5090200-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Nov 22, 2015 at 3:07 PM, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org> wrote:
> Instead of using a fixed clock HZ in the driver, obtain it from the
> "periph" clk that the watchdog timer uses.
>
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
> ---
>  drivers/watchdog/bcm63xx_wdt.c | 36 +++++++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
> index 1d2a501..eb5e551 100644
> --- a/drivers/watchdog/bcm63xx_wdt.c
> +++ b/drivers/watchdog/bcm63xx_wdt.c
> @@ -13,6 +13,7 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/clk.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -32,11 +33,13 @@
>
>  #define PFX KBUILD_MODNAME
>
> -#define WDT_HZ                 50000000                /* Fclk */
> +#define WDT_CLK_NAME           "periph"

@Florian:
Is this correct? The comment for the watchdog in 6358_map_part.h and
earlier claims that the clock is 40 MHz there, but the code uses 50MHz
- is this a bug in the comments or is it a bug taken over from the
original broadcom code? I'm sure that the periph clock being 50 MHz
even on the older chips is correct, else we'd have noticed that in
serial output (where it's also used).


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
