Return-Path: <SRS0=2S1i=P6=samsung.com=s.nawrocki@kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <6c0b770d-817e-6e71-ce10-d276c64054cc@samsung.com>
Date: Tue, 22 Jan 2019 10:41:18 +0100
In-reply-to: <0a803aee-b8f2-0d9b-dc63-f6cee9d4d42f@samsung.com>
Content-language: en-GB
Content-transfer-encoding: 8bit
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
	<20190118131639.17578-1-k.konieczny@partner.samsung.com>
	<20190118131639.17578-5-k.konieczny@partner.samsung.com>
	<CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
	<20190121145132.GA19195@bogus>
	<0a803aee-b8f2-0d9b-dc63-f6cee9d4d42f@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 1/22/19 01:27, Chanwoo Choi wrote:
> On 19. 1. 21. 오후 11:51, Rob Herring wrote:
>> On Sat, Jan 19, 2019 at 09:40:10PM +0900, Chanwoo Choi wrote:

>>> This version only adds following two clocks without that other clocks
>>> be included in imem block.
>>> - CLK_ACLK_SLIMSSS
>>> - CLK_PCLK_SLIMSSS
>>>
>>> Usually, the users only refer to
>>> 'include/dt-bindings/clock/exynos5433.h' in order to get the supported
>>> clocks. It means that if there are different between the clock list in
>>> 'include/dt-bindings/clock/exynos5433.h' and the supported clock list
>>> of drivers/clock/', it make the confusion for users. So,
>>> 'include/dt-bindings/clock/exynos5433.h' have to define the only
>>> supported clock ids.
>>>
>>> Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.
>>
>> And add clocks 1-by-1 instead? The binding headers are a pain to merge 
>> because they are a dts and driver dependency. Having a complete header 
>> is preferred unless there is doubt in the correctness of it.

Exactly, this is also what we agreed with Stephen, to make a complete header
with all IDs. I believe the list of clocks is correct, this clock unit is
pretty straightforward, it's just a collection of gate clocks.
But chances are that the other clocks will never get added, as those seem
to be normally handled outside of Linux kernel. It still might not be a good
argument against having complete header describing the hardware completely,
independently of an OS, the bootloader might use those IDs, etc.
In practise it will be adding likely never used code though.

> As you commented, I knew the dependency between dt-binding head file and
> drivers/dts. But, IMO, I'm not sure that it is right to define
> the unsupported ID in dt-bindings header file because we don't know
> the correctness without any real test. The author explained why dropped
> the clocks except for two clocks on cover-letter. It means that the clocks
> except for two clocks might be never added to clock driver because He was
> unable to test them..

I agree, I doubt the remaining clocks will ever get added in case of this SoC. 

>> The driver can warn users about unsupported IDs
-- 
Regards,
Sylwester
