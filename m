From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey960: Remove deprecated MMC properties
Date: Wed, 18 Jul 2018 16:34:48 +0100
Message-ID: <5B4F5E18.60703@hisilicon.com>
References: <20180618180825.21497-1-ryan@edited.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618180825.21497-1-ryan@edited.us>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryan Grachek <ryan@edited.us>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, john.stultz@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Ryan,

On 2018/6/18 19:08, Ryan Grachek wrote:
> Signed-off-by: Ryan Grachek <ryan@edited.us>

Thanks!
Applied to the hisilicon dt tree.

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 1 -
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 8 --------
>  2 files changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index c706f70ce9f2..abc991619c75 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -611,7 +611,6 @@
>  	broken-cd;
>  	/* WL_EN */
>  	vmmc-supply = <&wlan_en>;
> -	ti,non-removable;
>  	non-removable;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 484b837757f3..74c0509f99e9 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1121,7 +1121,6 @@
>  			bus-width = <0x4>;
>  			disable-wp;
>  			cap-sd-highspeed;
> -			supports-highspeed;
>  			card-detect-delay = <200>;
>  			reg = <0x0 0xff37f000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1142,12 +1141,6 @@
>  			sd-uhs-sdr50;
>  			sd-uhs-sdr104;
>  			status = "disabled";
> -
> -			slot@0 {
> -				reg = <0x0>;
> -				bus-width = <4>;
> -				disable-wp;
> -			};
>  		};
>  
>  		/* SDIO */
> @@ -1162,7 +1155,6 @@
>  			reset-names = "reset";
>  			card-detect-delay = <200>;
>  			cap-sd-highspeed;
> -			supports-highspeed;
>  			keep-power-in-suspend;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&sdio_pmx_func
> 
