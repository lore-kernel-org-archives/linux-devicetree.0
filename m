From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 6/8] ARM: dts: iwg20m: Add SPI NOR support
Date: Fri, 15 Sep 2017 10:35:17 +0200
Message-ID: <20170915083517.GJ3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-7-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505322341-9480-7-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 06:05:39PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add support for the SPI NOR device used to boot up the system
> to the System on Module DT.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> This patch is based on renesas-devel-20170913-v4.13.
> 
> This patch is dependant on:
> - "of: add vendor prefix for Silicon Storage Technology Inc."
> - "doc: dt: mtd: Add sst25vf016b to the list of supported chip names"
> 
> 
>  arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> index 4119737..75a8ca5 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> @@ -44,6 +44,11 @@
>  		function = "mmc";
>  	};
>  
> +	qspi_pins: qspi {
> +		groups = "qspi_ctrl", "qspi_data2";
> +		function = "qspi";
> +	};
> +
>  	sdhi0_pins: sd0 {
>  		groups = "sdhi0_data4", "sdhi0_ctrl";
>  		function = "sdhi0";
> @@ -61,6 +66,27 @@
>  	status = "okay";
>  };
>  
> +&qspi {
> +	pinctrl-0 = <&qspi_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	/* WARNING - This device contains the bootloader. Handle with care. */
> +	flash: flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "sst,sst25vf016b", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <1>;
> +		spi-rx-bus-width = <1>;
> +		m25p,fast-read;
> +		spi-cpol;
> +		spi-cpha;
> +	};

Does the device have partitions?
If so, should they be described here?

> +};
> +
>  &sdhi0 {
>  	pinctrl-0 = <&sdhi0_pins>;
>  	pinctrl-names = "default";
> -- 
> 1.9.1
> 
