Return-Path: <SRS0=9hoZ=KE=huawei.com=jonathan.cameron@kernel.org>
Date: Fri, 20 Jul 2018 17:38:44 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add bindings for Hisilicon SEC crypto
 accelerators.
Message-ID: <20180720173844.000029a8@huawei.com>
In-Reply-To: <20180720163010.GA8047@rob-hp-laptop>
References: <20180716104342.24192-1-Jonathan.Cameron@huawei.com>
	<20180716104342.24192-2-Jonathan.Cameron@huawei.com>
	<20180720163010.GA8047@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, smueller@chronox.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linuxarm@huawei.com, xuzaibo@huwei.com, fanghao11@huawei.com, liguozhu@hisilicon.com, wangxiongfeng2@huawei.com
List-ID: <devicetree@vger.kernel.org>

On Fri, 20 Jul 2018 10:30:10 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, Jul 16, 2018 at 11:43:40AM +0100, Jonathan Cameron wrote:
> > The hip06 and hip07 SoCs contain a number of these crypto units which
> > accelerate AES and DES operations.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  .../bindings/crypto/hisilicon,hip07-sec.txt        | 69 ++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt b/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt
> > new file mode 100644
> > index 000000000000..00b838706c98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/hisilicon,hip07-sec.txt
> > @@ -0,0 +1,69 @@
> > +* Hisilicon hip07 Security Accelerator (SEC)
> > +
> > +Required properties:
> > +- compatible: Must contain one of
> > +  - "hisilicon,hip06-sec"
> > +  - "hisilicon,hip07-sec"
> > +- reg: Memory addresses and lengths of the memory regions used by the driver.  
> 
> You know my feelings about the word "driver" in bindings. :)

Oops. Will fix.  Oddly rare I actually write one of these docs so making newbie
mistakes :(

> 
> > +  Region 0 has registers to control the backend processing engines.
> > +  Region 1 has registers for functionality common to all queues.
> > +  Regions 2-18 have registers for the individual queues which are isolated
> > +  both in hardware and within the driver.  
> 
> It's always 16 queues? Might state that somewhere.

Technically complex because some of them may be in use by the secure world
and hence not available and not seen in the DT.
Right now the driver doesn't support that, and it's not happening on any
existing platforms but I was trying to avoid stating there were definitely
16 available. I guess if that happens I'll fix the binding when they do it.
(moderately unlikely to happen now given age of this platform, but you never
know).

> 
> > +- interrupts: Interrupt specifiers.
> > +  Refer to interrupt-controller/interrupts.txt for generic interrupt client node
> > +  bindings.
> > +  Interrupt 0 is for the SEC unit error queue.
> > +  Interrupt 2N + 1 is the completion interrupt for queue N.
> > +  Interrupt 2N + 2 is the error interrupt for queue N.
> > +- dma-coherent:  The driver assumes coherent dma is possible.
> > +
> > +Optional properties:
> > +- iommus: The SEC units are behind smmu-v3 iommus.
> > +  Refer to iommu/arm,smmu-v3.txt for more information.
> > +
> > +Example:
> > +Second socket, first unit chosen to illustrate need for 64 bit addresses.  
> 
> I don't follow the 64-bit address comment.

Without it the address is in the 32bit range so internal review raised
the question of why we needed to provide 64 bit registers as 32 bit ones
are more compact.

reg = <0xd000000 0x10000

etc

> 
> > +
> > +p1_sec_a: sec@d2000000 {  
> 
> crypto@...
> 
> The unit-address should be from the 1st reg entry and why isn't the 
> 0x400 part included?

Will fix here an obviously in the DT patch itself.

> 
> > +	compatible = "hisilicon,hip07-sec";
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;  
> 
> These aren't needed here as there are no child nodes.
Oops I always forget those.
> 
> > +	reg = <0x400 0xd0000000 0x0 0x10000
> > +	       0x400 0xd2000000 0x0 0x10000
> > +	       0x400 0xd2010000 0x0 0x10000
> > +	       0x400 0xd2020000 0x0 0x10000
> > +	       0x400 0xd2030000 0x0 0x10000
> > +	       0x400 0xd2040000 0x0 0x10000
> > +	       0x400 0xd2050000 0x0 0x10000
> > +	       0x400 0xd2060000 0x0 0x10000
> > +	       0x400 0xd2070000 0x0 0x10000
> > +	       0x400 0xd2080000 0x0 0x10000
> > +	       0x400 0xd2090000 0x0 0x10000
> > +	       0x400 0xd20a0000 0x0 0x10000
> > +	       0x400 0xd20b0000 0x0 0x10000
> > +	       0x400 0xd20c0000 0x0 0x10000
> > +	       0x400 0xd20d0000 0x0 0x10000
> > +	       0x400 0xd20e0000 0x0 0x10000
> > +	       0x400 0xd20f0000 0x0 0x10000
> > +	       0x400 0xd2100000 0x0 0x10000>;
> > +	interrupt-parent = <&p1_mbigen_sec_a>;
> > +	iommus = <&p1_smmu_alg_a 0x600>;
> > +	dma-coherent;
> > +	interrupts = <576 4>,
> > +		     <577 1>,<578 4>,  
> 
> space needed after the comma.
> 
> > +		     <579 1>,<580 4>,
> > +		     <581 1>,<582 4>,
> > +		     <583 1>,<584 4>,
> > +		     <585 1>,<586 4>,
> > +		     <587 1>,<588 4>,
> > +		     <589 1>,<590 4>,
> > +		     <591 1>,<592 4>,
> > +		     <593 1>,<594 4>,
> > +		     <595 1>,<596 4>,
> > +		     <597 1>,<598 4>,
> > +		     <599 1>,<600 4>,
> > +		     <601 1>,<602 4>,
> > +		     <603 1>,<604 4>,
> > +		     <605 1>,<606 4>,
> > +		     <607 1>,<608 4>;
> > +};
> > -- 
> > 2.16.2

Thanks Rob.

Jonathan
> > 
> >   
