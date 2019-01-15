From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am654: Add Support for MMC/SD
Date: Tue, 15 Jan 2019 08:27:11 -0600
Message-ID: <20190115142711.iwsx4p3gfa63dutc@kahuna>
References: <20190110073355.3382-1-faiz_abbas@ti.com>
 <20190110073355.3382-2-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110073355.3382-2-faiz_abbas@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Faiz Abbas <faiz_abbas@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

$subject claims MMC/SD, while the patch is specific for emmc and HS200?

could you fix that up please?

On 13:03-20190110, Faiz Abbas wrote:
> Add support for the Secure Digital Host Controller Interface (SDHCI)
> present on TI's AM654 SOCs. It is compatible with eMMC5.1 Host
> Specifications and SDHC Standard Specification 4.10.
> 
> Enable only upto HS200 speed mode.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 272cf8fc8d30..78e1bb56adee 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -191,4 +191,17 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  	};
> +
> +	sdhci0: sdhci@4f80000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> +		power-domains = <&k3_pds 47>;
> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;
> +		ti,otap-del-sel = <0x2>;
> +		ti,trm-icp = <0x8>;
> +	};
>  };
> -- 
> 2.19.2
> 

-- 
Regards,
Nishanth Menon
