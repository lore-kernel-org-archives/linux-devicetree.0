From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller node
Date: Fri, 23 Oct 2015 16:02:56 +0300
Message-ID: <2123166.E4KEJx3AQ2@avalon>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <3735458.2h6HCQhAOs@avalon> <CAL_Jsq+Va0ZnvNoqKWocFYE4_DD-A+2sQaLswy5_eO2ZHn+3Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Va0ZnvNoqKWocFYE4_DD-A+2sQaLswy5_eO2ZHn+3Kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Friday 23 October 2015 06:51:28 Rob Herring wrote:
> On Fri, Oct 23, 2015 at 4:08 AM, Laurent Pinchart wrote:
> > On Thursday 22 October 2015 18:41:05 Rob Herring wrote:
> >> On Thu, Oct 22, 2015 at 1:52 PM, Ray Jui wrote:
> >>> On 10/22/2015 11:43 AM, Rob Herring wrote:
> >>>> On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar wrote:
> >>>>> Add ngpios property to the gpio controller's DT node so that
> >>>>> controller driver extracts total number of gpio lines present in
> >>>>> controller from DT and removes dependency on driver.
> >>>>> 
> >>>>> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> >>>>> Reviewed-by: Ray Jui <rjui@broadcom.com>
> >>>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> >>>>> ---
> >>>>> 
> >>>>>  Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5
> >>>>>  +++
> >>>>>  1 file changed, 5 insertions(+)
> >>>>> 
> >>>>> diff --git
> >>>>> a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>> b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>> index f92b833..655a8d7 100644
> >>>>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> >>>>> 
> >>>>> @@ -10,6 +10,9 @@ Required properties:
> >>>>>       Define the base and range of the I/O address space that
> >>>>>       contains
> >>>>> 
> >>>>> the Cygnus
> >>>>> 
> >>>>>   GPIO/PINCONF controller registers
> >>>>> 
> >>>>> +- ngpios:
> >>>> +    Total number of GPIOs the controller provides
> >>>> 
> >>>> This must be optional for compatibility and the driver needs to handle
> >>>> it not present.
> >>> 
> >>> You meant to be compatible with existing Cygnus devices, correct?
> >>> 
> >>> Just to clarify, here you suggest we still leave the existing hard
> >>> coded ngpios in the driver, in order to be compatible with all existing
> >>> Cygnus devices (while the Cygnus device tree changes to use ngpio is
> >>> still being merged and through different maintainer), and have all new
> >>> iProc SoCs switch to use ngpios from device tree, right?
> >> 
> >> Yes, an existing dtb should continue to work with a new kernel. You
> >> can add the DT property to the older devices too and then eventually
> >> remove the hard coded values some time in the future. That could be
> >> immediately (don't care about compatibility at all), a couple of
> >> kernel cycles, never... It all depends on users of the impacted
> >> platforms.
> > 
> > But shouldn't the property still be documented as required to ensure that
> > new DTs always include it ?
> 
> Good point. If the intent is to eventually remove it from the driver,
> then yes. We probably need "required for new designs" as a category or
> maybe "recommended"? The wording is not so important here, but I'm
> thinking about as we try to standardize the naming.

Required for new designs sounds better than recommended. Or maybe something 
like "Required (optional for backward compatibility)".

-- 
Regards,

Laurent Pinchart
