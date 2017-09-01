From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RESEND PATCH v8 1/3] clk: nxp: clk-lpc32xx: rename
 clk_gate_is_enabled()
Date: Thu, 31 Aug 2017 18:36:39 -0700
Message-ID: <20170901013639.GP21656@codeaurora.org>
References: <1503316742-22145-1-git-send-email-gabriel.fernandez@st.com>
 <1503316742-22145-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503316742-22145-2-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com, Arvind Yadav <arvind.yadav.cs@gmail.com>
List-Id: devicetree@vger.kernel.org

On 08/21, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> We need to export clk_gate_is_enabled() from clk framework, then
> to avoid compilation issue we have to rename clk_gate_is_enabled()
> in NXP LPC32xx clock driver.
> We changed all gate op with 'lpc32xx_' prefix:
> lpc32xx_clk_gate_enable(),
> lpc32xx_clk_gate_disable(),
> lpc32xx_clk_gate_is_enabled().
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
