From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH  2/2] ARM: dts: r8a7743: Add xhci support to SoC dtsi
Date: Tue, 17 Oct 2017 01:39:33 +0000
Message-ID: <TY1PR06MB0992D251A9DB8DB83E7099C9D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-3-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508148769-47488-3-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Biju-san,

IIUC, when we submitted a patch for dts[i] file,
we don't need to submit such a patch to usb maintainers.

> From: Biju Das, Sent: Monday, October 16, 2017 7:13 PM
>=20
> From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>=20
> Add node for xhci. Boards DT files will enable it if needed.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.d=
tsi
> index 699c040..386bf07 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -931,6 +931,26 @@
>  			status =3D "disabled";
>  		};
>=20
> +		/*
> +		 * pci1 and xhci share the same phy, therefore only one of them
> +		 * can be active at any one time. If both of them are enabled,
> +		 * a race condition will determine who'll control the phy.
> +		 * A firmware file is needed by the xhci driver in order for
> +		 * USB 3.0 to work properly.
> +		 */
> +		xhci: usb@ee000000 {
> +			compatible =3D "renesas,xhci-r8a7743",
> +				     "renesas,rcar-gen2-xhci";
> +			reg =3D <0 0xee000000 0 0xc00>;
> +			interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 328>;
> +			power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 328>;
> +			phys =3D <&usb2 1>;
> +			phy-names =3D "usb";
> +			status =3D "disabled";
> +		};
> +
>  		sdhi0: sd@ee100000 {
>  			compatible =3D "renesas,sdhi-r8a7743";
>  			reg =3D <0 0xee100000 0 0x328>;

It seems good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Best regards,
Yoshihiro Shimoda

> --
> 1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
