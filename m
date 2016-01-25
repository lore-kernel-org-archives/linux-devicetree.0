From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: add support emac for RK3036
Date: Tue, 26 Jan 2016 00:06:27 +0800
Message-ID: <56A64803.8070006@gmail.com>
References: <1453725488-5279-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453725488-5279-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhengxing <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2016=E5=B9=B401=E6=9C=8825=E6=97=A5 20:38, Caesar Wang =E5=86=
=99=E9=81=93:
> From: zhengxing <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> This patch describe the emac, and we need to let mac clock under
> the APLL which is able to provide the accurate 50MHz what mac_ref
> need.
>
> This patch makes the emac parent clock is DPLL instead of APLL.
> since that will cause some unstable things if the cpufreq is working.
>
> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
[...]
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036=
=2Edtsi
> index 7897449..436c77a 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -186,6 +186,27 @@
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
> +		/*
> +		 * Fix the emac parent clock is DPLL instead of APLL.
> +		 * since that will cause some unstable things if the cpufreq
> +		 * is working. (e.g: the accurate 50MHz what mac_ref need)
> +		 */
> +		assigned-clocks =3D <&cru SCLK_MACPLL>;
> +		assigned-clock-parents =3D <&cru PLL_DPLL>;

This patch depends on the clock patch. :-( =EF=BC=88still in my work br=
anch)

> +		max-speed =3D <100>;
> +		phy-mode =3D "rmii";
> +		status =3D "disabled";
> +	};
> +
>   	sdmmc: dwmmc@10214000 {
>   		compatible =3D "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-msh=
c";
>   		reg =3D <0x10214000 0x4000>;
> @@ -556,6 +577,24 @@
>   			};
>   		};
>  =20
> +		emac {
> +			emac_xfer: emac-xfer {
> +				rockchip,pins =3D <2 10 RK_FUNC_1 &pcfg_pull_default>, /* crs_dv=
alid */
> +						<2 13 RK_FUNC_1 &pcfg_pull_default>, /* tx_en */
> +						<2 14 RK_FUNC_1 &pcfg_pull_default>, /* mac_clk */
> +						<2 15 RK_FUNC_1 &pcfg_pull_default>, /* rx_err */
> +						<2 16 RK_FUNC_1 &pcfg_pull_default>, /* rxd1 */
> +						<2 17 RK_FUNC_1 &pcfg_pull_default>, /* rxd0 */
> +						<2 18 RK_FUNC_1 &pcfg_pull_default>, /* txd1 */
> +						<2 19 RK_FUNC_1 &pcfg_pull_default>; /* txd0 */
> +			};
> +
> +			emac_mdio: emac-mdio {
> +				rockchip,pins =3D <2 12 RK_FUNC_1 &pcfg_pull_default>, /* mac_md=
 */
> +						<2 25 RK_FUNC_1 &pcfg_pull_default>; /* mac_mdclk */
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
