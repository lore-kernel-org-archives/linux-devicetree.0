From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Wed, 15 Apr 2015 15:27:30 +0100
Message-ID: <20150415142729.GC26099@e104818-lin.cambridge.arm.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
 <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org>
 <20150410161052.GF6854@e104818-lin.cambridge.arm.com>
 <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org>
 <20150413094117.GA2745@e104818-lin.cambridge.arm.com>
 <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 09:21:17AM -0500, Kumar Gala wrote:
> On Apr 13, 2015, at 4:41 AM, Catalin Marinas <catalin.marinas@arm.com=
> wrote:
> > On Fri, Apr 10, 2015 at 02:06:33PM -0500, Kumar Gala wrote:
> >> On Apr 10, 2015, at 11:10 AM, Catalin Marinas <catalin.marinas@arm=
=2Ecom> wrote:
> >> Qualcomm choose for whatever reasons to not implement it.  There a=
re
> >> examples on other architectures supporting non-standard platforms =
all
> >> the time (x86 supported Voyager and SGI VIS for a long time).  As =
far
> >> as I can tell you are just wanting uniformity to impose this rule.
> >=20
> > Don't confuse non-standard hardware (which has always been acceptab=
le on
> > ARM) with non-standard ways of entering the kernel from firmware,
> > whether it's a primary or secondary CPU. Just look at how many smp_=
ops
> > structures are defined on x86.
>=20
> When Voyager was supported it had a unique means for SMP bring up.

And was it fixed afterwards on newer board revisions?

> In the 4.0 kernel MIPS supports 13 different means, PowerPC has 14
> different means, ARM has 36 different means.

Obviously you don't think there is any problem with having 36 different
ways to enable secondary CPUs. I have a completely different opinion.
While it was not feasible to change the rules on arm32, it's a good
opportunity to impose some rules on arm64, given the new AArch64
exception model.

> > Looking beyond this set of patches, I can foresee that you won't ca=
re
> > about the generic arm64 cpuidle driver either, or more precisely th=
e
> > separation between cpuidle subsystem+driver and the SoC-specific
> > back-end (cpu_operations).
>=20
> That=E2=80=99s probably true for what I guess are a number of reasons=
=2E  I=E2=80=99m
> guessing the arm64 cpuidle driver expects PSCI.

Lorenzo replied already. It expects a cpu_operations back-end
implementing the cpu_suspend function. The only enable-method we have
providing cpu_suspend functionality is PSCI.

> >>> We haven't really asked for anything difficult like hardware chan=
ges,
> >>> such decisions are left with Qualcomm. We asked for a standard se=
cure
> >>> firmware interface, either an existing one or, if not suitable (w=
ith
> >>> good arguments), to come up with a proposal for an alternative
> >>> _standard_ interface. I don't even have the certitude that the fi=
rmware
> >>> interface used in these patches would be consistent across Qualco=
mm
> >>> SoCs, let alone being properly documented.
> >>=20
> >> If and when those issues arise we can accept or reject that code.
> >> Right now when I look at the impact to supporting this to generic
> >> arch/arm64 kernel it is either non-existant if we use the
> >> CPU_OF_TABLES or extremely minor if we just add an entry to the
> >> supported_cpu_ops struct.
> >=20
> > Again, see above about how such change is no longer small when each=
 SoC
> > does the same.
>=20
> There are so many places that we already deal with per SoC uniqueness=
=2E
> We setup a software interface in the kernel and people develop toward=
s
> it.
>=20
> Are you saying that going forward all SoCs should have the same
> clocking programming interface to ease portability?  Do you expect
> them all to have the same pin control programming interface if someon=
e
> defines a firmware abstraction?

What you said is primarily about device interfaces and given how
different they are, most of them not even requiring firmware
interaction, it doesn't make sense to come up with a firmware
abstraction (well, it may actually be impossible). But if you spot some
common pattern, it's fine by me to propose such interface.

However, what I'm not talking about devices but CPUs. The ARM CPUs are
defined by an architecture spec and they have a consistent behaviour.
Hardware for CPU powering on/off is not architected/standardised and
that's not because ARM wouldn't want to but because SoC vendors want to
be able differentiate. Given that (on ARMv8 especially) Linux is not th=
e
first thing to run on a CPU out of reset and it may need to go back to
firmware for deeper sleep states, it makes sense to at least hide some
of the implementation specific SoC details behind a standard firmware
interface. It keeps the hardware folk happy as they can design CPU powe=
r
on/off as they like with little impact on the software world. Yes, I
said "little" impact overall, the only thing needed is a shift of such
CPU enabling code from the kernel to firmware. ARM even provides an ope=
n
source (BSD) firmware to make things easier for partners and there is
similar work going into U-Boot.

Ideally you shouldn't place all the firmware in ROM (just part of it)
but even if it is and we find bugs that require working around in the
kernel, we can apply quirks on a case by case basis. But what you are
arguing about is to plainly ignore this standardisation effort.

Long term plan is to avoid most of the SoC specific code in the kernel
before device_initcall() level (wouldn't it be nice if you could load
the SoC support from modules in initramfs?). The clocks are an exceptio=
n
for the time being but it's something that could be sorted by sane prio=
r
firmware initialisation and just frequency changes at run-time (that's
what we are actually imposing on ACPI-capable SoCs).

--=20
Catalin
