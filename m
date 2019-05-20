From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: nxp: frwy-ls1046a: add support for
 micron nor flash
Date: Mon, 20 May 2019 10:55:03 +0800
Message-ID: <20190520025502.GK15856@dragon>
References: <20190510130207.14330-1-pramod.kumar_1@nxp.com>
 <20190510130207.14330-4-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190510130207.14330-4-pramod.kumar_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ashish Kumar <ashish.kumar@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 01:00:24PM +0000, Pramod Kumar wrote:
> add micron nor flash support for ls1046a frwy board.
> 
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>

Prefix 'arm64: dts: frwy-ls1046a: ...' would be good enough.

> ---
>  .../boot/dts/freescale/fsl-ls1046a-frwy.dts     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> index de0d19c02944..890f07122dd0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> @@ -113,6 +113,23 @@
>  
>  };
>  
> +

Unnecessary newline.

Shawn

> +&qspi {
> +	num-cs = <1>;
> +	bus-num = <0>;
> +	status = "okay";
> +
> +	qflash0: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <50000000>;
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +	};
> +};
> +
>  #include "fsl-ls1046-post.dtsi"
>  
>  &fman0 {
> -- 
> 2.17.1
> 
