From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 09:21:17 -0500
Message-ID: <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <20150410100529.GA6854@e104818-lin.cambridge.arm.com> <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org> <20150410161052.GF6854@e104818-lin.cambridge.arm.com> <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org> <20150413094117.GA2745@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150413094117.GA2745@e104818-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On Apr 13, 2015, at 4:41 AM, Catalin Marinas <catalin.marinas@arm.com=
> wrote:
>=20
> On Fri, Apr 10, 2015 at 02:06:33PM -0500, Kumar Gala wrote:
>> On Apr 10, 2015, at 11:10 AM, Catalin Marinas <catalin.marinas@arm.c=
om> wrote:
>>> On Fri, Apr 10, 2015 at 10:24:46AM -0500, Kumar Gala wrote:
>>>> On Apr 10, 2015, at 5:05 AM, Catalin Marinas <catalin.marinas@arm.=
com> wrote:
>>>>> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
>>>>>> This patch set adds support for SMP boot on the MSM8x16 family o=
f Qualcomm SoCs.
>>>>>>=20
>>>>>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit S=
CM interfaces to
>>>>>> setup the boot/release addresses for the secondary CPUs.  In add=
ition we need
>>>>>> a uniquie set of cpu ops.  I'm aware the desired methods for boo=
ting secondary
>>>>>> CPUs is either via spintable or PSCI.  However, these SoCs are s=
hipping with a
>>>>>> firmware that does not support those methods.
>>>>>=20
>>>>> And the reason is? Some guesses:
>>>>>=20
>>>>> a) QC doesn't think boot interface (and cpuidle) standardisation =
is
>>>>> worth the effort (to put it nicely)
>>>>> b) The hardware was available before we even mentioned PSCI
>>>>> c) PSCI is not suitable for the QC's SCM interface
>>>>> d) Any combination of the above
>>>>>=20
>>>>> I strongly suspect it's point (a). Should we expect future QC har=
dware
>>>>> to do the same?
>>>>>=20
>>>>> You could argue the reason was (b), though we've been discussing =
PSCI
>>>>> for at least two years and, according to QC press releases, MSM89=
16
>>>>> started sampling in 2014.
>>>>>=20
>>>>> The only valid reason is (c) and if that's the case, I would expe=
ct a
>>>>> proposal for a new firmware interface protocol (it could be PSCI-=
based),
>>>>> well documented, that can be shared with others that may encounte=
r the
>>>>> same shortcomings.
>>>>=20
>>>> Does it matter?  I=E2=80=99ve always felt the kernel was a place o=
f inclusion.
>>>> Qualcomm choose for whatever reason to not use PSCI or spin table.
>>>> You don=E2=80=99t like it, I might not like it, but it is what it =
is.
>>>=20
>>> Yes, it matters, but only if Qualcomm wants the SoC support in main=
line.
>>> Just because Qualcomm Inc does not want to invest in implementing a
>>> standard firmware interface is not a good enough reason to merge th=
e
>>> kernel code.
>>=20
>> The reason to merge the code upstream it expands functionality for a
>> platform.
>=20
> This alone has never been a good enough reason. Code (both design and
> style) needs to pass the review.

You haven=E2=80=99t really made any comments about the code itself, oth=
er than just not liking the firmware interface.

> There is nothing that says when someone licenses an ARM core that the=
y
>> must also implement this standard.
>=20
> Just to be perfectly clear: this has nothing to do with ARM Ltd nor t=
he
> ARM hardware licensing terms. ARM Ltd doesn't even require you to use
> Linux, that's your choice. But when you make an OS choice, you have t=
o
> abide by its rules.

But Linux has tended to support hardware as broadly as it can.  Yes it =
tries to get firmware to improve but there are numerous devices with em=
bedded firmware interfaces that Linux probably would love to change but=
 deals with because they are fixed.

> Qualcomm choose for whatever reasons to not implement it.  There are
>> examples on other architectures supporting non-standard platforms al=
l
>> the time (x86 supported Voyager and SGI VIS for a long time).  As fa=
r
>> as I can tell you are just wanting uniformity to impose this rule.
>=20
> Don't confuse non-standard hardware (which has always been acceptable=
 on
> ARM) with non-standard ways of entering the kernel from firmware,
> whether it's a primary or secondary CPU. Just look at how many smp_op=
s
> structures are defined on x86.

When Voyager was supported it had a unique means for SMP bring up.  In =
the 4.0 kernel MIPS supports 13 different means, PowerPC has 14 differe=
nt means, ARM has 36 different means.

>>> What if Qualcomm decides that it doesn't like DT, nor ACPI but come=
s up
>>> with yet another way to describe hardware because that's what the
>>> firmware provides? Should the kernel community take it? You could a=
rgue
>>> that this is a significant change but it's about the principle. And=
 each
>>> SoC with its own non-standard boot protocol for no good reason is
>>> significant.
>>=20
>> I wouldn=E2=80=99t argue that because we are talking about something=
 that has
