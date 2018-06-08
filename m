MIME-Version: 1.0
In-Reply-To: <20180608160058.04db4613@xps13>
References: <20180522094042.24770-1-miquel.raynal@bootlin.com>
	<20180522094042.24770-13-miquel.raynal@bootlin.com>
	<20180605202902.GA8875@rob-hp-laptop>
	<20180608160058.04db4613@xps13>
Date: Fri, 8 Jun 2018 15:34:29 -0600
Message-ID: <CAL_JsqLcmrv_EasRBUY+A+5hxbHYUGx1tU_ncioFghNy=ttrbw@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] dt-bindings/interrupt-controller: update Marvell
 ICU bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Haim Boot <hayim@marvell.com>, Hanna Hawa <hannah@marvell.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 8, 2018 at 8:00 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Hi Rob,
>
> Thanks for reviewing.
>
> On Tue, 5 Jun 2018 14:29:02 -0600, Rob Herring <robh@kernel.org> wrote:
>
>> On Tue, May 22, 2018 at 11:40:38AM +0200, Miquel Raynal wrote:
>> > Change the documentation to reflect the new bindings used for Marvell
>> > ICU. This involves describing each interrupt group as a subnode of the
>> > ICU node. Each of them having their own compatible.
>>
>> Need to explain why you need to do this and why breaking backwards
>> compatibility is okay.
>
> As explained by Thomas, backward compatibility is not broken as old
> bindings are still documented and supported.
>
> I will update the commit message to reflect that point.
>
>>
>> >
>> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> > ---
>> >  .../bindings/interrupt-controller/marvell,icu.txt  | 81 ++++++++++++++++++----
>> >  1 file changed, 69 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
>> > index 649b7ec9d9b1..6f7e4355b3d8 100644
>> > --- a/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
>> > +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,icu.txt
>> > @@ -5,6 +5,8 @@ The Marvell ICU (Interrupt Consolidation Unit) controller is
>> >  responsible for collecting all wired-interrupt sources in the CP and
>> >  communicating them to the GIC in the AP, the unit translates interrupt
>> >  requests on input wires to MSG memory mapped transactions to the GIC.
>> > +These messages will access a different GIC memory area depending on
>> > +their type (NSR, SR, SEI, REI, etc).
>> >
>> >  Required properties:
>> >
>> > @@ -12,20 +14,19 @@ Required properties:
>> >
>> >  - reg: Should contain ICU registers location and length.
>> >
>> > +Subnodes: Each group of interrupt is declared as a subnode of the ICU,
>> > +with their own compatible.
>> > +
>> > +Required properties for the icu_nsr/icu_sei subnodes:
>> > +
>> > +- compatible: Should be "marvell,cp110-icu-nsr" or "marvell,cp110-icu-sei".
>> > +
>> >  - #interrupt-cells: Specifies the number of cells needed to encode an
>> > -  interrupt source. The value shall be 3.
>> > +  interrupt source. The value shall be 2.
>> >
>> > -  The 1st cell is the group type of the ICU interrupt. Possible group
>> > -  types are:
>> > +  The 1st cell is the index of the interrupt in the ICU unit.
>> >
>> > -   ICU_GRP_NSR (0x0) : Shared peripheral interrupt, non-secure
>> > -   ICU_GRP_SR  (0x1) : Shared peripheral interrupt, secure
>> > -   ICU_GRP_SEI (0x4) : System error interrupt
>> > -   ICU_GRP_REI (0x5) : RAM error interrupt
>>
>> What happens to SR and REI interrupts?
>
> They were unused since the beginning.
>
> These values are still detailed below (in the legacy section).

And you'll never use them? Ever?

Rob
