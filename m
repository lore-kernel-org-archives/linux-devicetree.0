From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] arm, imx6, dts: add aristainetos board support
Date: Fri, 20 Jun 2014 21:06:29 +0800
Message-ID: <20140620130628.GK28225@dragon>
References: <1402468548-17539-1-git-send-email-hs@denx.de>
 <20140618132915.GK8860@dragon> <53A2C8DD.7000601@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53A2C8DD.7000601-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 19, 2014 at 01:26:21PM +0200, Heiko Schocher wrote:
> >>+	pinctrl-names = "default";
> >>+	pinctrl-0 =<&pinctrl_hog&pinctrl_backlight&pinctrl_gpio>;
> >
> >pinctrl_backlight and pinctrl_gpio shouldn't be in there.
> 
> removed &pinctrl_backlight, removed device specific gpios to
> device nodes ... but there are some gpios only used with GPIO API ...
> 
> Where to move this pinctrls ?

For GPIO that do not have a clear client device owing, it's fine to have
it in hog group.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
