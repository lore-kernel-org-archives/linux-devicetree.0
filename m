From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 22:17:26 +0100
Message-ID: <20150414211720.GA56647@MBP>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
 <20150414163613.GM28709@leverpostej>
 <07185B2C-3F37-4E70-9096-1EF5EA8D68CE@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <07185B2C-3F37-4E70-9096-1EF5EA8D68CE@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "abhimany@codeaurora.org" <abhimany@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 02:49:04PM -0500, Kumar Gala wrote:
> On Apr 14, 2015, at 11:36 AM, Mark Rutland <mark.rutland@arm.com> wro=
te:
> > On Fri, Apr 10, 2015 at 11:05:29AM +0100, Catalin Marinas wrote:
> >> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
> >>> This patch set adds support for SMP boot on the MSM8x16 family of=
 Qualcomm SoCs.
> >>>=20
> >>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SC=
M interfaces to
> >>> setup the boot/release addresses for the secondary CPUs.  In addi=
tion we need
> >>> a uniquie set of cpu ops.  I'm aware the desired methods for boot=
ing secondary
> >>> CPUs is either via spintable or PSCI.  However, these SoCs are sh=
ipping with a
> >>> firmware that does not support those methods.
> >>=20
> >> And the reason is? Some guesses:
> >>=20
> >> a) QC doesn't think boot interface (and cpuidle) standardisation i=
s
> >>   worth the effort (to put it nicely)
> >> b) The hardware was available before we even mentioned PSCI
> >> c) PSCI is not suitable for the QC's SCM interface
> >> d) Any combination of the above
> >>=20
> >> I strongly suspect it's point (a). Should we expect future QC hard=
ware
> >> to do the same?
> >>=20
> >> You could argue the reason was (b), though we've been discussing P=
SCI
> >> for at least two years and, according to QC press releases, MSM891=
6
> >> started sampling in 2014.
> >>=20
> >> The only valid reason is (c) and if that's the case, I would expec=
t a
> >> proposal for a new firmware interface protocol (it could be PSCI-b=
ased),
> >> well documented, that can be shared with others that may encounter=
 the
> >> same shortcomings.
> >=20
> > There's no need to even fork PSCI. The PSCI specification will evol=
ve
> > over time as vendors request changes and we try to accomodate them.
> >=20
> > If there's something that PSCI doesn't do that you need it to, cont=
act
> > ARM. Other vendors already have.

Mostly yes but there may be valid reasons for not being able to use
PSCI. The spin-table method is still a firmware interface, though not
necessarily secure (a.k.a. SMC-based). The ACPI parking protocol is
another and, who knows, maybe we define a way to park CPUs back to
firmware without SMC calls (when EL3 is not available).

> But what is someone to do between the period of getting PSCI spec
> updated and needing to ship a product with firmware?
>=20
> The take still sounds like if you don=E2=80=99t implement an exact ve=
rsion of
> PSCI you are screwed from being supported in the upstream ARM64
> kernel.

These are silly arguments. There is a big difference between "we
couldn't get the firmware implementing the standard for the early
silicon but we are working on fixing it for future revisions" vs. "we
don't give a s**t about these standards, the kernel must be inclusive".
So please make up your mind on which direction you want to pursue.

--=20
Catalin
