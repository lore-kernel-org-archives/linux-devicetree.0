From: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 05/11] dt-binding: Add ngpios property to GPIO
 controller node
Date: Mon, 26 Oct 2015 17:08:29 +0000
Message-ID: <0C803592FC378B4E83922050AB46442A2AD728F0@SJEXCHMB10.corp.ad.broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
 <3735458.2h6HCQhAOs@avalon>
 <CAL_Jsq+Va0ZnvNoqKWocFYE4_DD-A+2sQaLswy5_eO2ZHn+3Kw@mail.gmail.com>
 <2123166.E4KEJx3AQ2@avalon> <562A5B75.7010804@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562A5B75.7010804-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Ray Jui [mailto:rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org]
> Sent: 23 October 2015 21:38
> To: Laurent Pinchart; Rob Herring
> Cc: Pramod Kumar; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Scott
> Branden; Russell King; Linus Walleij; linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; bcm-kernel-
> feedback-list; Jason Uy; Masahiro Yamada; Thomas Gleixner;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jonas Gorski
> Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller
> node
> 
> 
> 
> On 10/23/2015 6:02 AM, Laurent Pinchart wrote:
> > Hi Rob,
> >
> > On Friday 23 October 2015 06:51:28 Rob Herring wrote:
> >> On Fri, Oct 23, 2015 at 4:08 AM, Laurent Pinchart wrote:
> >>> On Thursday 22 October 2015 18:41:05 Rob Herring wrote:
> >>>> On Thu, Oct 22, 2015 at 1:52 PM, Ray Jui wrote:
> >>>>> On 10/22/2015 11:43 AM, Rob Herring wrote:
> >>>>>> On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar wrote:
> >>>>>>> Add ngpios property to the gpio controller's DT node so that
> >>>>>>> controller driver extracts total number of gpio lines present in
> >>>>>>> controller from DT and removes dependency on driver.
> >>>>>>>
> >>>>>>> Signed-off-by: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>>>>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>>>>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>>>>> ---
> >>>>>>>
> >>>>>>>   Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5
> >>>>>>>   +++
> >>>>>>>   1 file changed, 5 insertions(+)
> >>>>>>>
> >>>>>>> diff --git
> >>>>>>> a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>>>> b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>>>> index f92b833..655a8d7 100644
> >>>>>>> ---
> >>>>>>> a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio
> >>>>>>> +++ .txt
> >>>>>>>
> >>>>>>> @@ -10,6 +10,9 @@ Required properties:
> >>>>>>>        Define the base and range of the I/O address space that
> >>>>>>>        contains
> >>>>>>>
> >>>>>>> the Cygnus
> >>>>>>>
> >>>>>>>    GPIO/PINCONF controller registers
> >>>>>>>
> >>>>>>> +- ngpios:
> >>>>>> +    Total number of GPIOs the controller provides
> >>>>>>
> >>>>>> This must be optional for compatibility and the driver needs to
> >>>>>> handle it not present.
> >>>>>
> >>>>> You meant to be compatible with existing Cygnus devices, correct?
> >>>>>
> >>>>> Just to clarify, here you suggest we still leave the existing hard
> >>>>> coded ngpios in the driver, in order to be compatible with all
> >>>>> existing Cygnus devices (while the Cygnus device tree changes to
> >>>>> use ngpio is still being merged and through different maintainer),
> >>>>> and have all new iProc SoCs switch to use ngpios from device tree, right?
> >>>>
> >>>> Yes, an existing dtb should continue to work with a new kernel. You
> >>>> can add the DT property to the older devices too and then
> >>>> eventually remove the hard coded values some time in the future.
> >>>> That could be immediately (don't care about compatibility at all),
> >>>> a couple of kernel cycles, never... It all depends on users of the
> >>>> impacted platforms.
> >>>
> >>> But shouldn't the property still be documented as required to ensure
> >>> that new DTs always include it ?
> >>
> >> Good point. If the intent is to eventually remove it from the driver,
> >> then yes. We probably need "required for new designs" as a category
> >> or maybe "recommended"? The wording is not so important here, but I'm
> >> thinking about as we try to standardize the naming.
> >
> > Required for new designs sounds better than recommended. Or maybe
> > something like "Required (optional for backward compatibility)".
> >
> 
> Yes, it should be phrased as "required for new designs" because all new iProc
> SoCs using this GPIO driver need to have this in DT.
> 
> Thanks,
> 
> Ray

Thanks for providing feedback. I'll make sure to use this property under phrase " required for new designs " in next patch set.

Regards,
Pramod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
