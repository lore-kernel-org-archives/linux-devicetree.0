From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller node
Date: Fri, 23 Oct 2015 12:08:50 +0300
Message-ID: <3735458.2h6HCQhAOs@avalon>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <56293052.80402@broadcom.com> <CAL_JsqJP3SDwiQ95WLJo0isTTxsQkpXDNNBpfVJXqbK99qtC=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJP3SDwiQ95WLJo0isTTxsQkpXDNNBpfVJXqbK99qtC=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 October 2015 18:41:05 Rob Herring wrote:
> On Thu, Oct 22, 2015 at 1:52 PM, Ray Jui wrote:
> > On 10/22/2015 11:43 AM, Rob Herring wrote:
> >> On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar wrote:
> >>> Add ngpios property to the gpio controller's DT node so that controller
> >>> driver extracts total number of gpio lines present in controller
> >>> from DT and removes dependency on driver.
> >>> 
> >>> Signed-off-by: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>> ---
> >>> 
> >>>  Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5 +++
> >>>  1 file changed, 5 insertions(+)
> >>> 
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>> b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>> index f92b833..655a8d7 100644
> >>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>> 
> >>> @@ -10,6 +10,9 @@ Required properties:
> >>>       Define the base and range of the I/O address space that contains
> >>> the Cygnus
> >>>   GPIO/PINCONF controller registers
> >>> 
> >>> +- ngpios:
> >>> +    Total number of GPIOs the controller provides
> >> 
> >> This must be optional for compatibility and the driver needs to handle
> >> it not present.
> > 
> > You meant to be compatible with existing Cygnus devices, correct?
> > 
> > Just to clarify, here you suggest we still leave the existing hard coded
> > ngpios in the driver, in order to be compatible with all existing Cygnus
> > devices (while the Cygnus device tree changes to use ngpio is still being
> > merged and through different maintainer), and have all new iProc SoCs
> > switch to use ngpios from device tree, right?
> 
> Yes, an existing dtb should continue to work with a new kernel. You
> can add the DT property to the older devices too and then eventually
> remove the hard coded values some time in the future. That could be
> immediately (don't care about compatibility at all), a couple of
> kernel cycles, never... It all depends on users of the impacted
> platforms.

But shouldn't the property still be documented as required to ensure that new 
DTs always include it ?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
