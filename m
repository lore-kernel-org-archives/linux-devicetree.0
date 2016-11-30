From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/9] clk: stm32f4: Update DT bindings documentation
Date: Wed, 30 Nov 2016 14:47:13 -0600
Message-ID: <20161130204713.bu6ig3z6n6dx47z7@rob-hp-laptop>
References: <1479998749-20358-1-git-send-email-gabriel.fernandez@st.com>
 <1479998749-20358-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479998749-20358-2-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 24, 2016 at 03:45:41PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Creation of dt include file for specific stm32f4 clocks.
> These specific clocks are not derived from system clock (SYSCLOCK)
> We should use index 1 to use these clocks in DT.
> e.g. <&rcc 1 CLK_LSI>
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |  8 ++++++
>  drivers/clk/clk-stm32f4.c                          |  9 +++++--
>  include/dt-bindings/clock/stm32f4-clock.h          | 31 ++++++++++++++++++++++
>  3 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/stm32f4-clock.h

Acked-by: Rob Herring <robh@kernel.org>
