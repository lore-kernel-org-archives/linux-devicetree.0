From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add AST2500 RMII RCLK definitions
Date: Tue, 8 Oct 2019 12:37:00 +0000
Message-ID: <CACPK8Xf-f-r4S02GoxYdBYOJi5NGYMCOr6XGVza4vEGAsqzR9w@mail.gmail.com>
References: <20191008113523.13601-1-andrew@aj.id.au> <20191008113523.13601-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008113523.13601-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Oct 2019 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2500 has an explicit gate for the RMII RCLK for each of the two
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index f43738607d77..64e245fb113f 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -39,6 +39,8 @@
>  #define ASPEED_CLK_BCLK                        33
>  #define ASPEED_CLK_MPLL                        34
>  #define ASPEED_CLK_24M                 35
> +#define ASPEED_CLK_GATE_MAC1RCLK       36
> +#define ASPEED_CLK_GATE_MAC2RCLK       37

Calling these ASPEED_CLK_GATE breaks the pattern the rest of the
driver has in using that name for the clocks that are registered as
struct aspeed_clk_gate clocks.

Do you think we should drop the GATE_ to match the existing clocks?


>
>  #define ASPEED_RESET_XDMA              0
>  #define ASPEED_RESET_MCTP              1
> --
> 2.20.1
>
