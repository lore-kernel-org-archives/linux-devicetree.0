From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v2 0/6] STM32F4 Add RTC & QSPI clocks
Date: Thu, 20 Oct 2016 09:52:54 +0200
Message-ID: <36f11be6-0706-6fdb-681c-5d11d5989e28@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <20161018235108.GP8871@codeaurora.org>
 <d878b846-556d-180b-8ebf-2d06646efb58@st.com>
 <20161019202904.GB8871@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161019202904.GB8871@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi Stephen,


On 10/19/2016 10:29 PM, Stephen Boyd wrote:
> On 10/19, Gabriel Fernandez wrote:
>> Hi Stephen,
>>
>>
>> On 10/19/2016 01:51 AM, Stephen Boyd wrote:
>>> On 10/14, gabriel.fernandez@st.com wrote:
>>>> Gabriel Fernandez (6):
>>>>    clk: stm32f4: Add LSI & LSE clocks
>>>>    ARM: dts: stm32f429: add LSI and LSE clocks
>>>>    arm: stmf32: Enable SYSCON
>>>>    clk: stm32f4: Add RTC clock
>>>>    clk: stm32f469: Add QSPI clock
>>>>    ARM: dts: stm32f429: Add QSPI clock
>>> Can the clk patches be picked without causing problems for
>>> existing dt changes? Do you want an ack from clk maintainers
>>> instead of us picking the clk patches up? The series has
>>> intermingled clk and dts changes so I'm confused.
>>>
>> Thanks for reviewing.
>>
>> Normally DT patches will be taken by STM32 maintainer, but yes there
>> is a dependency between patch 1 & 2, so if you push the patch 1 into
>> clk-next tree you have to take also patch 2.
> Let's break the dependency by making the required property
> optional or key off a different compatible string. As it stands
> right now applying patch 1 will cause things to break until the
> second patch lands which is not great.
>
>> You have to be synchronized with Alexandre Torgue.
>>
>>
> I'd prefer zero synchronization. Please just send the clk patches
> the next time and leave the stuff for arm-soc out of the patch
> series. Thanks.
Ok

Many Thanks.
