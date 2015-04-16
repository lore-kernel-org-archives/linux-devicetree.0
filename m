MIME-Version: 1.0
In-Reply-To: <AF65C7BF-CBBD-4E03-95AA-495830D6DC20@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
	<20150410110328.GC25921@red-moon>
	<AF65C7BF-CBBD-4E03-95AA-495830D6DC20@codeaurora.org>
Date: Thu, 16 Apr 2015 17:08:32 -0500
Message-ID: <CAL_JsqJFAfAVmxAumxWHFLRmNcfHwpYfkiAUok1McguaWz0Vng@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Kumar Gala <galak@codeaurora.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "abhimany@codeaurora.org" <abhimany@codeaurora.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 10, 2015 at 10:25 AM, Kumar Gala <galak@codeaurora.org> wrote:
>
> On Apr 10, 2015, at 6:03 AM, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
>
>> On Thu, Apr 09, 2015 at 06:37:06PM +0100, Kumar Gala wrote:
>>> This patch set adds support for SMP boot on the MSM8x16 family of Qualcomm SoCs.
>>>
>>> To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM interfaces to
>>> setup the boot/release addresses for the secondary CPUs.  In addition we need
>>> a uniquie set of cpu ops.  I'm aware the desired methods for booting secondary
>>> CPUs is either via spintable or PSCI.  However, these SoCs are shipping with a
>>> firmware that does not support those methods.
>>
>> Why ? Do not tell me you were not aware of those standard methods,
>> because I can't believe you.
>>
>> If there were additional features to add to spin-table and PSCI,
>> you were, you are and you will always be welcome to debate them.
>>
>> There is no justification for this patchset, honestly.
>>
>> Lorenzo
>
> The justification for this patchset is support for a hardware platform that exists in the world.  The kernel usual is willing to accept such things as long as the code is reasonable.


>
> - k
>
> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
