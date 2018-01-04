From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V7 11/12] arm64: dts: add syscon for whale2 platform
Date: Thu, 4 Jan 2018 17:51:05 +0100
Message-ID: <CAK8P3a0SFscEGsMGGKe=BNJZjT=B3Swz9kt=znHEiqqR837+TQ@mail.gmail.com>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
 <20171207125715.16160-12-chunyan.zhang@spreadtrum.com> <20171221230316.GY7997@codeaurora.org>
 <CAAfSe-tc6s6F-1AYEamZubJ7VfMXm-rp18c8pctE51izeHXsnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAAfSe-tc6s6F-1AYEamZubJ7VfMXm-rp18c8pctE51izeHXsnA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "arm@kernel.org" <arm@kernel.org>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk <linux-clk@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 22, 2017 at 6:30 AM, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> On 22 December 2017 at 07:03, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 12/07, Chunyan Zhang wrote:
>>> Some clocks on SC9860 are in the same address area with syscon
>>> devices, the proper syscon node will be quoted under the
>>> definitions of those clocks in DT.
>>>
>>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>>> ---
>>
>> These last two can go via arm-soc?
>
> Thanks Stephen!
>
> Hi Arnd, Olof
>
> Could you please take the patch 11, 12 through arm-soc?

Applied both to next/dt now, thanks!

      Arnd
