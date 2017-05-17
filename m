From: Kever Yang <ellisys@163.com>
Subject: Re: [PATCH 2/3] arm: dts: rk322x: correct uart2 pinctrl and add
 another sets
Date: Wed, 17 May 2017 14:31:44 +0800
Message-ID: <3974d438-89ca-04e2-03cd-6d3946dd461e@163.com>
References: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com>
 <1494992451-32542-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1494992451-32542-3-git-send-email-frank.wang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Wang <frank.wang@rock-chips.com>, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, charles.chen@rock-chips.com, wmc@rock-chips.com, kevan.lan@rock-chips.com, linux-kernel@vger.kernel.org, sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org, cody.xie@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Frank,


On 05/17/2017 11:40 AM, Frank Wang wrote:
> Correct UART2 PINCTRL flag and add another PINCTRL sets for UART2
> in case of confict with SDMMC.
>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
>   arch/arm/boot/dts/rk322x.dtsi | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
> index cc6a27d..ea1239a 100644
> --- a/arch/arm/boot/dts/rk322x.dtsi
> +++ b/arch/arm/boot/dts/rk322x.dtsi
> @@ -222,7 +222,7 @@
>   		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
>   		clock-names = "baudclk", "apb_pclk";
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&uart2_xfer>;
> +		pinctrl-0 = <&uart21_xfer>;

There are more than one group of UART in rk322x, maybe we need to move
or add this setting in the dts file to override dtsi setting?

Thanks,
- Kever
>   		reg-shift = <2>;
>   		reg-io-width = <4>;
>   		status = "disabled";
> @@ -693,7 +693,7 @@
>   
>   		uart2 {
>   			uart2_xfer: uart2-xfer {
> -				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_none>,
> +				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up>,
>   						<1 19 RK_FUNC_2 &pcfg_pull_none>;
>   			};
>   
> @@ -705,5 +705,12 @@
>   				rockchip,pins = <0 24 RK_FUNC_1 &pcfg_pull_none>;
>   			};
>   		};
> +
> +		uart2-1 {
> +			uart21_xfer: uart21-xfer {
> +				rockchip,pins = <1 10 RK_FUNC_2 &pcfg_pull_up>,
> +						<1 9 RK_FUNC_2 &pcfg_pull_none>;
> +			};
> +		};
>   	};
>   };
