From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/3] arm: dts: mt7623: fix card detection issue on
 bananapi-r2
Date: Fri, 1 Dec 2017 12:42:07 +0100
Message-ID: <74d7da4b-bb5a-f3f9-6c9e-9cf2fca69c5d@gmail.com>
References: <cover.1511949769.git.sean.wang@mediatek.com>
 <88269ed11bdf881087f7b0de331a60d8acfdc977.1511949769.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <88269ed11bdf881087f7b0de331a60d8acfdc977.1511949769.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/29/2017 11:10 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fix that bananapi-r2 booting from SD-card would fail since incorrect
> polarity is applied to the previous setup with GPIO_ACTIVE_HIGH.
> 
> Cc: stable@vger.kernel.org # v4.14+
> Fixes: 0eed8d097612 ("arm: dts: mt7623: Add SD-card and EMMC to bananapi-r2")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Tested-by: Matthias Brugger <matthias.bgg@gmail.com>

>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 688a863..7bf5aa2 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -204,7 +204,7 @@
>   	bus-width = <4>;
>   	max-frequency = <50000000>;
>   	cap-sd-highspeed;
> -	cd-gpios = <&pio 261 0>;
> +	cd-gpios = <&pio 261 GPIO_ACTIVE_LOW>;
>   	vmmc-supply = <&mt6323_vmch_reg>;
>   	vqmmc-supply = <&mt6323_vio18_reg>;
>   };
> 
