From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 6/9] usb: chipidea: add PTW and PTS handling
Date: Fri, 16 Nov 2012 15:34:23 +0200
Message-ID: <87lie1659c.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de> <1352909950-32555-7-git-send-email-m.grzeschik@pengutronix.de> <87zk2h67ik.fsf@ashishki-desk.ger.corp.intel.com> <20121116131628.GA21447@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121116131628.GA21447-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Fri, Nov 16, 2012 at 02:45:39PM +0200, Alexander Shishkin wrote:
>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>> 
>> > This patch makes it possible to configure the PTW and PTS bits inside
>> > the portsc register for host and device mode before the driver starts
>> > and the phy can be addressed as hardware implementation is designed.
>> >
>> > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > ---
>> >  drivers/usb/chipidea/bits.h        |    3 +++
>> >  drivers/usb/chipidea/ci.h          |    2 ++
>> >  drivers/usb/chipidea/ci13xxx_imx.c |    1 +
>> >  drivers/usb/chipidea/core.c        |   47 ++++++++++++++++++++++++++++++++++++
>> >  drivers/usb/chipidea/host.c        |    4 +++
>> >  include/linux/usb/chipidea.h       |    9 +++++++
>> >  6 files changed, 66 insertions(+)
>> >
>> > diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
>> > index 4b6ae3e..3cded5f 100644
>> > --- a/drivers/usb/chipidea/bits.h
>> > +++ b/drivers/usb/chipidea/bits.h
>> > @@ -48,6 +48,9 @@
>> >  #define PORTSC_SUSP           BIT(7)
>> >  #define PORTSC_HSP            BIT(9)
>> >  #define PORTSC_PTC            (0x0FUL << 16)
>> > +#define PORTSC_PTS            (BIT(31) | BIT(30))
>> > +#define PORTSC_PTW            BIT(28)
>> > +#define PORTSC_STS            BIT(29)
>> 
>> Hm, my spec says these are actually in DEVLC register and only have this
>> meaning in device mode. And in portsc these bits fall in device address
>> bitfield. Can you refer me to your spec?
>
> You can find it here:
> http://cache.freescale.com/files/32bit/doc/ref_manual/iMX53RM.pdf?fpsp=1
> Page 4947

Oh, but see, the offset is 0x184, which in chipidea spec (the version
that I have) corresponds to DEVLC and not PORTSC. So in this driver's
terminology it's DEVLC too, at least currently.

So have you tested this code and did it make any difference?

> We as well do have the original documentation from Synopsys in which there
> there is an DEVLC register in the index, but nowhere else in the Datasheet.

Maybe it's a leftover from the old terminology, which would explain the
confusion.

> June 2011 - Doc.Rev. 2.40a
> USB 2.0 High Speed Atlantic Controller

Yes, mine is from 2009.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
