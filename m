From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: sama5/dts: move hsmc_clk out of nfc node
Date: Mon, 22 Feb 2016 13:58:23 +0100
Message-ID: <56CB05EF.9020105@atmel.com>
References: <1455687741-9625-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455687741-9625-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 17/02/2016 06:42, Wenyou Yang a =E9crit :
> From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> In sama5d3, sama5d4 chips, pmecc will use the hsmc clock. As pmecc is
> part of HSMC. So move out hsmc_clk from nfc node to nand node.
>=20
> Signed-off-by: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I'm not against this change, but beware, it must be applied in
synchronization with the patch just posted "[PATCH] mtd: atmel_nand:
move the hsmc_clk from nfc node to nand node"

Bye,


> ---
>=20
>  arch/arm/boot/dts/sama5d3.dtsi |    2 +-
>  arch/arm/boot/dts/sama5d4.dtsi |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5=
d3.dtsi
> index a532791..a242d27 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -1474,6 +1474,7 @@
>  			atmel,nand-has-dma;
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pinctrl_nand0_ale_cle>;
> +			clocks =3D <&hsmc_clk>;
>  			atmel,pmecc-lookup-table-offset =3D <0x0 0x8000>;
>  			status =3D "disabled";
> =20
> @@ -1486,7 +1487,6 @@
>  					0xffffc000 0x00000070	/* NFC HSMC regs */
>  					0x00200000 0x00100000	/* NFC SRAM banks */
>  					>;
> -				clocks =3D <&hsmc_clk>;
>  			};
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index b8032bc..1499b33 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -295,6 +295,7 @@
>  			atmel,nand-has-dma;
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pinctrl_nand>;
> +			clocks =3D <&hsmc_clk>;
>  			status =3D "disabled";
> =20
>  			nfc@90000000 {
> @@ -306,7 +307,6 @@
>  					0xfc05c000 0x00000070	/* NFC HSMC regs */
>  					0x00100000 0x00100000	/* NFC SRAM banks */
>                                           >;
> -				clocks =3D <&hsmc_clk>;
>  				atmel,write-by-sram;
>  			};
>  		};
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
