From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/7] pinctrl: imx27: imx27 pincontrol driver
Date: Wed, 20 Nov 2013 13:37:19 +0800
Message-ID: <20131120053717.GC18481@S2101-09.ap.freescale.net>
References: <1384246210-9257-1-git-send-email-mpa@pengutronix.de>
 <20131113143557.GA17816@S2101-09.ap.freescale.net>
 <CACRpkdaFpvu8wjwAufu==G=KmY_N_Ouo+NPiKi=Fi+OdeZA8kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaFpvu8wjwAufu==G=KmY_N_Ouo+NPiKi=Fi+OdeZA8kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 09:09:46PM +0100, Linus Walleij wrote:
> On Wed, Nov 13, 2013 at 3:36 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Nov 12, 2013 at 09:50:03AM +0100, Markus Pargmann wrote:
> >> Hi,
> >>
> >> This series contains only DTS changes for imx27-pinctrl. It depends on the
> >> incremental driver patch which allows iomux subdevices [1].
> >
> > Applied patches #1, #2 and #7.
> >
> > Unless LinusW create a topic branch for that dependency, I cannot apply
> > the rest.
> 
> Its on the "devel" branch in the pinctrl tree but I'd wait a while
> for it to settle in linux-next etc before pulling that in, but you can
> do that after handshake with me (so I know which commit you
> pulled so I cannot rebase behind that point).

Ok.  I will need to pull patch "pinctrl: imx1-core populate subdevices"
in my tree as dependency of patch #3 in this series.  But I'm waiting
for Markus to respin anyway.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
