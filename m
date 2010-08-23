From: "Lorenzo Pieralisi" <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: RE: [RFC PATCH 13/14] ARM: vexpress: Definition of vexpress dts
	specification
Date: Mon, 23 Aug 2010 16:47:14 +0100
Message-ID: <40271.717697806$1282578460@news.gmane.org>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-14-git-send-email-lorenzo.pieralisi@arm.com>
	<AANLkTimb1vgf1v3TQKsBFBPGrxr9iPpKY3Z6fzfAEPgZ@mail.gmail.com>
	<977313260285850582@unknownmsgid> <AANLkT! i=WiHd06=e4d_WdCe+HMfFh
	j-Q=xRS_4f-TzGUs@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=WiHd06=e4d_WdCe+HMfFhj-Q=xRS_4f-TzGUs-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

> -----Original Message-----
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt
> Likely
> Sent: 20 August 2010 21:32
> To: Lorenzo Pieralisi
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Philippe Robin; nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org;
> linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; Catalin Marinas; jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
> Subject: Re: [RFC PATCH 13/14] ARM: vexpress: Definition of vexpress dts
> specification
> =

> Hi Lorenzo,
> =

> On Fri, Aug 20, 2010 at 11:51 AM, Lorenzo Pieralisi
> <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> >> > +
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc@4e000000 {
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "smc,sm=
sc-911";
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x4e000000=
 0x1000>;
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <47>;
> >>
> >> I suspect this interrupts property is wrong. =A0An interrupts specifier
> >> is specific to the interrupt controller node; so this should always
> >> specify the interrupt input on a specific controller (either gic-cpu
> >> or gic-dist in this system). =A0It looks like '47' is the global irq
> >> number. =A0Am I correct?
> >>
> >
> > Strictly related to the previous point.
> >
> > When you say input Grant you mean input HW pin or interrupt HW ID ?
> >
> > I think you mean the irq ID specific to a given interrupt controller,
> > because that is what SW sees and controls.
> =

> I mean HW pin, but see discussion below to make sure we're talking
> about the same thing.
> =

> > 47 is the eth interrupt ID on the gic-dist, that in this particular
> > case becomes the global IRQ number as well if I am not mistaken.
> > (it is retrieved through the platform device resource).
> > I think it is correct as it is, but I will countercheck.
> =

> Okay.  Just to make sure I understand... I see two interrupt
> controllers in this device tree; gic-cpu and gic-dist.  I'm assuming
> that each irq controller has N interrupt inputs numbered 0..N-1.  My
> expectation would be that each device is wired to a single interrupt
> pin on one of the two controllers.  I also would expect that (unless
> there are two interrupt input pins on the CPU) one of the irq
> controllers is cascaded to the other.  Am I correct so far?
>

Well, it is the fact that I coded them as two controllers which is the
source of confusion, I apologise but it is good to start discussing =

a proper binding. =

The gic-cpu and gic-dist are two subcomponents of a single =

interrupt controller called GIC. Devices are wired to the gic-dist which
is in charge of distributing interrupts to the gic-cpu (per cpu IRQ IF). =

 =

> So, if 47 was the hardware input number, that would mean irq-dist had
> least 48 discrete interrupt inputs (this is actually what had me
> suspicious; I assumed that that are only 32 inputs on the gic
> controller but I didn't go and check).

The GIC deals with interrupts through ID numbers, and yes the gic-dist =

can have more than 48 discrete interrupts lines.
The point is that HW input pin numbers or wires map to irq ID through a shi=
ft
(e.g. HW ID 37 means interrupt pin 5, because the first 32 irq IDs are
used for SW IRQs and private (to one core) peripheral IRQs).
That's why I asked if  "interrupts" should represent the HW input pin/line.
Ethernet interrupt GIC HW ID is 47 (vexpress), but that does not mean =

the eth device irq line is connected to the 47th irq input line in =

the gic-dist because interrupt ID for peripherals start at ID 16 =

(and there are two kinds of peripherals, private to a core (ID 16..31) =

or common to all cores, ID 32 onwards).
TO be honest I do not think we should think in HW interrupt pin terms, in
this context it is the GIC HW ID that should go into "interrupts" (which in
turn means we may well end up having two identical "interrupts" values
on different GICs (cascaded), and that's perfectly fine because
they are relative to a given controller).

> =

> From the Linux perspective, the hw irq numbers for each controller
> needs to be mapped onto the flat Linux irq space.  So if gic-cpu has N
> irqs and gic-dist has M irqs, then the mapping might look something
> like this:
> =

> linux irq
> (0)   =3D=3D gic-cpu:0
> (1)   =3D=3D gic-cpu:1
> ...
> (N-2) =3D=3D gpi-cpu:N-2
> (N-1) =3D=3D gpi-cpu:N-1
> (N)   =3D=3D gic-dist:0
> (N+1) =3D=3D gic-dist:1
> ...
> (N+M-2) =3D=3D gpi-dist:M-2
> (N+M-1) =3D=3D gpi-dist:M-1
> =

> Am I still correct, or have I misunderstood the versatile interrupt
> controller architecture?

The two components have to be seen as one interrupt controller.
It is possible we need two "reg" properties since the offset between
gic-cpu registers and gic-dist ones may differ.
If there is a board/SoC with two cascaded GICs your reasoning
above applies, agreed, sorry for having split the single GIC in two
interrupt controllers, that caused confusion (but it is a RFC
to define a proper binding 8-) ).

> =

> Regardless though, the linux mapping doesn't actually have any bearing
> on the device tree because the mapping from HW to linux irq number is
> all internal to the kernel.  The kernel could choose to start the
> mapping at 42 or somewhere else and it would all still work.  The
> of_irq support code has all the information it needs to translate an
> interrupt specifier to an interrupt controller, and then map the
> number to the linux irq number.
> =


Agreed, and took your point and Warner's. I did not want to code the
Linux global number in the interrupts property. IMHO that should define
the GIC HW irq ID and it is not Linux specific, see above.
But due to the current mapping 47 ends up being the Linux IRQ number =

as well.
It is time I started writing a GIC binding since it is likely to be
reused for different boards (and gic init code should be factored out
of board specific dirs).

I hope it helps.

Thanks,
Lorenzo
