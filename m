From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/6] STM32F4 Add RTC & QSPI clocks
Date: Thu, 3 Nov 2016 09:52:38 +0100
Message-ID: <68855ca8-a74f-7c76-342f-de0aeec51ca1@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

On 10/14/2016 11:18 AM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> v2:
>  - rename compatible property "st,stm32f46xx-rcc" into "st,stm32f469-rcc"
>  - cosmetic: remove bad copy/paste
>
> This patch-set introduce RTC and QSPI clocks for STM32F4 socs
> RTC clock has 3 parents clock oscillators (lsi/lse/hse_rtc)
>
> example to use rtc clock:
>
> 		rtc: rtc@40002800 {
> 			compatible = "st,stm32-rtc";
> 			reg = <0x40002800 0x400>;
> 			...
> 			clocks = <&rcc 1 CLK_RTC>;
>
> 			assigned-clocks =  <&rcc 1 CLK_RTC>;
> 			assigned-clock-parents = <&rcc 1 CLK_LSE>;
> 			...
> 		};
>
> Gabriel Fernandez (6):
>   clk: stm32f4: Add LSI & LSE clocks
>   ARM: dts: stm32f429: add LSI and LSE clocks
>   arm: stmf32: Enable SYSCON
>   clk: stm32f4: Add RTC clock
>   clk: stm32f469: Add QSPI clock
>   ARM: dts: stm32f429: Add QSPI clock

You sent a V3 without DT patches. Should I take DT patches from this V2 
patchset ?

Regards
Alex


>
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |   4 +-
>  arch/arm/boot/dts/stm32f429.dtsi                   |  18 +
>  arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
>  arch/arm/configs/stm32_defconfig                   |   1 +
>  drivers/clk/clk-stm32f4.c                          | 442 ++++++++++++++++++++-
>  5 files changed, 447 insertions(+), 22 deletions(-)
>
