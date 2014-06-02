From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/7] of: setup dma parameters using dma-ranges and dma-coherent
Date: Mon, 02 Jun 2014 17:06:02 +0200
Message-ID: <4197388.OE67ahhtqp@wuerfel>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com> <20140602063702.GB7834@dragon> <538C7B22.2020107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538C7B22.2020107-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 02 June 2014 09:24:50 Santosh Shilimkar wrote:
> On Monday 02 June 2014 02:37 AM, Shawn Guo wrote:
> > On Thu, Apr 24, 2014 at 11:30:00AM -0400, Santosh Shilimkar wrote:
> >> Here is an updated v3 of the series. Series introduces support for setting up
> >> dma parameters based on device tree properties like 'dma-ranges' and
> >> 'dma-coherent' and also update to ARM 32 bit port. Earlier version of the
> >> series can be found here [3], [2] and [1].
> > 
> > Are these two generic device tree properties documented somewhere under
> > Documentation/devicetree/bindings?
> > 
> These bindings have been already in use before this series. But looks like
> they have not been documented. I will do a patch to add description for those
> couple of parameters.

dma-ranges is part of ePAPR, and was documented in some ieee-1275 addenda
before that, but I agree it would be nice to have something in kernel as
well, at the minimum something pointing to the relevant documents.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
