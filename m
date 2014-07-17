From: pramod gurav <pramod.gurav.etc@gmail.com>
Subject: Re: [PATCH v4 1/3] soc: devicetree: bindings: Add Qualcomm RPM DT binding
Date: Thu, 17 Jul 2014 21:34:37 +0530
Message-ID: <CAMf-jSkvC4P8-06XbmMH2i0xHvaYwH_VbfG6Ypp3F+ct5ZxM+A@mail.gmail.com>
References: <1405465241-28684-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1405465241-28684-2-git-send-email-bjorn.andersson@sonymobile.com>
	<CAMf-jS=tkBYQ7mXp71F2_rPo6DE3e4C=sFHqg3Q26a08m6NxJQ@mail.gmail.com>
	<CAJAp7OggtuxPSc0yXzMCs10aQ2R6E+m4Bu8sdLJopvrZ3+5Rmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OggtuxPSc0yXzMCs10aQ2R6E+m4Bu8sdLJopvrZ3+5Rmg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 17, 2014 at 3:50 AM, Bjorn Andersson <bjorn@kryo.se> wrote:
>> On Wed, Jul 16, 2014 at 4:30 AM, Bjorn Andersson
>> <bjorn.andersson@sonymobile.com> wrote:
> [...]
>>> +       rpm@108000 {
>>> +               compatible = "qcom,rpm-msm8960";
>>> +               reg = <0x108000 0x1000>;
>>> +               qcom,ipc = <&apcs 0x8 2>;
>>
>> Tried adding this but there is no reference to 'apcs' registers itself
>> in any dts.
>>
>> Without these changes rpm breaks hence not able to test SATA which needs rpm.
>>
>
> Hi Pramod,
>
> Unfortunately the ipc bits resides in a block that needs to be
> accesses by various device drivers so I had to extract the access; so
> you now need to reference it via a syscon handle and offset instead -
> as described above.
>
> The apcs node I used for testing this with looks like this:
>
> apcs: syscon@2011000 {
>     compatible = "syscon";
>     reg = <0x2011000 0x1000>;
> };
>
> Enable CONFIG_MFD_SYSCON and put the dt snippet somewhere under soc
> and you should be good.
>

Thanks Bjorn. Did this and seen things working (sata atleast).

> Regards,
> Bjorn



-- 
Thanks and Regards
Pramod
