From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: core: add power sequence for USB devices
Date: Mon, 14 Mar 2016 18:42:29 +0800
Message-ID: <20160314104229.GA2131@shlinux2.ap.freescale.net>
References: <1456999276-6315-1-git-send-email-peter.chen@nxp.com>
 <1456999276-6315-2-git-send-email-peter.chen@nxp.com>
 <CAL_JsqLYHzb0ABYN_P9ZOEorT6otvn_BPNzuCFhoqwa5M4y-hw@mail.gmail.com>
 <20160304020242.GB30272@shlinux2.ap.freescale.net>
 <20160304022305.GB20597@lunn.ch>
 <20160304023750.GF30272@shlinux2.ap.freescale.net>
 <20160305042854.GW13525@rob-hp-laptop>
 <20160305083347.GA28858@shlinux2.ap.freescale.net>
 <20160305141011.GA28343@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160305141011.GA28343-g2DYL2Zd6BY@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 05, 2016 at 03:10:11PM +0100, Andrew Lunn wrote:
> > So, would you like to accept the generic solution like below:
> > 
> > - Create a generic power sequence driver, and it will be probed
> > according to compatible string at device tree. At its probe,
> > we can create a power sequence structure, and let this structure
> > as the private data for this power sequence device.
> 
> I'm not sure a separate driver is required. Why not consider it more
> like pinctrl properties? They are listed in the devices node. Have the
> bus enumerate code first walk all children and run their on sequence.
> Bus shutdown would again walk the children and run the off sequence.
> 

The device which needs power sequence may not at platform bus, it may
be at USB bus, MMC bus, etc.

>From what I see, A generic pwrseq driver can cover gpio-en, gpio-rst, clock,
clock-freq, etc, but I find the pwrseq_emmc does something special, like
request a restart handler. 

Add Ulf, who is the power sequence author for MMC.

Hi Ulf, Rob suggested that if we can create some generic things (driver
or library) for power sequence for all devices, what do you think?

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
