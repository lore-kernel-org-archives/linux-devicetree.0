From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Date: Thu, 23 Jun 2016 18:01:08 +0200
Message-ID: <20160623180108.382bbaae@bbrezillon>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
	<20160620044838.56904-2-icenowy@aosc.xyz>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCK63FO5TUHRBRMPWC5QKGQENA7NA7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160620044838.56904-2-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Jun 2016 12:48:38 +0800
Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:

> The NAND controller on some sun8i chips needs its reset line to be
> deasserted before they can enter working state.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  =C2=A0Changes in v2:
>  =C2=A0=C2=A0=C2=A0- Corrected the error checking code of reset line.
>=20
>  =C2=A0Changes in v3:
>  =C2=A0=C2=A0=C2=A0- Corrected a more serious error brought in the "fix" =
of v2.
>=20
>  =C2=A0Changes in v4:
>  =C2=A0=C2=A0=C2=A0- Removed unneeded code block after "else".
>=20
>  =C2=A0Changes in v5:
>  =C2=A0=C2=A0=C2=A0- Added reassertion code in case of initialization err=
or and device
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.
>=20
>   Changes in v6:
>     - Fixed a resource leak by not using goto to exit in case of error.
>=20
>  drivers/mtd/nand/sunxi_nand.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.=
c
> index a83a690..08d5e88 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -39,6 +39,7 @@
>  #include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
> +#include <linux/reset.h>
> =20
>  #define NFC_REG_CTL		0x0000
>  #define NFC_REG_ST		0x0004
> @@ -269,6 +270,7 @@ struct sunxi_nfc {
>  	void __iomem *regs;
>  	struct clk *ahb_clk;
>  	struct clk *mod_clk;
> +	struct reset_control *reset;
>  	unsigned long assigned_cs;
>  	unsigned long clk_rate;
>  	struct list_head chips;
> @@ -1871,26 +1873,42 @@ static int sunxi_nfc_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		goto out_ahb_clk_unprepare;
> =20
> +	nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
> +
> +	if (!IS_ERR(nfc->reset)) {
> +		ret =3D reset_control_deassert(nfc->reset);
> +		if (ret) {
> +			dev_err(dev, "reset err %d\n", ret);
> +			goto out_mod_clk_unprepare;
> +		}
> +	} else if (PTR_ERR(nfc->reset) !=3D -ENOENT) {
> +		ret =3D PTR_ERR(nfc->reset);

You should return -EDEFER_PROBE here.

And can you please rebase this series on top of nand/next [1]?

[1]https://github.com/linux-nand/linux/tree/nand/next

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
