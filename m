From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller node
Date: Thu, 22 Oct 2015 18:41:05 -0500
Message-ID: <CAL_JsqJP3SDwiQ95WLJo0isTTxsQkpXDNNBpfVJXqbK99qtC=g@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
 <1445233398-27129-6-git-send-email-pramodku@broadcom.com> <CAL_Jsq+Xwf7==J1LLnUDtj-cgJWRizbKXcYtwfEe5iv8VS-Uwg@mail.gmail.com>
 <56293052.80402@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56293052.80402@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Pramod Kumar <pramodku@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 1:52 PM, Ray Jui <rjui@broadcom.com> wrote:
>
>
> On 10/22/2015 11:43 AM, Rob Herring wrote:
>>
>> On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar <pramodku@broadcom.com>
>> wrote:
>>>
>>> Add ngpios property to the gpio controller's DT node so that controller
>>> driver extracts total number of gpio lines present in controller
>>> from DT and removes dependency on driver.
>>>
>>> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
>>> Reviewed-by: Ray Jui <rjui@broadcom.com>
>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>> ---
>>>   Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5
>>> +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
>>> b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
>>> index f92b833..655a8d7 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
>>> @@ -10,6 +10,9 @@ Required properties:
>>>       Define the base and range of the I/O address space that contains
>>> the Cygnus
>>>   GPIO/PINCONF controller registers
>>>
>>> +- ngpios:
>>> +    Total number of GPIOs the controller provides
>>
>>
>> This must be optional for compatibility and the driver needs to handle
>> it not present.
>>
>
> You meant to be compatible with existing Cygnus devices, correct?
>
> Just to clarify, here you suggest we still leave the existing hard coded
> ngpios in the driver, in order to be compatible with all existing Cygnus
> devices (while the Cygnus device tree changes to use ngpio is still being
> merged and through different maintainer), and have all new iProc SoCs switch
> to use ngpios from device tree, right?

Yes, an existing dtb should continue to work with a new kernel. You
can add the DT property to the older devices too and then eventually
remove the hard coded values some time in the future. That could be
immediately (don't care about compatibility at all), a couple of
kernel cycles, never... It all depends on users of the impacted
platforms.

Rob
