Return-Path: <pawelo@king.net.pl>
Date: Wed, 24 Jun 2015 09:17:18 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
Subject: Re: [PATCH 2/9] arm: do not place huge encoder tables on stack when
 it is too small
In-Reply-To: <CAMuHMdUhLwZZRQwTecjrJ22v1kTNc-3PUM+w64vHUs=-D06VpA@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1506240913001.26071@localhost.localdomain>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <1435094387-20146-3-git-send-email-pawelo@king.net.pl> <CAMuHMdUhLwZZRQwTecjrJ22v1kTNc-3PUM+w64vHUs=-D06VpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Osmialowski <pawelo@king.net.pl>, Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

You're right. To be removed. Thanks for spotting this.

On Wed, 24 Jun 2015, Geert Uytterhoeven wrote:

> On Tue, Jun 23, 2015 at 11:19 PM, Paul Osmialowski <pawelo@king.net.pl> wrote:
>> Since stack on Cortex-M3 is too small, we need configuration option
>> to avoid using it for huge encoder tables of zlib.
>>
>> Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
>
>> --- a/lib/zlib_inflate/inflate.c
>> +++ b/lib/zlib_inflate/inflate.c
>> @@ -75,9 +75,14 @@ int zlib_inflateInit2(z_streamp strm, int windowBits)
>>     Return state with length and distance decoding tables and index sizes set to
>>     fixed code decoding.  This returns fixed tables from inffixed.h.
>>   */
>> +#ifdef CONFIG_ZLIB_INFLATE_STACK_SAVING
>> +#   include "inffixed.h"
>> +#endif
>>  static void zlib_fixedtables(struct inflate_state *state)
>>  {
>> +#ifndef CONFIG_ZLIB_INFLATE_STACK_SAVING
>>  #   include "inffixed.h"
>
> All variables in inffixed.h are "static const", so they are not on the stack
> anyway, and this patch shouldn't make a difference.
>
>> +#endif
>
> Gr{oetje,eeting}s,
>
>                        Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                -- Linus Torvalds
>
