From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 8/8] iio: mma8452: add devicetree property to allow all
 pin wirings
Date: Mon, 27 Jul 2015 18:33:45 +0100
Message-ID: <20150727173345.GF10821@leverpostej>
References: <1438006095-26920-1-git-send-email-martink@posteo.de>
 <1438006095-26920-9-git-send-email-martink@posteo.de>
 <20150727142336.GB10821@leverpostej>
 <55B6423C.7030301@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B6423C.7030301-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "knaack.h-Mmb7MZpHnFY@public.gmane.org" <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org" <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, "roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org" <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 03:37:48PM +0100, Martin Kepplinger wrote:
> Am 2015-07-27 um 16:23 schrieb Mark Rutland:
> > On Mon, Jul 27, 2015 at 03:08:15PM +0100, Martin Kepplinger wrote:
> >> For the devices supported by the mma8452 driver, two interrupt pins are
> >> available to route the interrupt signals to. By default INT1 is assumed.
> >>
> >> This adds a bitmask DT property for users to configure interrupt sources
> >> for INT2, if that is the wired interrupt pin for them.
> > 
> > This sounds like configureation rather than a HW property. Why does this
> > need to be in the DT?
> 
> It's a hardware property of the board that uses the device. There might
> be boards that connect just one of them at random, which is the reason
> for this DT property. There also might be exotic users who will want
> to use both pins to route different interrupt sources to (not yet
> supported, but no problem with such a bitmask).

Ok, so I'm somewhat confused as to what the hardware looks like and what
this means.

Could you elaborate on how INT1 and INT2 are used? It looks like they're
used as output pins, and so interrupt-names would seem appropriate for
describing the combination which is wired up.

w.r.t. configuring the choice of output(s), that sounds like a runtime
decision rather than something which needs to be configured statically.

> >> This is important for everyone to be able to use this driver, no matter
> >> how their chip is wired. At the moment, only 0xff for using INT2 for all
> >> available interrupt sources is supported. See the devicetree documentation
> >> file for more details.
> >>
> >> Since this doesn't change the default behaviour, it doesn't break anything
> >> for existing users.
> >>
> >> Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> >> Signed-off-by: Christoph Muellner <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/iio/accel/mma8452.txt        |  4 ++++
> >>  drivers/iio/accel/mma8452.c                          | 20 +++++++++++++-------
> >>  2 files changed, 17 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> >> index 8d98e05..738a430 100644
> >> --- a/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> >> +++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
> >> @@ -10,6 +10,9 @@ Optional properties:
> >>  
> >>    - interrupt-parent: should be the phandle for the interrupt controller
> >>    - interrupts: interrupt mapping for GPIO IRQ
> >> +  - use_int2: bitmask to choose interrupt sources assumed to be wired to
> >> +    interrupt pin INT2 instead of INT1. Only 0xff (INT2 for every interrupt
> >> +    source) is supported at the moment.
> > 
> > s/_/-/ in property names, please.
> 
> ok. If I don't do a version 6 really soon, I'll reply with this patch
> corrected here.
> 
> > 
> > We generally avoid bitmasks in properties, and we also usually exepct a
> > full cell even if data is smaller. The fact that you expect /bits/ 8 
> > must be documented here if that's truly necessary.
> 
> It's not truly necessary. It's just a nice fit. There is one 8 bit
> (device memory) register that basically could (in the future) be
> exposed through this DT property.
> 
> For now it's just 0xff or nothing. We only don't want to create an
> interface that could restrict us from implementing more in the future
> without breaking anything.

It sounds like you wouldn't need this (at least for now) if you were to
use interrupt-names to describe whether INT1 and/or INT2 were wired up.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
