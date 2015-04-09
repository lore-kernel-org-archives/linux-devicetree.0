From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Add i2c support
Date: Thu, 9 Apr 2015 18:34:23 +0200 (CEST)
Message-ID: <1893593729.135182.1428597263856.JavaMail.open-xchange@oxbaltgw02.schlund.de>
References: <1428515100-1496-1-git-send-email-harald@ccbib.org> <1158701263.68321.1428531175931.JavaMail.open-xchange@oxbaltgw03.schlund.de> <3f0efa88b69ea2e8eb22909b6fbe6f91@imap.cosmopool.net> <5526444A.3060805@i2se.com> <d8d27c22eb78aed693a977b88ebcc327@imap.cosmopool.net>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d8d27c22eb78aed693a977b88ebcc327-VlVdRp1qTtWC18heOpxMWqxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio.Estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Harald,

> harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org hat am 9. April 2015 um 15:03 geschrieben:
>
>
> Hi Stefan!
>
> On Thu, 09 Apr 2015 11:20:10 +0200, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> wrote:
>
> > Btw i read that Shawn only want used muxes [1].
> >
> > [1] -
> >
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-August/115779.html
>
> If that is an issue, then I'll just test all three pin groups on my
> olinuxino
> board. After all it would be really awkward to have only one pin group and
> that
> one is labeled "i2c_pins_b" ...

from my understanding you are free about the labels. So you could rename it to
"i2c_pins_a" and change the other pin groups.

>
> Thanks,
> Harald

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
