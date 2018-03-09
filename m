From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 02/12] clk: stm32mp1: Introduce STM32MP1 clock driver
Date: Fri, 9 Mar 2018 17:57:12 -0600
Message-ID: <20180309235543.cjyywayv3m6fwtbc@rob-hp-laptop>
References: <1520528045-18330-1-git-send-email-gabriel.fernandez@st.com>
 <1520528045-18330-3-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520528045-18330-3-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: sboyd@kernel.org, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez.st@gmail.com, olivier.bideau@st.com, Loic PALLARDY <loic.pallardy@st.com>, benjamin GAIGNARD <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2018 at 05:53:55PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch introduces the mechanism to probe stm32mp1 driver.
> It also defines registers definition.
> This patch also introduces the generic mechanism to register
> a clock (a simple gate, divider and fixed factor).
> 
> All clocks will be defined in one table.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  drivers/clk/Kconfig                       |   6 +
>  drivers/clk/Makefile                      |   1 +
>  drivers/clk/clk-stm32mp1.c                | 364 ++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/stm32mp1-clks.h | 254 +++++++++++++++++++++

This should really be part of the binding patch.

>  4 files changed, 625 insertions(+)
>  create mode 100644 drivers/clk/clk-stm32mp1.c
>  create mode 100644 include/dt-bindings/clock/stm32mp1-clks.h
