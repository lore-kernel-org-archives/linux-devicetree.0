From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ARC: HSDK: DTS: Temporary fix of sdio ciu frequency
Date: Fri, 8 Sep 2017 11:56:37 -0700
Message-ID: <3bed30b7-6efe-e3d4-a65a-b6816e87c45e@synopsys.com>
References: <20170908184233.1779-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170908184233.1779-1-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/08/2017 11:42 AM, Eugeniy Paltsev wrote:
> DW sdio controller has external ciu clock devider controlled via
> register in SDIO IP. Due to its unexpected default value
> (it should devide by 1 but it devides by 8)
> SDIO IP uses wrong ciu clock and works unstable (see STAR 9001204800)
>
> So add temporary fix and change clock frequency from 100000000
> to 12500000 Hz until we fix dw sdio driver itself.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

Added.

Consider it bike shedding, but for next time, please bracket the platform patches as

ARC: [plat-xxx] abra ka dabra ....

-Vineet

> ---
>   arch/arc/boot/dts/hsdk.dts | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> index 8412669..b922f3f 100644
> --- a/arch/arc/boot/dts/hsdk.dts
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -127,7 +127,17 @@
>   
>   		mmcclk_ciu: mmcclk-ciu {
>   			compatible = "fixed-clock";
> -			clock-frequency = <100000000>;
> +			/*
> +			 * DW sdio controller has external ciu clock divider
> +			 * controlled via register in SDIO IP. Due to its
> +			 * unexpected default value (it should devide by 1
> +			 * but it devides by 8) SDIO IP uses wrong clock and
> +			 * works unstable (see STAR 9001204800)
> +			 * So add temporary fix and change clock frequency
> +			 * from 100000000 to 12500000 Hz until we fix dw sdio
> +			 * driver itself.
> +			 */
> +			clock-frequency = <12500000>;
>   			#clock-cells = <0>;
>   		};
>   
