From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: imx27.dtsi: change the clock information
 for usb
Date: Wed, 16 Sep 2015 10:31:10 +0800
Message-ID: <20150916023109.GB15736@shlinux2>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
 <1442368183-8103-3-git-send-email-peter.chen@freescale.com>
 <CAOMZO5AJPF2JtuxsRv4xbNPeyp18hNT0MMZbXODBoQmYVPARuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5AJPF2JtuxsRv4xbNPeyp18hNT0MMZbXODBoQmYVPARuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 12:25:17AM -0300, Fabio Estevam wrote:
> On Tue, Sep 15, 2015 at 10:49 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > For imx27, it needs three clocks to let the controller work,
> > the old code is wrong, and will cause below data abort when
> > accass usbmisc registers.
> >
> > usbcore: registered new interface driver usb-storage
> > Unhandled fault: external abort on non-linefetch (0x008) at 0xf4424600
> > pgd = c0004000
> > [f4424600] *pgd=10000452(bad)
> > Internal error: : 8 [#1] PREEMPT ARM
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-next-20150701-dirty #3089
> > Hardware name: Freescale i.MX27 (Device Tree Support)
> > task: c7832b60 ti: c783e000 task.ti: c783e000
> > PC is at usbmisc_imx27_init+0x4c/0xbc
> > LR is at usbmisc_imx27_init+0x40/0xbc
> > pc : [<c03cb5c0>]    lr : [<c03cb5b4>]    psr: 60000093
> > sp : c783fe08  ip : 00000000  fp : 00000000
> > r10: c0576434  r9 : 0000009c  r8 : c7a773a0
> > r7 : 01000000  r6 : 60000013  r5 : c7a776f0  r4 : c7a773f0
> > r3 : f4424600  r2 : 00000000  r1 : 00000001  r0 : 00000001
> > Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> > Control: 0005317f  Table: a0004000  DAC: 00000017
> > Process swapper (pid: 1, stack limit = 0xc783e190)
> > Stack: (0xc783fe08 to 0xc7840000)
> >
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Reported-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx27.dtsi | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
> > index feb9d34..93e3e14 100644
> > --- a/arch/arm/boot/dts/imx27.dtsi
> > +++ b/arch/arm/boot/dts/imx27.dtsi
> 
> mx25.dtsi and mx35.dtsi also need to be changed.
> 

If you can help to test, I will update.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
