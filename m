From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: bcm28155-ap: Fix Card Detection GPIO
Date: Fri, 31 Jan 2014 15:11:59 -0800
Message-ID: <20140131231159.GA11138@quad.lixom.net>
References: <1389120821-12007-1-git-send-email-tim.kryger@linaro.org>
 <CAEPRUYo0r5YcRTYdgSNLqedVV4D0bsor7USBoxRRpBXRs7wpbw@mail.gmail.com>
 <CAAYSxhpgJwnq63fUdYBtmneRads_69c2mik8upofvAS1Y25fOA@mail.gmail.com>
 <CAEPRUYpyr2_3pfa3rqYiYPAOwJfA+0AdqyGaf5s7YiWH=zfTeA@mail.gmail.com>
 <CAAYSxhpSz8ZF_urMfQ4xdc1fhFdQC-_=9U1dvNn=EU_OoNsWbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAYSxhpSz8ZF_urMfQ4xdc1fhFdQC-_=9U1dvNn=EU_OoNsWbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Arm Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 24, 2014 at 10:48:40AM -0800, Tim Kryger wrote:
> On Wed, Jan 8, 2014 at 4:54 PM, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org> wrote:
> > On Wed, Jan 8, 2014 at 4:28 PM, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> On Wed, Jan 8, 2014 at 3:38 PM, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org> wrote:
> >>> On Tue, Jan 7, 2014 at 10:53 AM, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >>>> The board schematic states that the "SD_CARD_DET_N gets pulled to GND
> >>>> when card is inserted" so the polarity has been updated to active low.
> >>>>
> >>>> Polarity is now specified with a GPIO define instead of a magic number.
> >>>>
> >>>> Signed-off-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>> Reviewed-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>> ---
> >>>>  arch/arm/boot/dts/bcm28155-ap.dts | 4 +++-
> >>>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
> >>>> index 08e47c2..27dd110 100644
> >>>> --- a/arch/arm/boot/dts/bcm28155-ap.dts
> >>>> +++ b/arch/arm/boot/dts/bcm28155-ap.dts
> >>>> @@ -13,6 +13,8 @@
> >>>>
> >>>>  /dts-v1/;
> >>>>
> >>>> +#include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>>  #include "bcm11351.dtsi"
> >>>>
> >>>>  / {
> >>>> @@ -40,7 +42,7 @@
> >>>>
> >>>>         sdio4: sdio@3f1b0000 {
> >>>>                 max-frequency = <48000000>;
> >>>> -               cd-gpios = <&gpio 14 0>;
> >>>> +               cd-gpios = <&gpio 14 GPIO_ACTIVE_LOW>;
> >>>>                 status = "okay";
> >>>>         };
> >>>>  };
> >>>> --
> >>>> 1.8.0.1
> >>>>
> >>> Tim,
> >>>  Does bcm11351-brt not also suffer from the same bug? If it does can
> >>> you pls update the patch to also fix it?
> >>>
> >>>  Thanks,
> >>>    csd
> >>
> >> The BRT and AP boards are similar so it may have the same problem but
> >> I don't have a BRT and wouldn't be able to test any changes to its DTS
> >> file.
> >>
> >> -Tim
> >
> > [sorry for the resend for those that get it twice]
> > Agreed - it's time that dts file go away. In this case:
> > Acked-by: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
> >
> > Olof - can you pls pull in this patch. This is the bugfix that was
> > discussed in irc earlier today.
> >
> >  thanks,
> >    csd
> 
> Christian,
> 
> I'm not sure Olof saw your reply.  Olof and Kevin are now on CC.

Nope, applied now. Had to touch it up a bit since we're missing some of the
patches that this was based on for 3.14, but the cd-gpios property is fixed.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
