From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: berlin: add the SDHCI nodes for the
 BG2Q
Date: Tue, 22 Apr 2014 19:35:27 +0200
Message-ID: <5356A85F.6030708@gmail.com>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com> <1398155248-1659-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398155248-1659-2-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Ball <chris-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Added MMC maintainers Chris and Ulf for one question below]

On 04/22/2014 10:27 AM, Antoine T=C3=A9nart wrote:
> Add the SDHCI nodes for the Marvell Berlin BG2Q, using the mrvl,pxav3=
-mmc
> driver.
>=20
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> ---
>  arch/arm/boot/dts/berlin2q.dtsi | 32 +++++++++++++++++++++++++++++++=
+
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berl=
in2q.dtsi
> index 5925e6a16749..85d0ca5cc47a 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -67,6 +67,14 @@
>  		clock-div =3D <3>;
>  	};
> =20
> +	sdio1clk: sdio1clk {
> +		compatible =3D "fixed-factor-clock";
> +		#clock-cells =3D <0>;
> +		clocks =3D <&syspll>;
> +		clock-mult =3D <1>;
> +		clock-div =3D <4>;
> +	};
> +
>  	soc {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
> @@ -75,6 +83,30 @@
>  		ranges =3D <0 0xf7000000 0x1000000>;
>  		interrupt-parent =3D <&gic>;
> =20
> +		sdhci0: sdhci@ab0000 {
> +			compatible =3D "mrvl,pxav3-mmc";
> +			reg =3D <0xab0000 0x200>;
> +			clocks =3D <&sdio1clk>;
> +			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		sdhci1: sdhci@ab0800 {
> +			compatible =3D "mrvl,pxav3-mmc";
> +			reg =3D <0xab0800 0x200>;
> +			clocks =3D <&sdio1clk>;
> +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
> +		sdhci2: sdhci@ab1000 {

Didn't Jisheng ask for sdhci2 being registered at mmc0?
Renaming the node labels will not help, but have you tried using an:

aliases {
	mmc0 =3D &sdhci2;
	mmc1 =3D &sdhci0;
	mmc2 =3D &sdhci1;
};

node and set the platform_device's .id field with what you get
from of_alias_get_id(np, "mmc")?

@Chris, Ulf: Is there any generic alias, e.g. "sdhci", you prefer for
drivers/mmc so we can put it into sdhci_get_of_property()?

Sebastian

> +			compatible =3D "mrvl,pxav3-mmc";
> +			reg =3D <0xab1000 0x200>;
> +			interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&sdio1clk>;
> +			status =3D "disabled";
> +		};
> +
>  		l2: l2-cache-controller@ac0000 {
>  			compatible =3D "arm,pl310-cache";
>  			reg =3D <0xac0000 0x1000>;
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
