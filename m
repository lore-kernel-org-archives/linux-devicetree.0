From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v6 1/3] USB: chipidea: add imx usbmisc support
Date: Wed, 29 Aug 2012 13:18:10 +0300
Message-ID: <87ehmqj925.fsf@ashishki-desk.ger.corp.intel.com>
References: <1346137109-32247-1-git-send-email-richard.zhao@freescale.com> <1346137109-32247-2-git-send-email-richard.zhao@freescale.com> <871uiqkuhb.fsf@ashishki-desk.ger.corp.intel.com> <20120829081020.GX26594@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120829081020.GX26594-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Wed, Aug 29, 2012 at 10:50:08AM +0300, Alexander Shishkin wrote:
>> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>> 
>> > i.MX usb controllers shares non-core registers, which may include
>> > SoC specific controls. We take it as a usbmisc device and usbmisc
>> > driver set operations needed by ci13xxx_imx driver.
>> >
>> > For example, Sabrelite board has bad over-current design, we can
>> > usbmisc to disable over-current detect.
>> 
>> Why does this have to be part of the usb driver instead of SoC specific
>> code? It looks like you've created a whole new device/driver
>> infrastructure just to disable overcurrent for a specific board.
>
> Richards code indeed only handles overcurrent for a specific board, but
> there are more bits to configure in the longer run: power pin
> polarities, ULPI/serial mode select and some more.

Sounds to me like these things that should be taken care of by the phy
driver, which will likely be simpler from both driver's and devicetree's
perspective.

>
>> 
>> And the infrastructure boils down to a complex way of passing a callback
>> from imx driver to another imx driver, that only works if they are
>> probed in the right order. I don't see any point in doing it like this
>> other than inflating the device tree tables even further.
>> 
>> Why can't this be part of the SoC code like it is done, for example in
>> arch/arm/mach-omap2/control.c?
>
> The settings are board specific, so there must be some way to configure
> them in the devicetree.

But I'm sure there's a way to control board-specific settings/kludges
from devicetree?

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
