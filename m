From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [RESEND PATCH 2/2 v6] arc: axs10x: Add DT bindings for I2S PLL
 Clock
Date: Mon, 9 May 2016 10:12:18 +0100
Message-ID: <57305472.2000507@synopsys.com>
References: <cover.1461258787.git.joabreu@synopsys.com>
 <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e98c3f738b3a8f6755793959d89b4e43c9410fb1.1461258787.git.joabreu@synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-clk@vger.kernel.org, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vineet,


On 02-05-2016 10:39, Jose Abreu wrote:
> Add device tree bindings for AXS10X I2S PLL Clock driver.
>
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
> Acked-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>
> Changes v5 -> v6:
> * Added 'clocks' field
>
> This patch was only introduced in v5.
>
> Cc: Carlos Palminha <palminha@synopsys.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
>
>  arch/arc/boot/dts/axs10x_mb.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
> index ab5d570..5c6489e 100644
> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
> @@ -16,7 +16,20 @@
>  		ranges = <0x00000000 0xe0000000 0x10000000>;
>  		interrupt-parent = <&mb_intc>;
>  
> +		i2sclk: i2sclk@100a0 {
> +			compatible = "snps,axs10x-i2s-pll-clock";
> +			reg = <0x100a0 0x10>;
> +			clocks = <&i2spll_clk>;
> +			#clock-cells = <0>;
> +		};
> +
>  		clocks {
> +			i2spll_clk: i2spll_clk {
> +				compatible = "fixed-clock";
> +				clock-frequency = <27000000>;
> +				#clock-cells = <0>;
> +			};
> +
>  			i2cclk: i2cclk {
>  				compatible = "fixed-clock";
>  				clock-frequency = <50000000>;

Can you apply this to arc-next? Main driver was already merged into clk-next. We
still have to check how to deal with the parent clock frequency that will change
in the next firmware release.

Best regards,
Jose Miguel Abreu

