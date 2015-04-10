From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Fri, 10 Apr 2015 14:06:33 -0500
Message-ID: <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <20150410100529.GA6854@e104818-lin.cambridge.arm.com> <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org> <20150410161052.GF6854@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150410161052.GF6854@e104818-lin.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On Apr 10, 2015, at 11:10 AM, Catalin Marinas <catalin.marinas@arm.co=
m> wrote:
>=20
> On Fri, Apr 10, 2015 at 10:24:46AM -0500, Kumar Gala wrote:
>> On Apr 10, 2015, at 5:05 AM, Catalin Marinas <catalin.marinas@arm.co=
m> wrote:
>>> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
>>>> This patch set adds support for SMP boot on the MSM8x16 family of =
Qualcomm SoCs.
>>>>=20
>>>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM=
 interfaces to
>>>> setup the boot/release addresses for the secondary CPUs.  In addit=
ion we need
>>>> a uniquie set of cpu ops.  I'm aware the desired methods for booti=
ng secondary
>>>> CPUs is either via spintable or PSCI.  However, these SoCs are shi=
pping with a
>>>> firmware that does not support those methods.
>>>=20
>>> And the reason is? Some guesses:
>>>=20
>>> a) QC doesn't think boot interface (and cpuidle) standardisation is
>>>  worth the effort (to put it nicely)
>>> b) The hardware was available before we even mentioned PSCI
>>> c) PSCI is not suitable for the QC's SCM interface
>>> d) Any combination of the above
>>>=20
>>> I strongly suspect it's point (a). Should we expect future QC hardw=
are
>>> to do the same?
>>>=20
>>> You could argue the reason was (b), though we've been discussing PS=
CI
>>> for at least two years and, according to QC press releases, MSM8916
>>> started sampling in 2014.
>>>=20
>>> The only valid reason is (c) and if that's the case, I would expect=
 a
>>> proposal for a new firmware interface protocol (it could be PSCI-ba=
sed),
>>> well documented, that can be shared with others that may encounter =
the
>>> same shortcomings.
>>=20
>> Does it matter?  I=E2=80=99ve always felt the kernel was a place of =
inclusion.
>> Qualcomm choose for whatever reason to not use PSCI or spin table.
>> You don=E2=80=99t like it, I might not like it, but it is what it is=
=2E
>=20
> Yes, it matters, but only if Qualcomm wants the SoC support in mainli=
ne.
> Just because Qualcomm Inc does not want to invest in implementing a
> standard firmware interface is not a good enough reason to merge the
> kernel code.

The reason to merge the code upstream it expands functionality for a pl=
atform.  There is nothing that says when someone licenses an ARM core t=
hat they must also implement this standard.  Qualcomm choose for whatev=
er reasons to not implement it.  There are examples on other architectu=
res supporting non-standard platforms all the time (x86 supported Voyag=
er and SGI VIS for a long time).  As far as I can tell you are just wan=
ting uniformity to impose this rule.

> What if Qualcomm decides that it doesn't like DT, nor ACPI but comes =
up
> with yet another way to describe hardware because that's what the
> firmware provides? Should the kernel community take it? You could arg=
ue
> that this is a significant change but it's about the principle. And e=
ach
> SoC with its own non-standard boot protocol for no good reason is
> significant.

I wouldn=E2=80=99t argue that because we are talking about something th=
at has an extremely small impact on the maintainability or changes to h=
ow the kernel actually functions.  Also, if Qualcomm did come up with s=
ome other means to replace DT or ACPI and felt it was worth trying to g=
et accepted upstream, I would hope the upstream would look at it before=
 just saying it was not using some standard.

> It's not Qualcomm Inc maintaining the kernel code but individuals lik=
e
> you and me who may or may not be sponsored by Qualcomm. And being
> sponsored by a company to do kernel maintenance work does not mean th=
at
> said company decides what gets merged (on my side, ARM Ltd management=
 is
> aware of this, though it's not always easy for the parties involved).

=46air enough, but you=E2=80=99ve not given any reasons the code isn=E2=
=80=99t maintainable.  You=E2=80=99ve only said you don=E2=80=99t like =
it because it doesn=E2=80=99t use one of the defacto =E2=80=9Cstandards=
=E2=80=9D.

As you say, its individual doing the maintenance, so those individuals =
are not likely to have access to change firmware on a given device.  So=
 saying go change firmware is pretty much saying we don=E2=80=99t want =
to support your platform or code upstream.

> We haven't really asked for anything difficult like hardware changes,
> such decisions are left with Qualcomm. We asked for a standard secure
> firmware interface, either an existing one or, if not suitable (with
> good arguments), to come up with a proposal for an alternative
> _standard_ interface. I don't even have the certitude that the firmwa=
re
> interface used in these patches would be consistent across Qualcomm
> SoCs, let alone being properly documented.

If and when those issues arise we can accept or reject that code.  Righ=
t now when I look at the impact to supporting this to generic arch/arm6=
4 kernel it is either non-existant if we use the CPU_OF_TABLES or extre=
mely minor if we just add an entry to the supported_cpu_ops struct.

> So please come up with proper technical arguments rather than the ker=
nel
> should take whatever SoC vendors dreamt of.

There is no technical argument to be made.  This is about the community=
 and you as maintainer wanting to accept code that complies to your dec=
ision or not.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
