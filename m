From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Reuse davinci-nand driver for Keystone arch
Date: Mon, 9 Dec 2013 11:44:05 -0500
Message-ID: <52A5F355.9020704@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

David,

On Thursday 05 December 2013 12:25 PM, Ivan Khoronzhuk wrote:
> This series contains fixes and updates of Davinci nand driver in
> order to reuse it for Keystone platform.
> 
> v2..v3:
> - mtd: nand: davinci: don't set timings if AEMIF is used
> 	dropped, it would be replaced by alone patch
> 	ARM: davinci: aemif: get rid of davinci-nand driver dependency on aemif
> 
> v1..v2
> The series is combination of two following series:
> - Davinci nand driver fixes and updates:
> https://lkml.org/lkml/2013/11/20/271
> - Reuse davinci-nand driver for Keystone arch
> https://lkml.org/lkml/2013/11/20/315
> 
> - mtd: nand: davinci: extend description of bindings
> 	clarified changeset description
> 
> - mtd: nand: davinci: reuse driver for Keystone arch
> 	removed "ti,keystone-nand" compatible from driver
> 
> Ivan Khoronzhuk (9):
>   mtd: nand: davinci: fix driver registration
>   mtd: nand: davinci: return ENOMEM if memory allocation is failed
>   mtd: nand: davinci: check required ti,davinci-chipselect property
>   mtd: nand: davinci: simplify error handling
>   mtd: nand: davinci: move bindings under mtd
>   mtd: nand: davinci: extend description of bindings
>   mtd: nand: davinci: adjust DT properties to MTD generic
>   mtd: nand: davinci: reuse driver for Keystone arch
>   mtd: nand: davinci: don't request AEMIF address range
> 
Can you please pick up the $subject series if you are happy
with it ?
It lets us re-use Davinci nand driver on Keystone SOCs.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
