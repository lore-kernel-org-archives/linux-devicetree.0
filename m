From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/7] pinctrl: freescale: imx: fix system crash if
 enable two pinctl instances
Date: Fri, 2 Oct 2015 05:19:41 -0700
Message-ID: <CACRpkdauecXzxmveqEYRE=-iKf8JoJCj7q8kG+k0AGcDQqYGEA@mail.gmail.com>
References: <1443128043-21063-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443128043-21063-1-git-send-email-aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 1:53 PM, Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> Fix system chrash caused by groups whose number is smaller than the number
> of groups of the last pinctl instance which is not initialized.
>
> iMX7D supports two iomux controllers (iomuxc-lpsr and iomuxc) on probing
> the second instance (iomuxc) the chrash below occurs.

This 1/7 patch applied for next with Shawn's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
