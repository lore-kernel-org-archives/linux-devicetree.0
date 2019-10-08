From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate definitions
Date: Tue, 8 Oct 2019 12:45:17 +0000
Message-ID: <CACPK8XcGAN6AF_GqUpCjFL3CEDeY42n0Zsgt5DX1ssOu+GhbDg@mail.gmail.com>
References: <20191008113553.13662-1-andrew@aj.id.au> <20191008113553.13662-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008113553.13662-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Oct 2019 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index 38074a5f7296..ac567fc84a87 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -84,6 +84,11 @@
>  #define ASPEED_CLK_MAC34               65
>  #define ASPEED_CLK_USBPHY_40M          66
>
> +#define ASPEED_CLK_GATE_MAC1RCLK       67
> +#define ASPEED_CLK_GATE_MAC2RCLK       68
> +#define ASPEED_CLK_GATE_MAC3RCLK       69
> +#define ASPEED_CLK_GATE_MAC4RCLK       70

My comments on the other patch about GATEs should have been on this patch.

> +
>  /* Only list resets here that are not part of a gate */
>  #define ASPEED_RESET_ADC               55
>  #define ASPEED_RESET_JTAG_MASTER2      54
> --
> 2.20.1
>
