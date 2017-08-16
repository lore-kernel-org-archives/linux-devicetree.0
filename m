From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] arm64: dts: rockchip: Handle pcie wake in pcie
 driver for Gru
Date: Wed, 16 Aug 2017 16:33:38 +0800
Message-ID: <3bd2600e-6e5d-6179-6b9b-6989e1f65b7d@rock-chips.com>
References: <20170816075224.31734-1-jeffy.chen@rock-chips.com>
 <20170816075224.31734-4-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170816075224.31734-4-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jeffy,

On 2017/8/16 15:52, Jeffy Chen wrote:
> Currently we are handling pcie wake irq in mrvl wifi driver.
> Move it to rockchip pcie driver for Gru boards.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index d48e98b62d09..7a5e1517a496 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -712,11 +712,21 @@ ap_i2c_audio: &i2c8 {
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
> +	interrupt-names = "sys", "legacy", "client", "wake";
> +	/delete-property/ interrupts;
> +

Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
says "Nodes that describe devices which generate interrupts must contain
an "interrupts" property, an "interrupts-extended" property, or both. If
both are present, the latter should take precedence;"

But it doesn't seem real as drivers/of/irq.c actually says "Try the
new-style interrupts-extended first"

Anyway, it seems you could safely add interrupts-extended and don't need
to delete "interrupts".

>   	vpcie3v3-supply = <&pp3300_wifi_bt>;
>   	vpcie1v8-supply = <&wlan_pd_n>; /* HACK: see &wlan_pd_n */
>   	vpcie0v9-supply = <&pp900_pcie>;
>   
> +	wakeup-source;
> +

I also have a question for this one but will inline that in the patch 1

>   	pci_rootport: pcie@0,0 {
>   		reg = <0x83000000 0x0 0x00000000 0x0 0x00000000>;
>   		#address-cells = <3>;
> @@ -727,11 +737,6 @@ ap_i2c_audio: &i2c8 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
