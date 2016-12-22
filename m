From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/9] clk: stm32f4: Update DT bindings documentation
Date: Wed, 21 Dec 2016 16:10:51 -0800
Message-ID: <20161222001051.GP8288@codeaurora.org>
References: <1481638820-29324-1-git-send-email-gabriel.fernandez@st.com>
 <1481638820-29324-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481638820-29324-2-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On 12/13, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Creation of dt include file for specific stm32f4 clocks.
> These specific clocks are not derived from system clock (SYSCLOCK)
> We should use index 1 to use these clocks in DT.
> e.g. <&rcc 1 CLK_LSI>
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-stm32f4 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
