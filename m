From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v4 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Thu, 8 Feb 2018 16:08:01 +0100
Message-ID: <15ac0da3-e85b-c6be-366a-368934752018@prevas.dk>
References: <20180122092133.23177-1-rasmus.villemoes@prevas.dk>
 <20180125150230.7234-1-rasmus.villemoes@prevas.dk>
 <20180125150230.7234-2-rasmus.villemoes@prevas.dk>
 <20180205060705.cg3qywtqs65w74ee@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180205060705.cg3qywtqs65w74ee@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andy Tang <andy.tang@nxp.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-02-05 07:07, Rob Herring wrote:
>> +Example:
>> +	scfg: scfg@1570000 {
>> +		compatible = "fsl,ls1021a-scfg", "syscon";
>> +		...
>> +		extirq: interrupt-controller {
>> +			compatible = "fsl,ls1021a-extirq";
>> +			#interrupt-cells = <3>;
>> +			interrupt-controller;
>> +			interrupt-parent = <&gic>;
>> +			offset = <0x1ac>;
> 
> Use reg here instead (with a length).

Hm, ok, but what does the length buy us? Should the driver just ignore
it, or should it check that it is 4 and bail out if not?

>> +			interrupts = <163 164 165 167 168 169>;
> 
> These don't look like GIC interrupt cells. Building this with current 
> dtc will have errors.

Indeed, they are not. They simply record which interrupt lines on the
GIC the external interrupt lines IRQ0...IRQ5 map to (the arm64 socs
apparently have 12 such lines, but I don't know what they map to). I
originally had that mapping in the driver, but I was asked to move it to
DT. Is the problem the use of the name "interrupts" for this property?
I'm happy to use something else (parent-interrupts, interrupt-mapping,
...) I find it very hard to figure out which property names have
magic/reserved meanings.

I don't see any warnings/errors from dtc in the 4.14 tree I'm working
on. Does it require an even newer dtc than that?

Thanks,
Rasmus
