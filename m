From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 07/12] ARM: imx6q: add config-on-boot gpios
Date: Tue, 22 May 2012 07:22:00 +0200
Message-ID: <201205220722.00653.marex@denx.de>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <201205220620.17109.marex@denx.de> <20120522044223.GJ8140@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120522044223.GJ8140-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Shawn Guo,

> On Tue, May 22, 2012 at 06:20:16AM +0200, Marek Vasut wrote:
> > Dear Shawn Guo,
> > 
> > > On 22 May 2012 11:25, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> > > > Dear Shawn Guo,
> > > > 
> > > >> Apart from my comments below, we really need to know Rob and Grant's
> > > >> opinion on this.
> > > > 
> > > > Hm ... so why don't you actually write per-board driver ? :-) That'd
> > > > handle every single board very well, you'd configure the GPIOs there,
> > > > every single additional necessary thing that has to be configured
> > > > would sink there too etc.
> > > 
> > > I'm not completely sure about how the per-board driver looks like
> > > exactly.  Can you have some code demonstrating it?
> > 
> > Well such per-board driver would handle the board-specific init, like
> > configuring the hub GPIO (as Richard has to do so on mx6q) or flick some
> > other GPIOs, configure registers etc.
> 
> So when you say driver, you just meant a C file like imx6q-sabrelite.c
> containing a number of init functions to be called by mach-imx6q.c?

Something like that ... but didn't Linus complain that we have too many files in 
arch/arm/ ?

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
