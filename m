From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 5/5] mfd: dt: Add bindings for the Aspeed SoC Display
 Controller (GFX)
Date: Wed, 4 Jan 2017 11:36:45 +0000
Message-ID: <20170104113645.GF27589@dell>
References: <20161220071535.27542-1-andrew@aj.id.au>
 <20161220071535.27542-6-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161220071535.27542-6-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Dec 2016, Andrew Jeffery wrote:

> The Aspeed SoC Display Controller is presented as a syscon device to
> arbitrate access by display and pinmux drivers. Video pinmux
> configuration on fifth generation SoCs depends on bits in both the
> System Control Unit and the Display Controller.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-gfx.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt b/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> new file mode 100644
> index 000000000000..aea5370efd97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
> @@ -0,0 +1,17 @@
> +* Device tree bindings for Aspeed SoC Display Controller (GFX)
> +
> +The Aspeed SoC Display Controller primarily does as its name suggests, but also
> +participates in pinmux requests on the g5 SoCs. It is therefore considered a
> +syscon device.
> +
> +Required properties:
> +- compatible:		"aspeed,ast2500-gfx", "syscon"
> +- reg:			contains offset/length value of the GFX memory
> +			region.
> +
> +Example:
> +
> +gfx: display@1e6e6000 {
> +	compatible = "aspeed,ast2500-gfx", "syscon";
> +	reg = <0x1e6e6000 0x1000>;
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
