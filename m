From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Fri, 9 Feb 2018 09:47:00 +0000
Message-ID: <6186117d-ff4f-a64f-9b5e-c3b3fac8bb88@arm.com>
References: <20180122092133.23177-1-rasmus.villemoes@prevas.dk>
 <20180125150230.7234-1-rasmus.villemoes@prevas.dk>
 <20180125150230.7234-2-rasmus.villemoes@prevas.dk>
 <20180205060705.cg3qywtqs65w74ee@rob-hp-laptop>
 <15ac0da3-e85b-c6be-366a-368934752018@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15ac0da3-e85b-c6be-366a-368934752018-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/02/18 15:08, Rasmus Villemoes wrote:
> On 2018-02-05 07:07, Rob Herring wrote:
>>> +Example:
>>> +	scfg: scfg@1570000 {
>>> +		compatible = "fsl,ls1021a-scfg", "syscon";
>>> +		...
>>> +		extirq: interrupt-controller {
>>> +			compatible = "fsl,ls1021a-extirq";
>>> +			#interrupt-cells = <3>;
>>> +			interrupt-controller;
>>> +			interrupt-parent = <&gic>;
>>> +			offset = <0x1ac>;
>>
>> Use reg here instead (with a length).
> 
> Hm, ok, but what does the length buy us? Should the driver just ignore
> it, or should it check that it is 4 and bail out if not?
> 
>>> +			interrupts = <163 164 165 167 168 169>;
>>
>> These don't look like GIC interrupt cells. Building this with current 
>> dtc will have errors.
> 
> Indeed, they are not. They simply record which interrupt lines on the
> GIC the external interrupt lines IRQ0...IRQ5 map to (the arm64 socs
> apparently have 12 such lines, but I don't know what they map to). I
> originally had that mapping in the driver, but I was asked to move it to
> DT. Is the problem the use of the name "interrupts" for this property?
> I'm happy to use something else (parent-interrupts, interrupt-mapping,
> ...) I find it very hard to figure out which property names have
> magic/reserved meanings.
> 
> I don't see any warnings/errors from dtc in the 4.14 tree I'm working
> on. Does it require an even newer dtc than that?

Most interrupt controllers use a private property, potentially with a
range (see the recent example of the Qualcomm PDC [1]).

Thanks,

	M.

[1] https://patchwork.kernel.org/patch/10208037/
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
