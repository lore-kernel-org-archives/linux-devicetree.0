From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] clk: stm32f469: Add QSPI clock
Date: Tue, 18 Oct 2016 09:17:16 -0500
Message-ID: <20161018141716.cdxywazk6kfg7z64@rob-hp-laptop>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <1476436699-21879-6-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476436699-21879-6-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2016 at 11:18:18AM +0200, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch adds the QSPI clock for stm32f469 discovery board.
> The gate mapping is a little bit different from stm32f429 soc.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |   4 +-
>  drivers/clk/clk-stm32f4.c                          | 173 ++++++++++++++++++---
>  2 files changed, 158 insertions(+), 19 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

