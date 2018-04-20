From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: condor: add eMMC support
Date: Fri, 20 Apr 2018 12:03:13 +0200
Message-ID: <20180420100313.4cmngxeibpc2r3h2@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <309b5211-bab6-53de-b8a8-6e1049e1705e@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <309b5211-bab6-53de-b8a8-6e1049e1705e@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 14, 2018 at 10:28:29PM +0300, Sergei Shtylyov wrote:
> Define the Condor board dependent part of the MMC0 (connected to eMMC chip)
> device node along with the necessary voltage regulators...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -27,6 +27,24 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0 0x48000000 0 0x78000000>;
>  	};
> +
> +	d3_3v: regulator-0 {

Please use reg_3p3v: regulator1 for consistency with salvator-common.dtsi

> +		compatible = "regulator-fixed";
> +		regulator-name = "D3.3V";

And "fixed-3.3V"

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddq_vin01: regulator-1 {

And reg_1p8v: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDQ_VIN01";

And "fixed-1.8V"

> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>  };
>  
>  &avb {
> @@ -52,6 +70,19 @@
>  	clock-frequency = <32768>;
>  };
>  
> +&mmc0 {
> +	pinctrl-0 = <&mmc_3_3v_pins>;
> +	pinctrl-1 = <&mmc_1_8v_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&d3_3v>;
> +	vqmmc-supply = <&vddq_vin01>;
> +	mmc-hs200-1_8v;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &pciec {
>  	status = "okay";
>  };
> @@ -70,6 +101,18 @@
>  		function = "avb";
>  	};
>  
> +	mmc_1_8v_pins: mmc_1_8v {
> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
> +		function = "mmc";
> +		power-source = <1800>;
> +	};
> +
> +	mmc_3_3v_pins: mmc_3_3v {
> +		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
> +		function = "mmc";
> +		power-source = <3300>;
> +	};

Again please make this more consistent with salvator-common.dtsi.

> +
>  	scif0_pins: scif0 {
>  		groups = "scif0_data";
>  		function = "scif0";
> 
