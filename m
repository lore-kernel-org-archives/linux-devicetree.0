From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 14:49:04 -0500
Message-ID: <07185B2C-3F37-4E70-9096-1EF5EA8D68CE@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <20150410100529.GA6854@e104818-lin.cambridge.arm.com> <20150414163613.GM28709@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150414163613.GM28709@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "abhimany@codeaurora.org" <abhimany@codeaurora.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> On Apr 14, 2015, at 11:36 AM, Mark Rutland <mark.rutland@arm.com> wro=
te:
>=20
> On Fri, Apr 10, 2015 at 11:05:29AM +0100, Catalin Marinas wrote:
>> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
>>> This patch set adds support for SMP boot on the MSM8x16 family of Q=
ualcomm SoCs.
>>>=20
>>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM =
interfaces to
>>> setup the boot/release addresses for the secondary CPUs.  In additi=
on we need
>>> a uniquie set of cpu ops.  I'm aware the desired methods for bootin=
g secondary
>>> CPUs is either via spintable or PSCI.  However, these SoCs are ship=
ping with a
>>> firmware that does not support those methods.
>>=20
>> And the reason is? Some guesses:
>>=20
>> a) QC doesn't think boot interface (and cpuidle) standardisation is
>>   worth the effort (to put it nicely)
>> b) The hardware was available before we even mentioned PSCI
>> c) PSCI is not suitable for the QC's SCM interface
>> d) Any combination of the above
>>=20
>> I strongly suspect it's point (a). Should we expect future QC hardwa=
re
>> to do the same?
>>=20
>> You could argue the reason was (b), though we've been discussing PSC=
I
>> for at least two years and, according to QC press releases, MSM8916
>> started sampling in 2014.
>>=20
>> The only valid reason is (c) and if that's the case, I would expect =
a
>> proposal for a new firmware interface protocol (it could be PSCI-bas=
ed),
>> well documented, that can be shared with others that may encounter t=
he
>> same shortcomings.
>=20
> There's no need to even fork PSCI. The PSCI specification will evolve
> over time as vendors request changes and we try to accomodate them.
>=20
> If there's something that PSCI doesn't do that you need it to, contac=
t
> ARM. Other vendors already have.

But what is someone to do between the period of getting PSCI spec updat=
ed and needing to ship a product with firmware?

The take still sounds like if you don=E2=80=99t implement an exact vers=
ion of PSCI you are screwed from being supported in the upstream ARM64 =
kernel.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
