From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rk3399: init vop clock rates
Date: Wed, 16 Aug 2017 11:15:11 +0800
Message-ID: <5993B8BF.9020100@rock-chips.com>
References: <1502851869-1736-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502851869-1736-1-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Roger Chen <roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017年08月16日 10:51, Kever Yang wrote:
> We need to init vop aclk and hclk incase the U-Boot does not do
> the initialize.
>
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---

Looks good for me:
     Reviewed-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 0b3acc9..a592c24 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1480,6 +1480,8 @@
>   		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
>   		clocks = <&cru ACLK_VOP1>, <&cru DCLK_VOP1>, <&cru HCLK_VOP1>;
>   		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
> +		assigned-clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
> +		assigned-clock-rates = <400000000>, <100000000>;
>   		iommus = <&vopl_mmu>;
>   		power-domains = <&power RK3399_PD_VOPL>;
>   		resets = <&cru SRST_A_VOP1>, <&cru SRST_H_VOP1>, <&cru SRST_D_VOP1>;
> @@ -1525,6 +1527,8 @@
>   		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
>   		clocks = <&cru ACLK_VOP0>, <&cru DCLK_VOP0>, <&cru HCLK_VOP0>;
>   		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
> +		assigned-clocks = <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
> +		assigned-clock-rates = <400000000>, <100000000>;
>   		iommus = <&vopb_mmu>;
>   		power-domains = <&power RK3399_PD_VOPB>;
>   		resets = <&cru SRST_A_VOP0>, <&cru SRST_H_VOP0>, <&cru SRST_D_VOP0>;


-- 
Ｍark Yao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
