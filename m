From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] clk: stm32f469: Add QSPI clock
Date: Sat, 8 Oct 2016 15:50:03 -0500
Message-ID: <20161008205003.GB17455@rob-hp-laptop>
References: <1475245509-6487-1-git-send-email-gabriel.fernandez@st.com>
 <1475245509-6487-6-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475245509-6487-6-git-send-email-gabriel.fernandez@st.com>
Sender: linux-clk-owner@vger.kernel.org
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 04:25:08PM +0200, gabriel.fernandez@st.com wrote:
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
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> index fee3205..eace3de 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> @@ -8,7 +8,9 @@ Please also refer to clock-bindings.txt in this directory for common clock
>  controller binding usage.
>  
>  Required properties:
> -- compatible: Should be "st,stm32f42xx-rcc"
> +- compatible: Should be:
> +  "st,stm32f42xx-rcc"
> +  "st,stm32f46xx-rcc"

Generally, we don't use wildcards in compatible strings. I know there's 
lots of part numbers of stm32 parts which I guess are often same die 
with different fusing or package. Your compatible strings should be at 
least specific enough to identify parts that are really different die. 

>  - reg: should be register base and length as documented in the
>    datasheet
>  - #clock-cells: 2, device nodes should specify the clock in their "clocks"
