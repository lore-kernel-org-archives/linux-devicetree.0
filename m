From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 3/3] ARM: bcm2835: Add the auxiliary clocks to the
 device tree.
Date: Wed, 16 Dec 2015 11:35:32 +0100
Message-ID: <56713E74.3040907@i2se.com>
References: <1450222559-22461-1-git-send-email-eric@anholt.net>
 <1450222559-22461-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1450222559-22461-3-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

Am 16.12.2015 um 00:35 schrieb Eric Anholt:
> These will be used for enabling UART1, SPI1, and SPI2.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>
> v2: Make the binding cover both the IRQ and clock enable registers.
>
>  arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index aef64de..a27d40b 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -73,6 +73,13 @@
>  			clocks = <&clk_osc>;
>  		};
>  
> +		aux: aux@0x7e215000 {
> +			compatible = "brcm,bcm2835-aux";
> +			#clock-cells = <1>;
> +			reg = <0x7e215000 0x8>;
> +			clocks = <&clocks BCM2835_CLOCK_VPU>;
> +		};
> +

just a nit. Since the nodes should be ordered by address this should
better go between|||i2c0 and sdhci.

Thanks

Stefan

|
>  		rng@7e104000 {
>  			compatible = "brcm,bcm2835-rng";
>  			reg = <0x7e104000 0x10>;

