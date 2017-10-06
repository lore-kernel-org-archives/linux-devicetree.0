From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Fri, 6 Oct 2017 02:44:27 +0000
Message-ID: <TY1PR06MB09929C1AA6DF445EDC38F32ED8710@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507216358-917-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: ja-JP
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Biju-san,
(+ Felipe-san)

Thank you for the patch!

> From: Biju Das, Sent: Friday, October 6, 2017 12:13 AM
>=20
> This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>=20
> This doesn't change the driver, so it does nothing by itself.  But it doe=
s
> mean that checkpatch won't complain about a future patch that adds
> "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which helps
> ensure that shipped DTs use documented compatibility strings.
>=20
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> This patch is tested against Linux next tag next-20170929
>=20
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 9e18e00..479215b 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -3,6 +3,8 @@ Renesas Electronics USBHS driver
>  Required properties:
>    - compatible: Must contain one or more of the following:
>=20
> +	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
> +	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
>  	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
>  	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
>  	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
> @@ -10,7 +12,7 @@ Required properties:
>  	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
>  	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
>  	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
> -	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
> +	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible device
>  	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device

This will be conflict with my R-Car D3 support patch.
https://patchwork.kernel.org/patch/9982267/
The R-Car D3 patch is not applied into usb.git yet though...

Hi Felipe-san,

Could you resolve this conflict on your side?
Or, should this r8a7743/5 patch be rebased on the R-Car D3 patch?

When after resolved the conflict:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Best regards,
Yoshihiro Shimoda

>  	When compatible with the generic version, nodes must list the
> --
> 1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
