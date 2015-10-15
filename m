From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] iio: mma8452: support either of the available
 interrupt pins
Date: Thu, 15 Oct 2015 11:14:45 +0100
Message-ID: <20151015101347.GA8825@leverpostej>
References: <1444828542-28861-1-git-send-email-martink@posteo.de>
 <561E70E0.1010508@metafoo.de>
 <561F72CB.1050606@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <561F72CB.1050606-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 11:32:59AM +0200, Martin Kepplinger wrote:
> Am 2015-10-14 um 17:12 schrieb Lars-Peter Clausen:
> > On 10/14/2015 03:15 PM, Martin Kepplinger wrote:
> > [...]
> >> +			if (irq1 > 0)
> >> +				client->irq = irq1;
> > 
> > You must not overwrite client->irq, that field is manged by the I2C core and
> > is supposed to be read only for device drivers.
> >
> 
> I thought about it again and before I implement it, let me show you:
> 
> since interrupt-names would be "invented" anyways ("INT1", "INT2"),
> here's an idea for the bindings doc that would be a more long-term
> solution to implement:
> 
>   - interrupts: interrupt mapping for GPIO IRQ
> 
>         These devices have two interrupt pins called INT1 and INT2 they
>         can route their different interrupt sources to:

This being the case, the binding should only talk about INT1 and INT2.
The names might be "invented", but they describe the physical pins on
the device, and thus describe a physical property of the device.

>         IRQ Name        Interrupt Source        Wired Pin
>         --------        ----------------        ---------
>         DATA_READY_1    data ready              INT1
>         DATA_READY_2                            INT2
>         MOTION_1        motion events           INT1
>         MOTION_2                                INT2
>         INT1            all                     INT1
>         INT2                                    INT2
> 
>   - interrupt-names: should contain IRQ Names in the order in which they
>                      were supplied in the interrupts property.
> 
>                      Depending on how your chip is wired and what
>                      interrupt sources should be handled by the driver,
>                      choose one IRQ Name per Interrupt source, or
>                      INT1/INT2 for all sources to one pin here.

The configuration of logical interrupts to those physical pins is a
choice that can be made at runtime, and should not live in the DT. It is
not a property of the hardware.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
