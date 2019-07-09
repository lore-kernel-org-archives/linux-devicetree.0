From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 2/2] dt-bindings: Document the DesignWare IP reset
 bindings
Date: Mon, 8 Jul 2019 19:52:20 -0600
Message-ID: <20190709015220.GA18239@bogus>
References: <1559835388-2578-1-git-send-email-luis.oliveira@synopsys.com>
 <1559835388-2578-3-git-send-email-luis.oliveira@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559835388-2578-3-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: p.zabel@pengutronix.de, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com, Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 05:36:28PM +0200, Luis Oliveira wrote:
> This adds documentation of device tree bindings for the
> DesignWare IP reset controller.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> ---
> Changelog
> - Add active low configuration example
> - Fix compatible string in the active high example
> 
>  .../devicetree/bindings/reset/snps,dw-reset.txt    | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/snps,dw-reset.txt b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
> new file mode 100644
> index 0000000..85f3301
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/snps,dw-reset.txt
> @@ -0,0 +1,30 @@
> +Synopsys DesignWare Reset controller
> +=======================================
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +
> +- compatible: should be one of the following.
> +	"snps,dw-high-reset" - for active high configuration
> +	"snps,dw-low-reset" - for active low configuration

This is really a standalone block?

Are there versions of IP?

> +
> +- reg: physical base address of the controller and length of memory mapped
> +	region.
> +
> +- #reset-cells: must be 1.
> +
> +example:
> +
> +	dw_rst_1: reset-controller@0000 {
> +		  compatible = "snps,dw-high-reset";
> +	 	  reg = <0x0000 0x4>;
> +		  #reset-cells = <1>;
> +	};
> +
> +	dw_rst_2: reset-controller@1000 {i
> +		  compatible = "snps,dw-low-reset";
> +		  reg = <0x1000 0x8>;
> +		  #reset-cells = <1>;
> +	};
> -- 
> 2.7.4
> 
