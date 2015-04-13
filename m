From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Mon, 13 Apr 2015 10:41:18 +0100
Message-ID: <20150413094117.GA2745@e104818-lin.cambridge.arm.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
 <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org>
 <20150410161052.GF6854@e104818-lin.cambridge.arm.com>
 <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 10, 2015 at 02:06:33PM -0500, Kumar Gala wrote:
> On Apr 10, 2015, at 11:10 AM, Catalin Marinas <catalin.marinas@arm.co=
m> wrote:
> > On Fri, Apr 10, 2015 at 10:24:46AM -0500, Kumar Gala wrote:
> >> On Apr 10, 2015, at 5:05 AM, Catalin Marinas <catalin.marinas@arm.=
com> wrote:
> >>> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
> >>>> This patch set adds support for SMP boot on the MSM8x16 family o=
f Qualcomm SoCs.
> >>>>=20
> >>>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit S=
CM interfaces to
> >>>> setup the boot/release addresses for the secondary CPUs.  In add=
ition we need
> >>>> a uniquie set of cpu ops.  I'm aware the desired methods for boo=
ting secondary
> >>>> CPUs is either via spintable or PSCI.  However, these SoCs are s=
hipping with a
> >>>> firmware that does not support those methods.
> >>>=20
> >>> And the reason is? Some guesses:
> >>>=20
> >>> a) QC doesn't think boot interface (and cpuidle) standardisation =
is
> >>>  worth the effort (to put it nicely)
> >>> b) The hardware was available before we even mentioned PSCI
> >>> c) PSCI is not suitable for the QC's SCM interface
> >>> d) Any combination of the above
> >>>=20
> >>> I strongly suspect it's point (a). Should we expect future QC har=
dware
> >>> to do the same?
> >>>=20
> >>> You could argue the reason was (b), though we've been discussing =
PSCI
> >>> for at least two years and, according to QC press releases, MSM89=
16
> >>> started sampling in 2014.
> >>>=20
> >>> The only valid reason is (c) and if that's the case, I would expe=
ct a
> >>> proposal for a new firmware interface protocol (it could be PSCI-=
based),
> >>> well documented, that can be shared with others that may encounte=
r the
> >>> same shortcomings.
> >>=20
> >> Does it matter?  I=E2=80=99ve always felt the kernel was a place o=
f inclusion.
> >> Qualcomm choose for whatever reason to not use PSCI or spin table.
> >> You don=E2=80=99t like it, I might not like it, but it is what it =
is.
> >=20
> > Yes, it matters, but only if Qualcomm wants the SoC support in main=
line.
> > Just because Qualcomm Inc does not want to invest in implementing a
> > standard firmware interface is not a good enough reason to merge th=
e
> > kernel code.
>=20
> The reason to merge the code upstream it expands functionality for a
> platform.

This alone has never been a good enough reason. Code (both design and
style) needs to pass the review.

> There is nothing that says when someone licenses an ARM core that the=
y
> must also implement this standard.

Just to be perfectly clear: this has nothing to do with ARM Ltd nor the
ARM hardware licensing terms. ARM Ltd doesn't even require you to use
Linux, that's your choice. But when you make an OS choice, you have to
abide by its rules.

> Qualcomm choose for whatever reasons to not implement it.  There are
> examples on other architectures supporting non-standard platforms all
> the time (x86 supported Voyager and SGI VIS for a long time).  As far
> as I can tell you are just wanting uniformity to impose this rule.

Don't confuse non-standard hardware (which has always been acceptable o=
n
ARM) with non-standard ways of entering the kernel from firmware,
whether it's a primary or secondary CPU. Just look at how many smp_ops
structures are defined on x86.

> > What if Qualcomm decides that it doesn't like DT, nor ACPI but come=
s up
> > with yet another way to describe hardware because that's what the
> > firmware provides? Should the kernel community take it? You could a=
rgue
> > that this is a significant change but it's about the principle. And=
 each
> > SoC with its own non-standard boot protocol for no good reason is
> > significant.
>=20
> I wouldn=E2=80=99t argue that because we are talking about something =
that has
> an extremely small impact on the maintainability or changes to how th=
e
> kernel actually functions.

