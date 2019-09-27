From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v6 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Fri, 27 Sep 2019 21:16:50 +0000
Message-ID: <f63da257-95b4-bcb8-9ba4-9786645caf26@prevas.dk>
References: <20190923101513.32719-1-kurt@linutronix.de>
 <20190923101513.32719-3-kurt@linutronix.de> <20190927161118.GA19333@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927161118.GA19333@bogus>
Content-Language: en-US
Content-ID: <B78BBAF278F6A0498AA0DD162BF8ECC9@EURPRD10.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27/09/2019 18.11, Rob Herring wrote:
> On Mon, Sep 23, 2019 at 12:15:13PM +0200, Kurt Kanzenbach wrote:
>> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>>
>> This adds Device Tree binding documentation for the external interrupt
>> lines with configurable polarity present on some Layerscape SOCs.
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
>> ---
>>
>> +* Freescale Layerscape external IRQs
>> +
>> +Some Layerscape SOCs (LS1021A, LS1043A, LS1046A, LS2088A) support
>> +inverting the polarity of certain external interrupt lines.
>> +
>> +The device node must be a child of the node representing the
>> +Supplemental Configuration Unit (SCFG) or the Interrupt Sampling
>> +Control (ISC) Unit.
>> +
>> +Required properties:
>> +- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-exti=
rq".
>> +- interrupt-controller: Identifies the node as an interrupt controller
>> +- #interrupt-cells: Must be 2. The first element is the index of the
>> +  external interrupt line. The second element is the trigger type.
>> +- interrupt-parent: phandle of GIC.
>> +- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in th=
e SCFG.
>> +- fsl,extirq-map: Specifies the mapping to interrupt numbers in the par=
ent
>> +  interrupt controller. Interrupts are mapped one-to-one to parent
>> +  interrupts.
>=20
> This should be an 'interrupt-map' instead.

Rob, thanks for your review comments. I know you said the same thing at
v5, and it might seem like they are ignored. However, I asked a couple
of followup questions
(https://lore.kernel.org/lkml/0bb4533d-c749-d8ff-e1f2-4b08eb724713@prevas.d=
k/).
I'd really appreciate it if you could (a) point to some documentation on
how to write that interrupt-map and (b) explain how this is different
from the Qualcomm PDC case I tried to copy and which had your Reviewed-By.

>> +
>> +Optional properties:
>> +- fsl,bit-reverse: This boolean property should be set on the LS1021A
>> +  if the SCFGREVCR register has been set to all-ones (which is usually
>> +  the case), meaning that all reads and writes of SCFG registers are
>> +  implicitly bit-reversed. Other compatible platforms do not have such
>> +  a register.
>=20
> Couldn't you just read that register and tell?

In theory, yes, but as far as I understand (and as I wrote) it's
specific to the ls1021a. Of course one can decide whether it's
necessary/possible to read it based on the compatible string, but one
would also need an extra reg property to have its address - but that
register is not really part of the extirq "device" we're trying to
describe. So would it need to be represented as its own subnode of scfg?

If it is set at all, it's done within the first few instructions after
reset (before control is even handed to the bootloader), so I see it as
a kind of quirk of the hardware. The data sheet says "SCFG bit reverse
(SCFG_SCFGREVCR) must be written 0xFFFF_FFFF as a part of initialization
sequence before writing to any other SCFG register." which, taken
literally, means we don't need the property at all and can just assume
it for the ls1021a (i.e., do it based on compatible string alone) - but
I think it should be read as "if you're going to write this register, it
must be done first thing".

> Does this apply to only the extirq register or all of scfg?

All of scfg. It really seems like some accident/bad joke coming out of a
discussion between a hardware and software engineer on the enumeration
of bits, with the hardware guy ending up saying "alright, have it
whichever way you want it", causing even more pain :(

>> +
>> +Example:
>> +	scfg: scfg@1570000 {
>> +		compatible =3D "fsl,ls1021a-scfg", "syscon";
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>=20
> As the child node(s) are memory mapped, this should not be 0. And you=20
> need 'ranges'.

Indeed - I think I understand this a little better now than I did back then=
.

Thanks,
Rasmus
