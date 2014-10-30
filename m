From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 4/4] ARM: dts: rockchip: Enable emac node in rk3066a-marsboard
Date: Thu, 30 Oct 2014 21:01:22 +0100
Message-ID: <2556111.3QCemWlFX8@phil>
References: <1414499062-23875-1-git-send-email-romain.perier@gmail.com> <1414499062-23875-4-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414499062-23875-4-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 28. Oktober 2014, 12:24:22 schrieb Romain Perier:
> This enables EMAC Rockchip and adds initial ethernet support
> for the MarsBoard RK3066.
> 
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

please reorder your series a bit:

Patch1: ARM: dts: rockchip: Add EMAC Rockchip for RK3066 SoCs
Patch2: old patches 1,2,4 combined into one single patch


> ---
>  arch/arm/boot/dts/rk3066a-marsboard.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts
> b/arch/arm/boot/dts/rk3066a-marsboard.dts index 146bd61..560070c 100644
> --- a/arch/arm/boot/dts/rk3066a-marsboard.dts
> +++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
> @@ -122,6 +122,30 @@
>  /* must be included after &tps gets defined */
>  #include "tps65910.dtsi"
> 
> +&emac {
> +	status = "okay";
> +
> +	phy = <&phy0>;
> +	phy-supply = <&vaux33_reg>;

&vcc_rmii as explained in the other mail

> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&emac_xfer>, <&emac_mdio>, <&phy_int>;
> +
> +	phy0: ethernet-phy@0 {
> +		reg = <0>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&pinctrl {
> +	lan8720a {
> +		phy_int: phy-int {
> +			rockchip,pins = <RK_GPIO1 26 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
