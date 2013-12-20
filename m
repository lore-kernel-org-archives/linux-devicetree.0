From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: imx6qdl-sabresd: Add power key support
Date: Fri, 20 Dec 2013 11:23:39 +0800
Message-ID: <20131220032334.GL7172@S2101-09.ap.freescale.net>
References: <1387487244-2749-1-git-send-email-b20788@freescale.com>
 <20131220022821.GJ7172@S2101-09.ap.freescale.net>
 <276922cfe7a844c3b7f9f7c18bf86f77@BY2PR03MB315.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <276922cfe7a844c3b7f9f7c18bf86f77-+7O3WWA3DPsAtpehFfzjF+O6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 20, 2013 at 03:00:48AM +0000, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> >+193,16 @@
> >>  			>;
> >>  		};
> >>  	};
> >> +
> >> +	gpio-keys {
> >
> >We now use one pinctrl container 'imx6qdl-sabresd' for all pinctrl groups, so
> >we can move pinctrl_gpio_keys into above and save this gpio-keys container.
> >
> 
> Understood, thanks, just put this group in the hog node, no need to add a new gpio-keys.

What I meant is something below.

https://git.linaro.org/people/shawn.guo/linux-2.6.git/commitdiff/811c64db0af086314ef4e5e4ae22ed157265f3cb

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
