From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/10] dt-bindings: interrupt-controllers: add description
 of SIC1 and SIC2
Date: Fri, 20 Nov 2015 19:52:56 +0200
Message-ID: <564F5DF8.7040908@mleia.com>
References: <1447982925-30138-1-git-send-email-vz@mleia.com> <1447982925-30138-4-git-send-email-vz@mleia.com> <20151120165835.GA17916@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151120165835.GA17916@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 20.11.2015 18:58, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 03:28:38AM +0200, Vladimir Zapolskiy wrote:
>> NXP LPC32xx has three interrupt controllers, namely root Main
>> Interrupt Controller (MIC) and two supplementary Sub Interrupt
>> Controllers (SIC1 and SIC2), four interrupt outputs from SIC1 and SIC2
>> are connected to MIC.
>>
>> Also the change describes two additional optional properties:
>> * interrupt-controller-name - human readable name of an interrupt
>>   controller,
> 
> Why? compatible is human readable. If you don't like that, then put the 
> string in the driver.

in runtime I'd like to differentiate various IRQ chips by name. Here for
example I have one compatible "*-sic" and two actual IRQ chips SIC1 and
SIC2. If I read /proc/interrupts or /sys/kernel/debug/irq_domain_mapping
I would prefer to visualize interrupts from SIC1 and SIC2.

I understand that this property is not hardware specific, but there are
plenty of similar properties like "label" etc. Probably renaming of the
property may help?

>> * wakeup-sources - list of mappings between a hardware interrupt and
>>   its correspondent wakeup source to exit CPU STOP mode.
> 
> This needs further discussion as I mentioned.

Ok.

> The rest looks fine.
> 

Thanks for review.

--
Best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
