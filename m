From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 7/7] ARM: DTS: Amlogic: Add SMP related nodes for
 Meson8b
Date: Fri, 4 Dec 2015 08:53:44 -0600
Message-ID: <20151204145344.GB18876@rob-hp-laptop>
References: <1449076953-5058-1-git-send-email-carlo@caione.org>
 <1449076953-5058-8-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449076953-5058-8-git-send-email-carlo@caione.org>
Sender: linux-clk-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-meson@googlegroups.com, drake@endlessm.com, jerry.cao@amlogic.com, victor.wan@amlogic.com, pawel.moll@arm.com, arnd@arndb.de, Carlo Caione <carlo@endlessm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 02, 2015 at 06:22:33PM +0100, Carlo Caione wrote:
> From: Carlo Caione <carlo@endlessm.com>
> 
> Add nodes for: SCU, PMU and SRAM. Set also the enable-method for SMP
> bringup.
> 
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 51b32ed..27e1b2f 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -51,9 +51,20 @@
>  / {
>  	interrupt-parent = <&gic>;
>  
> +	scu@c4300000 {
> +		compatible = "arm,cortex-a5-scu";
> +		reg = <0xc4300000 0x100>;
> +	};
> +
> +	pmu@c81000e4 {
> +		compatible = "amlogic,meson8b-pmu", "syscon";
> +		reg = <0xc81000e0 0x18>;
> +	};

These should be under a bus node.

> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		enable-method = "amlogic,meson8b-smp";

This property is supposed to be per cpu.

Rob
