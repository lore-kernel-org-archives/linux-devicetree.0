From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] devicetree: document NXP LPC1850 PINT irq controller binding
Date: Wed, 2 Mar 2016 19:25:27 +0100
Message-ID: <CAGhQ9Vw4DrhOn8=ACzTsX5ykbnq0Gp-qAjOrMhEHjgpz=8hO=A@mail.gmail.com>
References: <1456437887-24432-1-git-send-email-manabian@gmail.com>
	<1456437887-24432-3-git-send-email-manabian@gmail.com>
	<20160302181314.GA25030@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160302181314.GA25030@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2 March 2016 at 19:13, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Feb 25, 2016 at 11:04:47PM +0100, Joachim Eastwood wrote:
>> Add binding documentation for NXP LPC1850 GPIO Pin Interrupt (PINT)
>> controller.
>>
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../interrupt-controller/nxp,lpc1850-gpio-pint.txt | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
>> new file mode 100644
>> index 000000000000..dc43f187ebda
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt
>> @@ -0,0 +1,22 @@
>> +NXP LPC18xx/43xx GPIO Pin Interrupt (PINT) controller
>> +
>> +Required properties:
>> +
>> +- compatible : should be "nxp,lpc1850-gpio-pint".
>> +- reg : Specifies base physical address and size of the registers.
>> +- interrupt-controller : Identifies the node as an interrupt controller
>> +- #interrupt-cells : Specifies the number of cells needed to encode an
>> +  interrupt source. The value shall be 2.
>> +- interrupts : Specifies the CPU interrupts the controller is connected to.
>
> How many (8?) and what's the ordering?

The PINT on has 8 interrupts, but this is device dependent. Up to 32
could be supported.

The order is also device dependent. The interrupts on PINT are merely
mapped onto the main interrupt controller.

I tried to keep the wording in the binding generic so it could support
the PINT on different devices. I'll update the text with some more
details.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
