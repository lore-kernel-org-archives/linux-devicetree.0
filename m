From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [RFC 00/12] On-demand device registration
Date: Tue, 28 Apr 2015 14:49:50 +0200
Message-ID: <CAAObsKAa_yEwcWQTJvAidwnM2h7UAcgwa2dUBtfYRFtWHb7Kng@mail.gmail.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com> <553ACE96.2040804@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553ACE96.2040804@ahsoftware.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Holler <holler@ahsoftware.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 25 April 2015 at 01:15, Alexander Holler <holler@ahsoftware.de> wrote:
> Am 24.04.2015 um 16:47 schrieb Tomeu Vizoso:
>> Hi,
>>
>> while reading the thread [0] that Alexander Holler started with his series to make probing order deterministic, it occurred to me that it should be possible to achieve the same by probing devices as they are referenced by other devices.
>>
>> This basically reuses the information that is already embedded in the probe() implementations, saving us from refactoring existing drivers or adding information to DTBs.
>>
>> The main issue I see is that the registration code path in some subsystems may not be reentrant, so some refactoring of the locking will be needed. In my testing I have found this problem with regulators, as the supply of a regulator might end up being registered during the registration of the first one.
>>
>> Something I'm not completely happy with is that I have had to move the population of the device tree after all platform drivers have been registered. Otherwise I don't see how I could register drivers on demand as we don't have yet each driver's compatible strings.
>>
>> I have done my testing on a Tegra124-based Chromebook, and these patches were enough to eliminate all the deferred probes.
>
> First you have to solve a problem which is totally unrelated to DT or
> ACPI or x86 or ARM:
>
> I think as long as drivers don't register themself whithout any side
> effect, this problem isn't solvable. In order to make an ordered list of
> drivers to start, you need to know which drivers are actually available.

Yeah, I kind of side-stepped that issue by waiting until all drivers
have been registered before registering devices. I think someone
suggested doing so in your thread (maybe Grant?).

There's lots of things that can be improved regarding driver and
device initialization, but we have to start somewhere :)

Thanks,

Tomeu

> And also drivers are registering themself with their initcall, they
> might do an awfull lot of stuff besides just registering themself. That
> means several drivers already have prerequisites and dependcies for
> their initcall. That means you can't just call their initcall to get and
> idea of which driver an initcall is even part of.
>
> That ends up with the fact that you just don't have a list of drivers
> you can sort, based on whatever algorithm you might have in mind.
>
> I've tried to solve that problem with marking drivers which don't have
> any prerequisits (and side effects) as "well done".
>
> The patch which did that was 5/9 in my series, this one:
>
> https://lkml.org/lkml/2014/5/12/414
>
> Unfortunately nobody seemed really interested and without one of the few
> "big guys" in your pocket, it's absolutely impossible to get such
> changes into the kernel.
>
> Not to speak about all the unavoidable discussions about absolutely
> silly things.
>
> But maybe I'm the problem here. No idea. I wish you more luck than I had
> in the past two or three years.
>
> Regards,
>
> Alexander Holler
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
