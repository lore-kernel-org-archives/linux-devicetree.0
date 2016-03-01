From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 5/5] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
Date: Tue, 1 Mar 2016 13:28:52 +0100
Message-ID: <56D58B04.3050106@atmel.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
 <1455098187-9442-6-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455098187-9442-6-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 10/02/2016 10:56, Romain Izard a =E9crit :
> Both nodes are required to access NAND Flash memory. Additional
> settings will be necessary at the board level to use it.
>=20
> Tested-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I add it in our at91-4.6-dt branch.

Thanks, bye.

> ---
> v4: collect Tested-by and Reviewed-by tags
> v3: no change
> v2: fix device address, hexadecimal with minuscules
>=20
>  arch/arm/boot/dts/sama5d2.dtsi | 38 ++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5=
d2.dtsi
> index 3f750f6170f2..484bd8ea6602 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -263,6 +263,44 @@
>  			cache-level =3D <2>;
>  		};
> =20
> +		nand0: nand@80000000 {
> +			compatible =3D "atmel,sama5d2-nand";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			reg =3D < /* EBI CS3 */
> +				0x80000000 0x08000000
> +				/* SMC PMECC regs */
> +				0xf8014070 0x00000490
> +				/* SMC PMECC Error Location regs */
> +				0xf8014500 0x00000200
> +				/* ROM Galois tables */
> +				0x00040000 0x00018000
> +				>;
> +			interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH 6>;
> +			atmel,nand-addr-offset =3D <21>;
> +			atmel,nand-cmd-offset =3D <22>;
> +			atmel,nand-has-dma;
> +			atmel,has-pmecc;
> +			atmel,pmecc-lookup-table-offset =3D <0x0 0x8000>;
> +			status =3D "disabled";
> +
> +			nfc@c0000000 {
> +				compatible =3D "atmel,sama5d4-nfc";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				reg =3D < /* NFC Command Registers */
> +					0xc0000000 0x08000000
> +					/* NFC HSMC regs */
> +					0xf8014000 0x00000070
> +					/* NFC SRAM banks */
> +					0x00100000 0x00100000
> +					>;
> +				clocks =3D <&hsmc_clk>;
> +				atmel,write-by-sram;
> +			};
> +		};
> +
>  		sdmmc0: sdio-host@a0000000 {
>  			compatible =3D "atmel,sama5d2-sdhci";
>  			reg =3D <0xa0000000 0x300>;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
