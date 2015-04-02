From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: sama5/dts: reduce the NFC command register
 map
Date: Thu, 2 Apr 2015 11:24:41 +0200
Message-ID: <551D0AD9.1090307@atmel.com>
References: <1427955477-9176-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427955477-9176-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 02/04/2015 08:17, Josh Wu a =E9crit :
> commit 111573ccd89b ("mtd: atmel_nand: check NFC busy flag by HSMC_SR
> instead of NFC cmd regs")

As this commit is not in Linus' tree yet, we can't point to its commit =
ID.

> check NFC busy by nfc SR instead of NFC cmd regs. So we don't need to
> map NFC cmd registers to include NFCBUSY bit.
> That means we only need map 0x08000000 instead of 0x10000000 for NFC
> cmd regs.
>=20
> This patch reduce the NFC cmd regs map for sama5d3 & sama5d4.
>=20
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Otherwise:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I'll modify the commit message to adapt the commit ID and send it when
the patch is merged (probably after 4.0-rc1).

Thanks, best regards,

> ---
> This patch is based on linux-next git repo.
>=20
>  arch/arm/boot/dts/sama5d3.dtsi | 2 +-
>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5=
d3.dtsi
> index 261311b..5b2c235 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -1445,7 +1445,7 @@
>  				#address-cells =3D <1>;
>  				#size-cells =3D <1>;
>  				reg =3D <
> -					0x70000000 0x10000000	/* NFC Command Registers */
> +					0x70000000 0x08000000	/* NFC Command Registers */
>  					0xffffc000 0x00000070	/* NFC HSMC regs */
>  					0x00200000 0x00100000	/* NFC SRAM banks */
>  					>;
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index d986b41..87705ad 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -294,7 +294,7 @@
>  				#address-cells =3D <1>;
>  				#size-cells =3D <1>;
>  				reg =3D <
> -					0x90000000 0x10000000	/* NFC Command Registers */
> +					0x90000000 0x08000000	/* NFC Command Registers */
>  					0xfc05c000 0x00000070	/* NFC HSMC regs */
>  					0x00100000 0x00100000	/* NFC SRAM banks */
>                                           >;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
