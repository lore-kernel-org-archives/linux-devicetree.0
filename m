From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] irqchip: Add documentation for the bcm2836 interrupt
 controller.
Date: Mon, 13 Jul 2015 23:08:44 -0600
Message-ID: <55A4995C.4050701@wwwdotorg.org>
References: <1436303617-17185-1-git-send-email-eric@anholt.net> <1436303617-17185-4-git-send-email-eric@anholt.net> <55A0A251.1010301@wwwdotorg.org> <87io9r9qsi.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87io9r9qsi.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/11/2015 12:01 AM, Eric Anholt wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
> 
>> On 07/07/2015 03:13 PM, Eric Anholt wrote:
>>> This is a new per-cpu root interrupt controller on the
>>> Raspberry Pi 2, which will chain to the bcm2835 interrupt
>>> controller for peripheral interrupts.
>> 
>>> diff --git
>>> a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt
>>> b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.txt
>>
>>>
>>> 
+local_intc: local_intc {
>> 
>>> +	interrupt-parent = <&local_intc>;
>> 
>> I think that property shouldn't be there?
> 
> If you don't have it there, the core finds the interrupt-parent in
> the parent node, and waits for that one before initializing (which
> is in turn waiting for us).  Note that for original 2835, you're
> finding the parent node as well.

Ah yes. It does indeed look like it's typical that the root IRQ
controller points at itself.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