It's not about one particular case but about where to draw the line.
Just multiply this change by the number of SoC variants and you'll no
longer see this as "extremely small impact". Why would we accept it for
Qualcomm and reject it for others? It's either giving up trying to
standardise this altogether or enforcing rules. Since you only care
about Qualcomm hardware, you don't care about the overall picture.

By your reasoning, Qualcomm may solely decide to change the booting for
the primary CPU as well, ignore single Image requirements (well, why
would Qualcomm care about other SoCs) and so on. The kernel community
should just accept such changes without questioning because they expand
platform functionality. I am not asking for *hardware* standardisation
here, but common software interfaces.

> Also, if Qualcomm did come up with some other means to replace DT or
> ACPI and felt it was worth trying to get accepted upstream, I would
> hope the upstream would look at it before just saying it was not usin=
g
> some standard.

We would still expect proper technical arguments. That's exactly what
I'm asking here; is PSCI not suitable for Qualcomm? If not, can it be
improved? If you have completely different needs, can you come up with =
a
standard firmware interface, which may only be used by Qualcomm for the
time being, but at least guarantee consistency between subsequent
Qualcomm SoC revisions? But the message you give is pretty much
"Qualcomm cannot be bothered to explain itself to the kernel community"=
=2E

And what makes you think no-one looked at your code (there's an
unanswered question, asked twice, from Arnd already)? One of the first
steps in a review is looking at the overall design and asking questions
if the choices made are not clear. The review is not just about coding
style or spotting bugs.

Looking beyond this set of patches, I can foresee that you won't care
about the generic arm64 cpuidle driver either, or more precisely the
separation between cpuidle subsystem+driver and the SoC-specific
back-end (cpu_operations).

> > It's not Qualcomm Inc maintaining the kernel code but individuals l=
ike
> > you and me who may or may not be sponsored by Qualcomm. And being
> > sponsored by a company to do kernel maintenance work does not mean =
that
> > said company decides what gets merged (on my side, ARM Ltd manageme=
nt is
> > aware of this, though it's not always easy for the parties involved=
).
>=20
> Fair enough, but you=E2=80=99ve not given any reasons the code isn=E2=
=80=99t
> maintainable.  You=E2=80=99ve only said you don=E2=80=99t like it bec=
ause it doesn=E2=80=99t
> use one of the defacto =E2=80=9Cstandards=E2=80=9D.

See above about maintainability and how it no longer scales to tens of
SoCs on the long term.

> As you say, its individual doing the maintenance, so those individual=
s
> are not likely to have access to change firmware on a given device.
> So saying go change firmware is pretty much saying we don=E2=80=99t w=
ant to
> support your platform or code upstream.

I don't blame you here for the lack of standard firmware interfaces. Bu=
t
it's a message you should have given back to Qualcomm 2-3 years ago.
Maybe you did and Qualcomm ignored it, which kind of makes it worse.

> > We haven't really asked for anything difficult like hardware change=
s,
> > such decisions are left with Qualcomm. We asked for a standard secu=
re
> > firmware interface, either an existing one or, if not suitable (wit=
h
> > good arguments), to come up with a proposal for an alternative
> > _standard_ interface. I don't even have the certitude that the firm=
ware
> > interface used in these patches would be consistent across Qualcomm
> > SoCs, let alone being properly documented.
>=20
> If and when those issues arise we can accept or reject that code.
> Right now when I look at the impact to supporting this to generic
> arch/arm64 kernel it is either non-existant if we use the
> CPU_OF_TABLES or extremely minor if we just add an entry to the
> supported_cpu_ops struct.

Again, see above about how such change is no longer small when each SoC
does the same.

> > So please come up with proper technical arguments rather than the k=
ernel
> > should take whatever SoC vendors dreamt of.
>=20
> There is no technical argument to be made.  This is about the
> community and you as maintainer wanting to accept code that complies
> to your decision or not.

If you are not willing to make technical arguments, I don't have to
provide any further reasons in this thread. It's your choice. In the
meantime, the short answer is NAK.

--=20
Catalin
