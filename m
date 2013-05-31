From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 9/9] gpio-tz1090-pdc: add TZ1090 PDC gpio driver
Date: Fri, 31 May 2013 13:17:47 +0100
Message-ID: <51A894EB.3040604@imgtec.com>
References: <1369412476-14245-1-git-send-email-james.hogan@imgtec.com> <1369412476-14245-10-git-send-email-james.hogan@imgtec.com> <CACRpkdZ0Gav0TKDXyD9MwaUrdcenV=+JV9oWNN1+ifsbO3uJ1w@mail.gmail.com> <51A628E1.8060805@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51A628E1.8060805@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 29/05/13 17:12, James Hogan wrote:
> On 29/05/13 16:38, Linus Walleij wrote:
>> On Fri, May 24, 2013 at 6:21 PM, James Hogan <james.hogan@imgtec.com> wrote:
>>> +Optional properties:
>>> +- gpio-ranges: Mapping to pin controller pins
>>> +
>>> +- interrupts: Individual syswake interrupts (other GPIOs cannot interrupt)
>>> +
>>> +
>>> +Example:
>>> +
>>> +       pdc_gpios: gpio-controller@02006500 {
>>> +               gpio-controller;
>>> +               #gpio-cells = <2>;
>>> +
>>> +               compatible = "img,tz1090-pdc-gpio";
>>> +               reg = <0x02006500 0x100>;
>>> +
>>> +               interrupt-parent = <&pdc>;
>>> +               interrupts =    <1 0 0>,        /* Syswake 0 */
>>> +                               <1 1 0>,        /* Syswake 1 */
>>> +                               <1 2 0>;        /* Syswake 2 */
>>> +       };
>>
>> Interrupt flags seem to be undocumented here.
> 
> Hmmm yes, good spot.

Looking again at this, the driver doesn't expose any new interrupts.
These 3 interrupts are simply passed on by the gpio chip's to_irq()
callback. The flags in the example depend entirely on the interrupt
parent, in this case the PDC irq driver in patch 2, so they don't need
documenting here.

Cheers
James

