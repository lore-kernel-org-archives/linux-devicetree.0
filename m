From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 0/4] pinctrl: imx27: imx27 pincontrol driver
Date: Wed, 20 Nov 2013 20:40:27 +0800
Message-ID: <20131120124025.GB22308@S2101-09.ap.freescale.net>
References: <1384937151-11160-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384937151-11160-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 09:45:47AM +0100, Markus Pargmann wrote:
> Hi,
> 
> This version has some commit message updates. It still depends on the pinctrl driver patch [1].

Linus,

I'm about to apply the series.  Is it okay for me to pull in your
'devel' branch at commit 5fab718 (pinctrl: imx1-core populate
subdevices) now?  Or should I at least wait a few days for you to
rebase your branch on 3.13-rc1 after it becomes available?

Actually, you can still rebase your branch before I send my branches to
arm-soc folks around -rc6.  But you need to let me know, so that I can
rebuild my branches.

Shawn

> [1] [PATCH] pinctrl: imx1-core populate subdevices
>     <1384193987-20740-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>     http://thread.gmane.org/gmane.linux.drivers.devicetree/51584

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
