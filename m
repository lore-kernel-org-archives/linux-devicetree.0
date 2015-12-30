From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Wed, 30 Dec 2015 18:12:08 +0800
Message-ID: <1451470328.22426.5.camel@mtksdaap41>
References: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1451457706-14798-3-git-send-email-jamesjj.liao@mediatek.com>
	 <1670989.QknqqsXE3p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1670989.QknqqsXE3p@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, 2015-12-30 at 09:52 +0100, Arnd Bergmann wrote:
> On Wednesday 30 December 2015 14:41:44 James Liao wrote:
> > Some power domain comsumers may init before module_init.
> > So the power domain provider (scpsys) need to be initialized
> > earlier too.
> > 
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > 
> 
> Why?

Some drivers use different init level to ensure they can be initialized
before other drivers. To support these drivers, moving scpsys driver's
initial function to subsys_init is the most easy way.



Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
