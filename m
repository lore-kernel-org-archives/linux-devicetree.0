From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 2/9] clk: stm32f4: Add PLL_I2S & PLL_SAI for
 STM32F429/469 boards
Date: Wed, 21 Dec 2016 16:10:57 -0800
Message-ID: <20161222001057.GQ8288@codeaurora.org>
References: <1481638820-29324-1-git-send-email-gabriel.fernandez@st.com>
 <1481638820-29324-3-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481638820-29324-3-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On 12/13, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch introduces PLL_I2S and PLL_SAI.
> Vco clock of these PLLs can be modify by DT (only n multiplicator,
> m divider is still fixed by the boot-loader).
> Each PLL has 3 dividers. PLL should be off when we modify the rate.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-stm32f4 and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
