From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 7/7] arm64: dts: mt7622: add EINT support to pinctrl
Date: Mon, 25 Jun 2018 17:02:28 +0200
Message-ID: <e6747e99-78b6-ed8c-d6fa-cab2f7398fcf@gmail.com>
References: <cover.1526835466.git.sean.wang@mediatek.com>
 <f896f79ebfa9a262c89fdeed89cf086220ca051d.1526835466.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f896f79ebfa9a262c89fdeed89cf086220ca051d.1526835466.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 20/05/18 19:01, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add EINT support to pinctrl and set those GPIO keys as interrupt-driven
> keys.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Merged,

Thanks!

>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 2 +-
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 8 +++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index b783764..1ff003e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -34,7 +34,7 @@
>  	};
>  
>  	gpio-keys {
> -		compatible = "gpio-keys-polled";
> +		compatible = "gpio-keys";
>  		poll-interval = <100>;
>  
>  		factory {
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 9213c96..e2c5450 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -286,9 +286,15 @@
>  
>  	pio: pinctrl@10211000 {
>  		compatible = "mediatek,mt7622-pinctrl";
> -		reg = <0 0x10211000 0 0x1000>;
> +		reg = <0 0x10211000 0 0x1000>,
> +		      <0 0x10005000 0 0x1000>;
> +		reg-names = "base", "eint";
>  		gpio-controller;
>  		#gpio-cells = <2>;
> +		interrupt-controller;
> +		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +		#interrupt-cells = <2>;
>  	};
>  
>  	watchdog: watchdog@10212000 {
> 
