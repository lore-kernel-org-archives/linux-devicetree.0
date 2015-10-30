From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 1/4] of: add vendor prefix for Technologic Systems
Date: Fri, 30 Oct 2015 10:17:34 -0400
Message-ID: <20151030141733.GA7403@localhost>
References: <1445978021-13961-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1445978021-13961-2-git-send-email-damien.riegel@savoirfairelinux.com>
 <25965423.XR5PXSyeuf@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <25965423.XR5PXSyeuf@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 01:50:37PM +0100, Arnd Bergmann wrote:
> On Tuesday 27 October 2015 16:33:38 Damien Riegel wrote:
> >  truly  Truly Semiconductors Limited
> > +ts     Technologic Systems
> >  usi    Universal Scientific Industrial Co., Ltd.
> > 
> 
> The stock ticker symbol 'ts' is https://en.wikipedia.org/wiki/Tenaris,
> which is unlikely to conflict here, but it's still better to avoid using
> very short names when that is not also the stock ticker symbol for the
> same company. How about using 'technologic'?

Okay. I will change the vendor prefix to 'technologic' and resubmit once
I get feedback on the v2 of this patch serie.

Damien
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
