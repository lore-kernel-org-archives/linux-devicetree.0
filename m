From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: IMX27: How to do 22k pull-up with the pinctrl ?
Date: Mon, 11 Nov 2013 22:26:41 +0800
Message-ID: <20131111142639.GC11083@S2101-09.ap.freescale.net>
References: <5280B54A.1050503@gtsys.com.hk>
 <20131111120357.GE21201@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131111120357.GE21201-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Copy Markus who is working on imx27 pinctrl driver.

On Mon, Nov 11, 2013 at 12:03:57PM +0000, Mark Rutland wrote:
> On Mon, Nov 11, 2013 at 10:45:30AM +0000, Chris Ruehl wrote:
> > Hi,
> 
> Hi,
> 
> While this does involve device tree, it's not strictly a device tree
> problem, and the people best placed to answer your question don't seem
> to be on Cc. You'd get better responses if you used get_maintainer.pl,
> or looked at the commit history of the driver or binding to find people
> likely to be able to help.
> 
> I've added Dong Aisheng, Shawn Guo, and Linus Walleij to Cc, as they had
> signed-off-bys on the binding document.

Thanks, Mark.

<snip>

> > while I port the static code to the DT I step into the problem to
> > set the PSCR for the sdhc2 ports to 22k pull-up

Is the code from mainline kernel or private tree?  I'm asking because I
do not see non-DT imx27 iomux-v1 driver has interface for setting up
DSCR or PSCR in SYSCTRL block.  That's probably why Markus did not
support that in the imx27 pinctrl driver, I guess.

Shawn

> > I look for something like described in
> >      pinctrl/fsl,imx-pinctrl.txt
> > 
> > the fsl,imx27-pinctrl only say 0/1 dis/enable pull up but not the strength.
> > 
> > 
> > pinctrl_sdhc2_1: sdhc2-1 {
> >                          fsl,pins = <
> >                                  MX27_PAD_SD2_D0__SD2_D0  0x1
> >                                  MX27_PAD_SD2_D1__SD2_D1  0x1
> >                                  MX27_PAD_SD2_D2__SD2_D2  0x1
> >                                  MX27_PAD_SD2_D3__SD2_D3  0x1
> >                                  MX27_PAD_SD2_CLK__SD2_CLK  0x1
> >                                  MX27_PAD_SD2_CMD__SD2_CMD  0x1
> >                          >;
> >                  };
> > 
> > its setup in board specific c-file
> > 
> > /* 22k pull-up for sd2 pins  */
> >          reg = __raw_readw(MX27_IO_ADDRESS(MX27_SYSCTRL_BASE_ADDR + MX27_SYS_PSCR));
> >          reg &= ~0xfff0;
> >          reg |= 0xfff0;
> >          __raw_writew(reg, MX27_IO_ADDRESS(MX27_SYSCTRL_BASE_ADDR + MX27_SYS_PSCR));
> > 
> > 
> > Any successions?
> > 
> > Regards
> > Chris
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
