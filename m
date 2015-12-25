From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: Add support emac for RK3036
Date: Fri, 25 Dec 2015 10:36:04 +0800
Message-ID: <567CAB94.7090701@gmail.com>
References: <1450862390-407-1-git-send-email-zhengxing@rock-chips.com>
 <1450862390-407-4-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450862390-407-4-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Xing,

=E5=9C=A8 2015=E5=B9=B412=E6=9C=8823=E6=97=A5 17:19, Xing Zheng =E5=86=99=
=E9=81=93:
> This patch describe the emac, and we need to let mac clock under
> the APLL which is able to provide the accurate 50MHz what mac_ref
> need.
>
> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
>   arch/arm/boot/dts/rk3036-evb.dts   |   25 +++++++++++++++++++++++++
>   arch/arm/boot/dts/rk3036-kylin.dts |   23 +++++++++++++++++++++++
>   arch/arm/boot/dts/rk3036.dtsi      |   32 +++++++++++++++++++++++++=
+++++++
>   3 files changed, 80 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3036-evb.dts b/arch/arm/boot/dts/rk3=
036-evb.dts
> index 28a0336..69b96e6 100644
> --- a/arch/arm/boot/dts/rk3036-evb.dts
> +++ b/arch/arm/boot/dts/rk3036-evb.dts
> @@ -62,3 +62,28 @@
>   &uart2 {
>   	status =3D "okay";
>   };
> +
> +&emac {
> +	assigned-clocks =3D <&cru SCLK_MACPLL>;
> +	assigned-clock-parents =3D <&cru PLL_APLL>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&emac_xfer>, <&emac_mdio>, <&rmii_rst>;
> +	phy =3D <&phy0>;
> +	status =3D "okay";
> +
> +	phy0: ethernet-phy@0 {
> +		reg =3D <0>;
> +	};
> +};
> +
> +&pinctrl {
> +	pcfg_output_high: pcfg-output-high {
> +		output-high;
> +	};
> +

That's seem a new preperty for pinctrl on rk3036, we should submit it i=
n=20
rk3036 dtsi.

Do we are really need it?

GPIO2_C6 is pulled up in internal chip.
So, maybe you only do that:

rockchip,pins =3D <2 22 RK_FUNC_GPIO &pcfg_pull_default>;


> +	emac {
> +		rmii_rst: rmii-rst {
> +			rockchip,pins =3D <2 22 RK_FUNC_GPIO &pcfg_output_high>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/r=
k3036-kylin.dts
> index 992f9ca..3fb1cfe 100644
> --- a/arch/arm/boot/dts/rk3036-kylin.dts
> +++ b/arch/arm/boot/dts/rk3036-kylin.dts
> @@ -285,7 +285,24 @@
>   	status =3D "okay";
>   };
>  =20
> +&emac {
> +	assigned-clocks =3D <&cru SCLK_MACPLL>;
> +	assigned-clock-parents =3D <&cru PLL_APLL>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&emac_xfer>, <&emac_mdio>, <&rmii_rst>;
> +	phy =3D <&phy0>;
> +	status =3D "okay";
> +
> +	phy0: ethernet-phy@0 {
> +		reg =3D <0>;
> +	};
> +};
> +
>   &pinctrl {
> +	pcfg_output_high: pcfg-output-high {
> +		output-high;
> +	};
> +
>   	pmic {
>   		pmic_int: pmic-int {
>   			rockchip,pins =3D <2 2 RK_FUNC_GPIO &pcfg_pull_default>;
> @@ -297,4 +314,10 @@
>   			rockchip,pins =3D <2 7 RK_FUNC_1 &pcfg_pull_none>;
>   		};
>   	};
> +
> +	emac {
> +		rmii_rst: rmii-rst {
> +			rockchip,pins =3D <2 22 RK_FUNC_GPIO &pcfg_output_high>;
> +		};
> +	};
>   };
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036=
=2Edtsi
> index b9567c1..0c09fb3 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -186,6 +186,20 @@
>   		status =3D "disabled";
>   	};
>  =20
> +	emac: ethernet@10200000 {
> +		compatible =3D "rockchip,rk3036-emac", "snps,arc-emac";
> +		reg =3D <0x10200000 0x4000>;
> +		interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		rockchip,grf =3D <&grf>;
> +		clocks =3D <&cru HCLK_MAC>, <&cru SCLK_MACREF>, <&cru SCLK_MAC>;
> +		clock-names =3D "hclk", "macref", "macclk";
> +		max-speed =3D <100>;
> +		phy-mode =3D "rmii";
> +		status =3D "disabled";
> +	};
> +
>   	sdmmc: dwmmc@10214000 {
>   		compatible =3D "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-msh=
c";
>   		reg =3D <0x10214000 0x4000>;
> @@ -556,6 +570,24 @@
>   			};
>   		};
>  =20
> +		emac {
> +			emac_xfer: emac-xfer {
> +				rockchip,pins =3D <2 10 RK_FUNC_1 &pcfg_pull_none>, /* crs_dvali=
d */
> +						<2 13 RK_FUNC_1 &pcfg_pull_none>, /* tx_en */
> +						<2 14 RK_FUNC_1 &pcfg_pull_none>, /* mac_clk */
> +						<2 15 RK_FUNC_1 &pcfg_pull_none>, /* rx_err */
> +						<2 16 RK_FUNC_1 &pcfg_pull_none>, /* rxd1 */
> +						<2 17 RK_FUNC_1 &pcfg_pull_none>, /* rxd0 */
> +						<2 18 RK_FUNC_1 &pcfg_pull_none>, /* txd1 */
> +						<2 19 RK_FUNC_1 &pcfg_pull_none>; /* txd0 */
> +			};
> +
> +			emac_mdio: emac-mdio {
> +				rockchip,pins =3D <2 12 RK_FUNC_1 &pcfg_pull_none>, /* mac_md */
> +						<2 25 RK_FUNC_1 &pcfg_pull_none>; /* mac_mdclk */
> +			};
> +		};
> +
>   		i2c0 {
>   			i2c0_xfer: i2c0-xfer {
>   				rockchip,pins =3D <0 0 RK_FUNC_1 &pcfg_pull_none>,


--=20
Thanks,
Caesar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
