From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add three new resets for rk3399 PCIe controller
Date: Fri, 21 Oct 2016 09:58:11 +0200
Message-ID: <7351283.vgsyxVQ7sJ@phil>
References: <1477017836-19317-1-git-send-email-shawn.lin@rock-chips.com> <1477017836-19317-3-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477017836-19317-3-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Am Freitag, 21. Oktober 2016, 10:43:56 CEST schrieb Shawn Lin:
> pm_rst, aclk_rst and pclk_rst should be controlled by driver, so we
> need to add these three resets for PCIe controller.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

If patch1 is ok and you want to take both patches at once,
that is fine by me, so
Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Otherwise I can also pick this one up after (and if) your ok with patch1.


Heiko

> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 76b2864..5191cfd 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -300,8 +300,11 @@
>  		ranges = <0x83000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x600000
>  			  0x81000000 0x0 0xfa600000 0x0 0xfa600000 0x0 0x100000>;
>  		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
> -			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>;
> -		reset-names = "core", "mgmt", "mgmt-sticky", "pipe";
> +			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
> +			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
> +			 <&cru SRST_A_PCIE>;
> +		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
> +			      "pm", "pclk", "aclk";
>  		status = "disabled";
> 
>  		pcie0_intc: interrupt-controller {


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
