From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3] hwspinlock: qcom: Add support for Qualcomm HW Mutex
 block
Date: Mon, 08 Sep 2014 11:57:39 -0600
Message-ID: <540DEE13.4090203@codeaurora.org>
References: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com> <2B6A9AA9-E69F-47DF-A1E7-5C95B4E6FA94@codeaurora.org> <20140903145508.GA16352@sonymobile.com> <5B5C3B14-0FC8-4B4B-AE33-69030B7863D8@codeaurora.org> <20140903163448.GB16352@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140903163448.GB16352@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Kumar Gala <galak@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Eric Holmberg <eholmber@codeaurora.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On 9/3/2014 10:34 AM, Bjorn Andersson wrote:
> On Wed 03 Sep 08:22 PDT 2014, Kumar Gala wrote:
>
>>
>> On Sep 3, 2014, at 9:55 AM, Bjorn Andersson <Bjorn.Andersson@sonymob=
ile.com> wrote:
>>
>>> On Wed 03 Sep 05:49 PDT 2014, Kumar Gala wrote:
>>>
>>>>
>>>> On Sep 2, 2014, at 3:04 PM, Bjorn Andersson <Bjorn.Andersson@sonym=
obile.com> wrote:
>>>>
>>>>> Changes since v2:
>>>>> - MODULE_DEVICE_TABLE
>>>>> - Changed prefix to qcom
>>>>> - Cleaned up includes
>>>>> - Rely on reg and num-locks to figure out stride, instead of of_m=
atch data
>>>>
>>>> I know Jeff prefers this method of computing stride, but I=92m not=
 a fan as
>>>> there isn=92t a reason one could adjust qcom,num-locks in the dt f=
or some
>>>> reason and leave regs alone.
>>>>
>>>
>>> All the current platform it's 32 consecutive mutexes with either 4 =
or 128 byte
>>> stride, so encoding it as data either way works fine. The hardware =
you're
>>> trying to describe with your dt is the addresses that spans your mu=
tex
>>> registers and how many there are. So from the HW/dts pov I don't se=
e why you
>>> would like to do this.
>>>
>>> Then looking in the caf code, there is a limit of max 8 mutexes. So=
 apparently
>>> there is some sort of usecase, I just don't know what or if it's va=
lid from a
>>> dt pov.
>>
>> I believe not all the mutexes are meant for the cores running linux.
>> However, I think we just expect linux to play nice and not touch any=
thing it
>> isn=92t using explicitly.
>>
>
> I would expect so too.

Currently, and I expect this to continue, the first 8 mutexes involve=20
usecases which involve Linux.  The remaining implemented locks support=20
usecases which do not involve the Linux cores.  Generally we expect=20
Linux to play nice, however it is possible to have hardware memory=20
protection units in the SoC configured to prevent the Linux cores from=20
accessing those upper locks.  From the global SoC pov, Linux should onl=
y=20
"see" the first 8.

>
> One problem I see is that it's not very robust relying on the relatio=
nship
> between reg and num-locks. I consider this an implementation detail l=
eaking
> into the dt binding and it's not described enough currently...
>
>>> Going to that future awesome SoCs where it's still called tcsr-mute=
x, but with
>>> a stride of 4096 bytes makes me wonder; is that really a consecutiv=
e 128kb with
>>> nothing else in-between that we can ioremap?
>>
>> think 64-bit machines with more address space to burn and wanting to=
 separate
>> resources to use MMUs for protection.
>>
>
> Makes sense, I just don't have any documentation verifying this.
>
>>> I.e. can we really reuse this driver straight off for that SoC?
>>
>> I dont see why not.
>>
>
> As long as the space inbetween is just wasted, there is no issue.

Have a look at the msm8916.dtsi in the downstream repository.  I think=20
it'll help with your questions concerning the 0x1000 stride case.

>
>>>>> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspin=
lock.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
>>>>> +- compatible:
>>>>> +	Usage: required
>>>>> +	Value type: <string>
>>>>> +	Definition: must be one of:
>>>>> +		    "qcom,sfpb-mutex",
>>>>> +		    "qcom,tcsr-mutex=94
>>>>
>>>> I dont get the purpose of having different compatible strings if t=
here is no
>>>> difference in the code between them.
>>>>
>>>
>>> The semantics are the same, but there are no mutex registers in the=
 tcsr block
>>> in e.g 8960, so the name is just missleading. I assume that's why y=
ou didn't
>>> follow caf and used the compatible "sfpb" in the first place?
>>
>> What do you expect the 8960 dt node to look like?  I=92m not 100% ag=
ainst =91sfpb=92
>>
>> I=92m feel like we we should use compat for stride, so we=92d end up=
 with something like:
>>
>> qcom,sfpb-mutex: stride 4 bytes, base: 0x01200604, reset: 0x01200600
>> qcom,tcsr-mutex: stride 128 bytes, base: 0xFD484000, reset: 0xFD4853=
80
>> qcom,tcsr-4k-mutex: stride 4k bytes, base: 0x740000, reset: 0x767000
>>
>
> Maybe these are the best names for the 3 hw blocks after all.
>
> The alternative would be either to encode the platform name in the co=
mpatible
> or adding the stride as a separate property. The first is waste and t=
he second
> doesn't describe how hw is connected. So netiher are good alternative=
s.
>
>
> I think your suggestion is reasonable and will move the stride back i=
nto
> compat. It's the most robust solution.
>
> Is the 4k block finalized (don't see it in 8994 docs)? Should I add i=
t to the
> driver now as well?
>
> Thanks for your input!
>
> Regards,
> Bjorn
>


Jeffrey Hugo
--=20
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,=20
hosted by The Linux Foundation.
