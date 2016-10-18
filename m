From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 0/6] STM32F4 Add RTC & QSPI clocks
Date: Tue, 18 Oct 2016 16:51:08 -0700
Message-ID: <20161018235108.GP8871@codeaurora.org>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On 10/14, gabriel.fernandez@st.com wrote:
> 
> Gabriel Fernandez (6):
>   clk: stm32f4: Add LSI & LSE clocks
>   ARM: dts: stm32f429: add LSI and LSE clocks
>   arm: stmf32: Enable SYSCON
>   clk: stm32f4: Add RTC clock
>   clk: stm32f469: Add QSPI clock
>   ARM: dts: stm32f429: Add QSPI clock

Can the clk patches be picked without causing problems for
existing dt changes? Do you want an ack from clk maintainers
instead of us picking the clk patches up? The series has
intermingled clk and dts changes so I'm confused.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
