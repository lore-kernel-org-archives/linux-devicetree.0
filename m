From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: condor: add I2C0 support
Date: Tue, 29 May 2018 14:10:12 +0100
Message-ID: <20180529131012.ohyqwmiaxiiw6noi@verge.net.au>
References: <e9c94553-be9d-0eec-a1ee-1713bb97fbab@cogentembedded.com>
 <61f6f4a4-e55c-06e0-cba1-7d90a556950a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <61f6f4a4-e55c-06e0-cba1-7d90a556950a@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 28, 2018 at 11:14:07PM +0300, Sergei Shtylyov wrote:
> Define the Condor board dependent part of the I2C0 device node.
> 
> The I2C0 bus is populated by 2 ON Semiconductor PCA9654 I/O expanders
> and Analog Devices  ADV7511W HDMI transmitter (but we're only describing
> the former chips now).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -80,6 +80,28 @@
>  	clock-frequency = <32768>;
>  };
>  
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	io_expander0: gpio@20 {

Hi Sergei,

I'm a little confused about where 0x20 and 0x21 are derived from.
Could you explain a little?

> +		compatible = "onnn,pca9654";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	io_expander1: gpio@21 {
> +		compatible = "onnn,pca9654";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
>  &mmc0 {
>  	pinctrl-0 = <&mmc_pins>;
>  	pinctrl-1 = <&mmc_pins_uhs>;
> @@ -104,6 +126,11 @@
>  		function = "canfd0";
>  	};
>  
> +	i2c0_pins: i2c0 {
> +		groups = "i2c0";
> +		function = "i2c0";
> +	};
> +
>  	mmc_pins: mmc {
>  		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
>  		function = "mmc";
> 
