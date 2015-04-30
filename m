From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [RFC 00/12] On-demand device registration
Date: Thu, 30 Apr 2015 09:44:27 +0200
Message-ID: <5541DD5B.5090604@ahsoftware.de>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com> <553ACE96.2040804@ahsoftware.de> <CAAObsKAa_yEwcWQTJvAidwnM2h7UAcgwa2dUBtfYRFtWHb7Kng@mail.gmail.com> <553FCECB.7040005@ahsoftware.de> <CAAObsKBQMY8NfzN3bfiDuy=QOsSV281punJGuEUPfMRRBwoA+g@mail.gmail.com> <5540A883.8060708@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5540A883.8060708@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu@chromium.org>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am 29.04.2015 um 11:46 schrieb Alexander Holler:
> Am 29.04.2015 um 08:58 schrieb Tomeu Vizoso:
>> On 28 April 2015 at 20:17, Alexander Holler <holler@ahsoftware.de> wrote:
>>> Am 28.04.2015 um 14:49 schrieb Tomeu Vizoso:
>>>>
>>>> On 25 April 2015 at 01:15, Alexander Holler <holler@ahsoftware.de>
>>>> wrote:
>>>>>
>>>>> Am 24.04.2015 um 16:47 schrieb Tomeu Vizoso:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> while reading the thread [0] that Alexander Holler started with his
>>>>>> series to make probing order deterministic, it occurred to me that
>>>>>> it should
>>>>>> be possible to achieve the same by probing devices as they are
>>>>>> referenced by
>>>>>> other devices.
>>>>>>
>>>>>> This basically reuses the information that is already embedded in the
>>>>>> probe() implementations, saving us from refactoring existing
>>>>>> drivers or
>>>>>> adding information to DTBs.
>>>>>>
>>>>>> The main issue I see is that the registration code path in some
>>>>>> subsystems may not be reentrant, so some refactoring of the
>>>>>> locking will be
>>>>>> needed. In my testing I have found this problem with regulators,
>>>>>> as the
>>>>>> supply of a regulator might end up being registered during the
>>>>>> registration
>>>>>> of the first one.
>>>>>>
>>>>>> Something I'm not completely happy with is that I have had to move
>>>>>> the
>>>>>> population of the device tree after all platform drivers have been
>>>>>> registered. Otherwise I don't see how I could register drivers on
>>>>>> demand as
>>>>>> we don't have yet each driver's compatible strings.
>>>>>>
>>>>>> I have done my testing on a Tegra124-based Chromebook, and these
>>>>>> patches
>>>>>> were enough to eliminate all the deferred probes.
>>>>>
>>>>>
>>>>> First you have to solve a problem which is totally unrelated to DT or
>>>>> ACPI or x86 or ARM:
>>>>>
>>>>> I think as long as drivers don't register themself whithout any side
>>>>> effect, this problem isn't solvable. In order to make an ordered
>>>>> list of
>>>>> drivers to start, you need to know which drivers are actually
>>>>> available.
>>>>
>>>>
>>>> Yeah, I kind of side-stepped that issue by waiting until all drivers
>>>> have been registered before registering devices. I think someone
>>>> suggested doing so in your thread (maybe Grant?).
>>>
>>>
>>> That doesn't work. As said above, several drivers doing a lot more
>>> than just
>>> registering in their initcall. They might even crash if some
>>> prerequisits
>>> aren't given. And several of these prerequisits (init orders) are
>>> hardcoded
>>> by various means.
>>
>> But aren't those dependencies being taken care currently by the
>> initcall level the driver is placed in? That remains the same in this
>> approach.
>
> In short, no. There are various very ugly things done in several drivers
> to enforce some order.

To explain it a bit more:

The case with the regulator you've described above is just one of these 
ugly things done on some driver initcalls. That's why I've decided to 
introduce a new initcall level which only contains drivers which don't 
have any side effect but just registering themself. Ideally all drivers 
would end up in that level, and thus the special level would not be 
necessary at all. Because this means that several drivers have to 
change, which is a lot of work, an intermediate workaround is to make a 
whitelist. That's easier than a blacklist which would mean you have to 
examine every driver. And that whitelist is exactly what I did by 
introducing those "well done" drivers.

And just in case of, I haven't looked at your patches at all. I've just 
read the introductory mail and the subjects of the patches and then 
concluded what I've written.

That means if you've a special use case in mind, your solution might 
work. But as an overall solution the problem with identifying drivers 
(mapping initcalls to drivers) has to be solved (which I've tried with 
those "well done" driver list).

Regards,

Alexander Holler
