From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx23-olinuxino: Add i2c support
Date: Wed, 8 Apr 2015 19:52:33 -0300
Message-ID: <CAOMZO5A1LFD7V+MXfe2dVbV3GU9AQ0qRXHH5ez7gDcn+Q7qjYA@mail.gmail.com>
References: <1428515100-1496-1-git-send-email-harald@ccbib.org>
	<1158701263.68321.1428531175931.JavaMail.open-xchange@oxbaltgw03.schlund.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1158701263.68321.1428531175931.JavaMail.open-xchange-h4m1HHXQYNGvCDav5jC2oMgmgJlYmuWJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Harald Geyer <harald-95f8Dae0BrPYtjvyW6yDsg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <Fabio.Estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Wed, Apr 8, 2015 at 7:12 PM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:

> AFAIK the iMX233-OLinuXino-MICRO don't have a UEXT connector. Maybe we reached
> the point
> to make dts files for every Olinuxino board. In that case we could also handle
> the USB Host / Peripherial issue.

Yes, I agree. it would be better to split the dts files for the
olinuxino variants.

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
