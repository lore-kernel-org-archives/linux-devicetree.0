From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: add bindings for rk3399 clock controller
Date: Mon, 28 Mar 2016 01:52:12 +0200
Message-ID: <1507551.YPleCY5ZQt@phil>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-3-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458974276-10325-3-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Xing,

Am Samstag, 26. M=E4rz 2016, 14:37:54 schrieb Xing Zheng:
> Add devicetree bindings for Rockchip cru which found on
> Rockchip SoCs.
>=20
> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>=20
> Changes in v5: None
> Changes in v3: None
> Changes in v2: None
>=20
>  .../bindings/clock/rockchip,rk3399-cru.txt         |   83
> ++++++++++++++++++++ 1 file changed, 83 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3399-
cru.txt
> b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt new=
 file
> mode 100644
> index 0000000..9427caa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
> @@ -0,0 +1,83 @@
> +* Rockchip RK3399 Clock and Reset Unit
> +
> +The RK3399 clock controller generates and supplies clock to various
> +controllers within the SoC and also implements a reset controller fo=
r SoC
> +peripherals.
> +
> +Required Properties:
> +
> +- compatible: PMU for CRU should be "rockchip,rk3399-pmucru"
> +- compatible: CRU should be "rockchip,rk3399-cru"
> +- reg: physical base address of the controller and length of memory=20
mapped
> +  region.
> +- #clock-cells: should be 1.
> +- #reset-cells: should be 1.
> +
> +Optional Properties:
> +
> +- rockchip,grf: phandle to the syscon managing the "general register=
=20
files"
> +  If missing, pll rates are not changeable, due to the missing pll l=
ock
> status. +

the rk3399 doesn't need the GRF, so we should drop this block for now

> +Each clock is assigned an identifier and client nodes can use this
> identifier +to specify the clock which they consume. All available cl=
ocks
> are defined as +preprocessor macros in the dt-bindings/clock/rk3399-c=
ru.h
> headers and can be +used in device tree sources. Similar macros exist=
 for
> the reset sources in +these files.
> +
> +External clocks:
> +
> +There are several clocks that are generated outside the SoC. It is=20
expected
> +that they are defined using standard clock bindings with following
> +clock-output-names:
> + - "xin24m" - crystal input - required,
> + - "xin32k" - rtc clock - optional,
> + - "ext_i2s" - external I2S clock - optional,
> + - "ext_gmac" - external GMAC clock - optional
> + - "ext_hsadc" - external HSADC clock - optional,
> + - "ext_isp" - external ISP clock - optional,
> + - "ext_jtag" - external JTAG clock - optional
> + - "ext_vip" - external VIP clock - optional,
> + - "usbotg_out" - output clock of the pll in the otg phy

external clock listing needs adjusting, something like

- clkin_i2s
- clkin_gmac
--> remove ext_hsadc
- clkin_cif
--> remove ext_jtag
--> remove ext_vip
- clk_usbphy0_480m
- clk_usbphy0_480m

maybe?

> +
> +Example: General Register Files
> +
> +	pmugrf: syscon@ff320000 {
> +		compatible =3D "rockchip,rk3399-pmugrf", "syscon";
> +		reg =3D <0x0 0xff320000 0x0 0x1000>;
> +	};
> +
> +	grf: syscon@ff770000 {
> +		compatible =3D "rockchip,rk3399-grf", "syscon";
> +		reg =3D <0x0 0xff770000 0x0 0x10000>;
> +	};
> +
> +Example: Clock controller node:
> +
> +	pmucru: pmu-clock-controller@ff750000 {
> +		compatible =3D "rockchip,rk3399-pmucru";
> +		reg =3D <0x0 0xff750000 0x0 0x1000>;
> +		rockchip,grf =3D <&pmugrf>;
> +		#clock-cells =3D <1>;
> +		#reset-cells =3D <1>;
> +	};
> +
> +	cru: clock-controller@ff760000 {
> +		compatible =3D "rockchip,rk3399-cru";
> +		reg =3D <0x0 0xff760000 0x0 0x1000>;
> +		rockchip,grf =3D <&grf>;
> +		#clock-cells =3D <1>;
> +		#reset-cells =3D <1>;
> +	};

also here drop grf nodes and rockchip,grf properties?


> +
> +Example: UART controller node that consumes the clock generated by t=
he
> clock +  controller:
> +
> +	uart0: serial@ff1a0000 {
> +		compatible =3D "rockchip,rk3399-uart", "snps,dw-apb-uart";
> +		reg =3D <0x0 0xff180000 0x0 0x100>;
> +		clocks =3D <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +		clock-names =3D "baudclk", "apb_pclk";
> +		interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift =3D <2>;
> +		reg-io-width =3D <4>;
> +	};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
