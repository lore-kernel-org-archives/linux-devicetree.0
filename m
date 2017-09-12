From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Handle pcie wake in pcie
 driver for Gru
Date: Tue, 12 Sep 2017 08:40:36 +0800
Message-ID: <fb363e50-6a88-c546-2ae9-4abb28a931f0@rock-chips.com>
References: <20170911151029.25185-1-jeffy.chen@rock-chips.com>
 <20170911151029.25185-4-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170911151029.25185-4-jeffy.chen@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, shawn.lin@rock-chips.com, briannorris@chromium.org, Will Deacon <will.deacon@arm.com>, dianders@chromium.org, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 2017/9/11 23:10, Jeffy Chen wrote:
> Currently we are handling pcie wake irq in mrvl wifi driver.
> Move it to rockchip pcie driver for Gru boards.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Changes in v5:
> Use "wakeup" instead of "wake"
> 
> Changes in v3: None
> Changes in v2: None
> 
>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 199a5118b20d..9e0269a13ced 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -707,7 +707,15 @@ ap_i2c_audio: &i2c8 {
>   
>   	ep-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie_clkreqn_cpm>, <&wifi_perst_l>;
> +	pinctrl-0 = <&pcie_clkreqn_cpm>, <&wlan_host_wake_l>, <&wifi_perst_l>;
> +
> +	interrupts-extended = <&gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gic GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&gpio0 8 IRQ_TYPE_LEVEL_LOW>;
> +	interrupt-names = "sys", "legacy", "client", "wakeup";
> +	/delete-property/ interrupts;
> +
>   	vpcie3v3-supply = <&pp3300_wifi_bt>;
>   	vpcie1v8-supply = <&wlan_pd_n>; /* HACK: see &wlan_pd_n */
>   	vpcie0v9-supply = <&pp900_pcie>;
> @@ -722,11 +730,6 @@ ap_i2c_audio: &i2c8 {
>   			compatible = "pci1b4b,2b42";
>   			reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
>   			       0x83010000 0x0 0x00100000 0x0 0x00100000>;
> -			interrupt-parent = <&gpio0>;
> -			interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wlan_host_wake_l>;
> -			wakeup-source;
>   		};
>   	};
>   };
> 
