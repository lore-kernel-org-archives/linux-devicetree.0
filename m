From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: aspeed-scu: Add clock and reset
 properties
Date: Mon, 4 Sep 2017 14:52:47 +0100
Message-ID: <20170904135247.cekcungzxig2r7tf@dell>
References: <20170823060957.31167-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170823060957.31167-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

On Wed, 23 Aug 2017, Joel Stanley wrote:

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-scu.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied for v4.15.

> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> index 4fc5b83726d6..ce8cf0ec6279 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
> @@ -9,10 +9,16 @@ Required properties:
>  		"aspeed,g5-scu", "syscon", "simple-mfd"
>  
>  - reg:		contains the offset and length of the SCU memory region
> +- #clock-cells: should be set to <1> - the system controller is also a
> +	clock provider
> +- #reset-cells: should be set to <1> - the system controller is also a
> +	reset line provider
>  
>  Example:
>  
>  syscon: syscon@1e6e2000 {
>  	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
>  	reg = <0x1e6e2000 0x1a8>;
> +	#clock-cells = <1>;
> +	#reset-cells = <1>;
>  };

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
