From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Fix dr_mode of usb0
Date: Wed, 15 Apr 2015 21:11:32 +0200 (CEST)
Message-ID: <772352469.13551.1429125092786.JavaMail.open-xchange@oxbaltgw00.schlund.de>
References: <1429043846-28731-1-git-send-email-stefan.wahren@i2se.com> <20150415033211.GB29095@shlinux2>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150415033211.GB29095@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

> Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> hat am 15. April 2015 um 05:32
> geschrieben:
>
>
> [...]
>
> If this board has only host function, I am ok for it.

Yes, all 4 boards (Maxi [1], Micro [2], Mini [3], Nano [4]) have only host
function.

>
> Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Thanks
Stefan

[1] -
https://github.com/OLIMEX/OLINUXINO/blob/master/HARDWARE/iMX233-OLinuXino-Maxi/iMX233-OLINUXINO-MAXI_Rev_D.pdf
[2] -
https://github.com/OLIMEX/OLINUXINO/blob/master/HARDWARE/iMX233-OLinuXino-Micro/iMX233-OLinuXino-Micro_Rev_D.pdf
[3] -
https://github.com/OLIMEX/OLINUXINO/blob/master/HARDWARE/iMX233-OLinuXino-Mini/iMX233-OLINUXINO-MINI_Rev_C.sch.pdf
[4] -
https://github.com/OLIMEX/OLINUXINO/blob/master/HARDWARE/iMX233-OLinuXino-NANO/iMX233-OLinuXino-NANO_Rev_B.pdf

>
> --
>
> Best Regards,
> Peter Chen
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
