From: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am654: Add Support for MMC/SD
Date: Sat, 8 Dec 2018 10:56:16 +0530
Message-ID: <a6aacd53-e1c4-fce0-7712-f276c80bbffc@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-2-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207084233.13700-2-faiz_abbas@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Faiz Abbas <faiz_abbas@ti.com>, linux-arm-kernel@lists.infradead.org, nm@ti.com, t-kristo@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, kishon@ti.com, robh+dt@kernel.org, adrian.hunter@intel.com, michal.simek@xilinx.com
List-Id: devicetree@vger.kernel.org



On 07/12/18 2:12 PM, Faiz Abbas wrote:
> There are two MMC host controller instances present on the TI's
> Am654 SOCs. Add device tree nodes for the same.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 916434839603..d07212f16a81 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -129,4 +129,32 @@
>  		clocks = <&k3_clks 113 1>;
>  		power-domains = <&k3_pds 113>;
>  	};
> +
> +	sdhci0: sdhci@4f80000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> +		power-domains = <&k3_pds 47>;
> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +		sdhci-caps-mask = <0x80000007 0x0>;
> +		mmc-ddr-1_8v;
> +		ti,otap-del-sel = <0x2>;
> +		ti,trm-icp = <0x8>;
> +		status = "disabled";
> +	};

Please drop "status=disabled" from dtsi. Can be disabled as required in
the board dts.

> +
> +	sdhci1: sdhci@4fa0000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4fa0000 0x0 0x260>, <0x0 0x4fb0000 0x0 0x134>;
> +		power-domains = <&k3_pds 48>;
> +		clocks = <&k3_clks 48 0>, <&k3_clks 48 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +		sdhci-caps-mask = <0x80000007 0x0>;
> +		mmc-ddr-1_8v;
> +		ti,otap-del-sel = <0x2>;
> +		ti,trm-icp = <0x8>;
> +		status = "disabled";
> +	};
>  };
> 

-- 
Regards
Vignesh
