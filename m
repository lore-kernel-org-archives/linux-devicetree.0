From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/7] Davinci nand driver fixes and updates
Date: Fri, 29 Nov 2013 10:37:00 -0500
Message-ID: <5298B49C.1050104@ti.com>
References: <1384960945-14528-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384960945-14528-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ivan,

On Wednesday 20 November 2013 10:22 AM, Ivan Khoronzhuk wrote:
> This series contains fixes and updates of Davinci nand driver, in
> order to prepare it to be reused for Keystone platform.
> 
> V1:
> https://lkml.org/lkml/2013/11/11/352
> 
> Ivan Khoronzhuk (7):
>   mtd: nand: davinci: fix driver registration
>   mtd: nand: davinci: return ENOMEM if memory allocation is failed
>   mtd: nand: davinci: check required ti,davinci-chipselect property
>   mtd: nand: davinci: simplify error handling
>   mtd: nand: davinci: move bindings under mtd
>   mtd: nand: davinci: extend description of bindings
>   mtd: nand: davinci: adjust DT properties to MTD generic
> 
>  .../devicetree/bindings/arm/davinci/nand.txt       |   46 ----------
>  .../devicetree/bindings/mtd/davinci-nand.txt       |   92 ++++++++++++++++++++
>  drivers/mtd/nand/davinci_nand.c                    |   68 +++++++--------
>  3 files changed, 126 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt
> 
Can you please update the series with pending comments and
send a refreshed version. 

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
