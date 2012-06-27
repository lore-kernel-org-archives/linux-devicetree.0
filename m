From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v7 08/14] USB: Chipidea: add ci13xxx device id management
Date: Wed, 27 Jun 2012 13:49:45 +0200
Message-ID: <201206271349.45641.marex@denx.de>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com> <4FE83AA9.6030507@pengutronix.de> <20120627054231.GA21750@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120627054231.GA21750-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

> On Mon, Jun 25, 2012 at 12:17:13PM +0200, Marc Kleine-Budde wrote:
> > On 06/25/2012 12:03 PM, Richard Zhao wrote:
> > > Could you use my USB test branch?
> > 
> > Same result:
> > 
> > ci_hdrc ci_hdrc.0: remove, state 1
> > usb usb1: USB disconnect, device number 1
> > ci_hdrc ci_hdrc.0: USB bus 1 deregistered
> > Unable to handle kernel NULL pointer dereference at virtual address
> > 0000006c pgd = c6ba4000
> > [0000006c] *pgd=46a68831, *pte=00000000, *ppte=00000000
> > Internal error: Oops: 17 [#1] PREEMPT ARM
> > Modules linked in: ci13xxx_imx(-) ci_hdrc imx_usbmisc
> > CPU: 0    Not tainted  (3.5.0-rc4-00058-g01710ef #85)

Dumb question -- you use the same base revision of kernel, right?

> 
> Thanks
> Richard
> 
> > Marc

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
