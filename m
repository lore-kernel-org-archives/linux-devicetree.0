From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 09/11] clk: sprd: add clocks support for SC9860
Date: Fri, 10 Nov 2017 15:10:24 -0600
Message-ID: <CAL_Jsq+3wuzCPh1Pkbq79t9zkef-Gvg9AW4pgrKvwOuRJJyn1Q@mail.gmail.com>
References: <20171102065626.21835-1-chunyan.zhang@spreadtrum.com>
 <20171102065626.21835-10-chunyan.zhang@spreadtrum.com> <20171106214335.qvuvcwahemnpwftt@rob-hp-laptop>
 <CAAfSe-tadvpgJ0OC00Ccc+y+84t90dArfAu9ASOG77Hnw9Z=RA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAAfSe-tadvpgJ0OC00Ccc+y+84t90dArfAu9ASOG77Hnw9Z=RA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Orson Zhai <orson.zhai@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 9, 2017 at 2:18 AM, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> Hi Rob and Stephen,
>
> On 7 November 2017 at 05:43, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Nov 02, 2017 at 02:56:24PM +0800, Chunyan Zhang wrote:
>>> This patch added the list of clocks for Spreadtrum's SC9860 SoC,
>>> together with clock initialization code.
>>>
>>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>>> ---
>>>  drivers/clk/sprd/Kconfig                    |   10 +
>>>  drivers/clk/sprd/Makefile                   |    3 +
>>>  drivers/clk/sprd/sc9860-clk.c               | 1987 +++++++++++++++++++++++++++
>>>  include/dt-bindings/clock/sprd,sc9860-clk.h |  408 ++++++
>>
>> This belongs in the binding doc patch.
>
> I noticed that this kind of files were submitted in driver patch
> before when adding a new driver, how about I just put it into a single
> patch in the next version?

It's been done all ways, but the correct way is as I told you. Binding
doc and header in one, driver in another patch.

Rob
