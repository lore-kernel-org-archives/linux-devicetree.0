From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 5/5] rtc: add mxc driver for i.MX53 SRTC
Date: Wed, 6 Dec 2017 15:40:35 +0100
Message-ID: <20171206144035.5brxvavkx2u2tk23@pengutronix.de>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com>
 <20171205140646.30367-6-linux-kernel-dev@beckhoff.com>
 <20171206083618.eea63zqmpgaaazwl@pengutronix.de>
 <3BB206AB2B1BD448954845CE6FF69A8E01CB531D9C@NT-Mail07.beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3BB206AB2B1BD448954845CE6FF69A8E01CB531D9C-vUij6NSodOcSOXk/eDA+lhuDmiLEvxRJ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick =?iso-8859-15?Q?Br=FCnn?= <P.Bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 10:17:06AM +0000, Patrick Brünn wrote:
> >From: Sascha Hauer [mailto:s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org]
> >Sent: Mittwoch, 6. Dezember 2017 09:36
> >On Tue, Dec 05, 2017 at 03:06:46PM +0100, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
> >wrote:
> >> +static int mxc_rtc_wait_for_flag(void *__iomem ioaddr, int flag)
> >> +{
> >> +    unsigned int timeout = REG_READ_TIMEOUT;
> >> +
> >> +    while (!(readl(ioaddr) & flag)) {
> >> +            if (!--timeout) {
> >> +                    pr_err("Wait timeout for 0x%x@%p!\n", flag, ioaddr);
> >
> >Please use dev_* functions for printing. In this case the message should
> >probably be printed from the caller.
> Do you have a link at hand about dev_* vs. pr_*? I just choose pr_err here,
> because I would have to change the functions signature to get a device.
> However, I will drop the message and move it to the caller.

No, I don't have a link. However, a message printed with pr_err comes
with absolutely no context, so without grepping the source you do not
get a clue which device has a problem. You could add more context
using some prefix either to each message or by using

#define pr_fmt(fmt) "mydriver: " fmt

but then you still not know which instance the message throws. Using
dev_* just does the right thing without much thinking.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
