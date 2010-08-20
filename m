From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 13/14] ARM: vexpress: Definition of vexpress dts
	specification
Date: Fri, 20 Aug 2010 14:32:11 -0600
Message-ID: <AANLkTi=WiHd06=e4d_WdCe+HMfFhj-Q=xRS_4f-TzGUs@mail.gmail.com>
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
	<977313260285850582@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <977313260285850582@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Fri, Aug 20, 2010 at 11:51 AM, Lorenzo Pieralisi
<Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > +
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smsc@4e000000 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "smc,smsc=
-911";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x4e000000 0=
x1000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <47>;
>>
>> I suspect this interrupts property is wrong. =A0An interrupts specifier
>> is specific to the interrupt controller node; so this should always
>> specify the interrupt input on a specific controller (either gic-cpu
>> or gic-dist in this system). =A0It looks like '47' is the global irq
>> number. =A0Am I correct?
>>
>
> Strictly related to the previous point.
>
> When you say input Grant you mean input HW pin or interrupt HW ID ?
>
> I think you mean the irq ID specific to a given interrupt controller,
> because that is what SW sees and controls.

I mean HW pin, but see discussion below to make sure we're talking
about the same thing.

> 47 is the eth interrupt ID on the gic-dist, that in this particular
> case becomes the global IRQ number as well if I am not mistaken.
> (it is retrieved through the platform device resource).
> I think it is correct as it is, but I will countercheck.

Okay.  Just to make sure I understand... I see two interrupt
controllers in this device tree; gic-cpu and gic-dist.  I'm assuming
that each irq controller has N interrupt inputs numbered 0..N-1.  My
expectation would be that each device is wired to a single interrupt
pin on one of the two controllers.  I also would expect that (unless
there are two interrupt input pins on the CPU) one of the irq
controllers is cascaded to the other.  Am I correct so far?

So, if 47 was the hardware input number, that would mean irq-dist had
least 48 discrete interrupt inputs (this is actually what had me
suspicious; I assumed that that are only 32 inputs on the gic
controller but I didn't go and check).

>From the Linux perspective, the hw irq numbers for each controller
needs to be mapped onto the flat Linux irq space.  So if gic-cpu has N
irqs and gic-dist has M irqs, then the mapping might look something
like this:

linux irq
(0)   =3D=3D gic-cpu:0
(1)   =3D=3D gic-cpu:1
...
(N-2) =3D=3D gpi-cpu:N-2
(N-1) =3D=3D gpi-cpu:N-1
(N)   =3D=3D gic-dist:0
(N+1) =3D=3D gic-dist:1
...
(N+M-2) =3D=3D gpi-dist:M-2
(N+M-1) =3D=3D gpi-dist:M-1

Am I still correct, or have I misunderstood the versatile interrupt
controller architecture?

Regardless though, the linux mapping doesn't actually have any bearing
on the device tree because the mapping from HW to linux irq number is
all internal to the kernel.  The kernel could choose to start the
mapping at 42 or somewhere else and it would all still work.  The
of_irq support code has all the information it needs to translate an
interrupt specifier to an interrupt controller, and then map the
number to the linux irq number.

[...]
>> > + =A0 =A0 =A0 clocks {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ref24_clk: clock@0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "clock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-cl=
ock";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <240=
00000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-output-names =3D "=
ref";
>>
>> This will of course need to be updated to the clock binding that
>> Jeremy and I have settled on, but you already knew that. =A0:-)
>>
>
> Yes, again, you are right I knew that but I wanted to post a version
> I completely tested before applying the new clock bindings when rebasing.
> I will update the code for the next respin.


Cool, I look forward to seeing it.  Thanks!

g.