>> an extremely small impact on the maintainability or changes to how t=
he
>> kernel actually functions.
>=20
> It's not about one particular case but about where to draw the line.
> Just multiply this change by the number of SoC variants and you'll no
> longer see this as "extremely small impact". Why would we accept it f=
or
> Qualcomm and reject it for others? It's either giving up trying to
> standardise this altogether or enforcing rules. Since you only care
> about Qualcomm hardware, you don't care about the overall picture.
>=20
> By your reasoning, Qualcomm may solely decide to change the booting f=
or
> the primary CPU as well, ignore single Image requirements (well, why
> would Qualcomm care about other SoCs) and so on. The kernel community
> should just accept such changes without questioning because they expa=
nd
> platform functionality. I am not asking for *hardware* standardisatio=
n
> here, but common software interfaces.
>=20
>> Also, if Qualcomm did come up with some other means to replace DT or
>> ACPI and felt it was worth trying to get accepted upstream, I would
>> hope the upstream would look at it before just saying it was not usi=
ng
>> some standard.
>=20
> We would still expect proper technical arguments. That's exactly what
> I'm asking here; is PSCI not suitable for Qualcomm? If not, can it be
> improved? If you have completely different needs, can you come up wit=
h a
> standard firmware interface, which may only be used by Qualcomm for t=
he
> time being, but at least guarantee consistency between subsequent
> Qualcomm SoC revisions? But the message you give is pretty much
> "Qualcomm cannot be bothered to explain itself to the kernel communit=
y".
>=20
> And what makes you think no-one looked at your code (there's an
> unanswered question, asked twice, from Arnd already)? One of the firs=
t
> steps in a review is looking at the overall design and asking questio=
ns
> if the choices made are not clear. The review is not just about codin=
g
> style or spotting bugs.

Agreed, I need to address Arnd=E2=80=99s comment.  However, if there is=
n=E2=80=99t any likehood of getting this code accepted at all to suppor=
t this device than there really isn=E2=80=99t any point.

> Looking beyond this set of patches, I can foresee that you won't care
> about the generic arm64 cpuidle driver either, or more precisely the
> separation between cpuidle subsystem+driver and the SoC-specific
> back-end (cpu_operations).

That=E2=80=99s probably true for what I guess are a number of reasons. =
 I=E2=80=99m guessing the arm64 cpuidle driver expects PSCI.

>>> It's not Qualcomm Inc maintaining the kernel code but individuals l=
ike
>>> you and me who may or may not be sponsored by Qualcomm. And being
>>> sponsored by a company to do kernel maintenance work does not mean =
that
>>> said company decides what gets merged (on my side, ARM Ltd manageme=
nt is
>>> aware of this, though it's not always easy for the parties involved=
).
>>=20
>> Fair enough, but you=E2=80=99ve not given any reasons the code isn=E2=
=80=99t
>> maintainable.  You=E2=80=99ve only said you don=E2=80=99t like it be=
cause it doesn=E2=80=99t
>> use one of the defacto =E2=80=9Cstandards=E2=80=9D.
>=20
> See above about maintainability and how it no longer scales to tens o=
f
> SoCs on the long term.
>=20
>> As you say, its individual doing the maintenance, so those individua=
ls
>> are not likely to have access to change firmware on a given device.
>> So saying go change firmware is pretty much saying we don=E2=80=99t =
want to
>> support your platform or code upstream.
>=20
> I don't blame you here for the lack of standard firmware interfaces. =
But
> it's a message you should have given back to Qualcomm 2-3 years ago.
> Maybe you did and Qualcomm ignored it, which kind of makes it worse.
>=20
>>> We haven't really asked for anything difficult like hardware change=
s,
>>> such decisions are left with Qualcomm. We asked for a standard secu=
re
>>> firmware interface, either an existing one or, if not suitable (wit=
h
>>> good arguments), to come up with a proposal for an alternative
>>> _standard_ interface. I don't even have the certitude that the firm=
ware
>>> interface used in these patches would be consistent across Qualcomm
>>> SoCs, let alone being properly documented.
>>=20
>> If and when those issues arise we can accept or reject that code.
>> Right now when I look at the impact to supporting this to generic
>> arch/arm64 kernel it is either non-existant if we use the
>> CPU_OF_TABLES or extremely minor if we just add an entry to the
>> supported_cpu_ops struct.
>=20
> Again, see above about how such change is no longer small when each S=
oC
> does the same.

There are so many places that we already deal with per SoC uniqueness. =
 We setup a software interface in the kernel and people develop towards=
 it.

Are you saying that going forward all SoCs should have the same clockin=
g programming interface to ease portability?  Do you expect them all to=
 have the same pin control programming interface if someone defines a f=
irmware abstraction?

>>> So please come up with proper technical arguments rather than the k=
ernel
>>> should take whatever SoC vendors dreamt of.
>>=20
>> There is no technical argument to be made.  This is about the
>> community and you as maintainer wanting to accept code that complies
>> to your decision or not.
>=20
> If you are not willing to make technical arguments, I don't have to
> provide any further reasons in this thread. It's your choice. In the
> meantime, the short answer is NAK.

=46rom my understanding for this given device when the firmware was dev=
eloped PSCI wasn=E2=80=99t available.  I=E2=80=99m not really familiar =
with the details.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
