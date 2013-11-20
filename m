From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/3] Reuse davinci-nand driver for Keystone arch
Date: Wed, 20 Nov 2013 22:17:48 +0200
Message-ID: <528D18EC.6000501@ti.com>
References: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384964699-15134-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/20/2013 06:24 PM, Ivan Khoronzhuk wrote:
> This series contains updates of Davinci nand driver, in order to be
> reused for Keystone platform.
>
> Depends on:
> - Davinci nand driver fixes and updates:
>    https://lkml.org/lkml/2013/11/20/271

^^^^ I suggest to merge this series with above one as it
should not break anything.

>
> - Introduce AEMIF driver for Davinci/Keystone archs:
>    http://lkml.org/lkml/2013/11/11/352
>
> V1:
> https://lkml.org/lkml/2013/11/11/352
>
> Ivan Khoronzhuk (3):
>    mtd: nand: davinci: reuse driver for Keystone arch
>    mtd: nand: davinci: don't set timings if AEMIF is used
>    mtd: nand: davinci: don't request AEMIF address range

For patches:
Reviewed-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

>
>   .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +--
>   drivers/mtd/nand/Kconfig                           |    6 +--
>   drivers/mtd/nand/davinci_nand.c                    |   57 +++++++++++++-------
>   3 files changed, 45 insertions(+), 26 deletions(-)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
