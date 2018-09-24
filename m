Return-Path: <robherring2@gmail.com>
Message-ID: <5baa1aee.1c69fb81.cc7c6.340b@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Provide bindings for fsl dspi
 working in slave mode
References: <20180918093437.26799-1-lukma@denx.de>
 <20180918093437.26799-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918093437.26799-2-lukma@denx.de>
Date: Mon, 24 Sep 2018 14:25:57 -0700
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 18, 2018 at 11:34:35AM +0200, Lukasz Majewski wrote:
> This commit provides the description of new property: "fsl,spi-slave-mode"
> which enables support for DSPI driver working in slave mode.
> 
> As the new compatible shall be used with SPI bus equipped with master
> device a new "spidev" based node has been introduced to avoid confusion.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> index 18eeafe359d8..b30af19a2bc5 100644
> --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> @@ -26,6 +26,7 @@ Optional SPI properties for slave nodes:
>  - fsl,spi-sck-cs-delay: a delay in nanoseconds between stopping the clock
>    signal and deactivating chip select, at the end of a transfer.
>  - bus-num : the slave chip chipselect signal number.
> +- fsl,spi-slave-mode: if present, controller runs in slave mode.

There's a standard property for this.

>  
>  Example:
>  
> @@ -56,6 +57,13 @@ dspi0@4002c000 {
>  		fsl,spi-cs-sck-delay = <100>;
>  		fsl,spi-sck-cs-delay = <50>;
>  	};
> +
> +	spidev3@1 {
> +		compatible = "fsl,vf610-dspi";
> +		spi-max-frequency = <30000000>;
> +		reg = <1>;
> +		fsl,spi-slave-mode;

This doesn't look right for how slave mode is described.

> +	};
>  };
>  
>  
> -- 
> 2.11.0
> 
