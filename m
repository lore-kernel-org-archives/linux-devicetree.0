From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 00/14] add imx usb driver based on Greg next tree
Date: Thu, 21 Jun 2012 16:52:47 +0800
Message-ID: <20120621085246.GC1582@b20223-02.ap.freescale.net>
References: <1340260875-21934-1-git-send-email-richard.zhao@freescale.com>
 <4FE2CC37.8010202@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE2CC37.8010202-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2012 at 09:24:39AM +0200, Marc Kleine-Budde wrote:
> On 06/21/2012 08:41 AM, Richard Zhao wrote:
> > The work is based on  ci13xxx rework done by Alexander Shishkin.
> > 
> > To let Greg pick up, I also added patches Alex queued that I depends on.
> > Patch #1 - #9 : It can also be found at
> > http://github.com/virtuoso/linux-ci.git ci
> > 
> > This patch series can also be found at:
> > https://github.com/riczhao/kernel-imx/commits/topics/usb-driver
> > 
> > Status:
> >   - this version only support host
> >   - usbotg controler works at host role
> 
> I'm interested in usb device support on mx28, what has to be implemented
> to get it working?
I don't have patch yet, but on the plan.

Thanks
Richard

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
