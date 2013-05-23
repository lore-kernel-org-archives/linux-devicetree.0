From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/7] USB: gadget: atmel_usba: allow multi instance
Date: Thu, 23 May 2013 21:46:56 +0300
Message-ID: <20130523184656.GD19834@arwen.pp.htv.fi>
References: <20130520162149.GC9937@game.jcrosoft.org>
 <1369067160-3230-1-git-send-email-plagnioj@jcrosoft.com>
 <1369067160-3230-2-git-send-email-plagnioj@jcrosoft.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369067160-3230-2-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2013 at 06:25:55PM +0200, Jean-Christophe PLAGNIOL-VILLARD =
wrote:
> drop static struct usba_udc the_udc
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
>  drivers/usb/gadget/atmel_usba_udc.c |   36 +++++++++++++++++------------=
------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/atmel_usba_udc.c b/drivers/usb/gadget/atm=
el_usba_udc.c
> index d2ffd04..eea57a3 100644
> --- a/drivers/usb/gadget/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/atmel_usba_udc.c
> @@ -27,9 +27,6 @@
> =20
>  #include "atmel_usba_udc.h"
> =20
> -
> -static struct usba_udc the_udc;
> -
>  #ifdef CONFIG_USB_GADGET_DEBUG_FS
>  #include <linux/debugfs.h>
>  #include <linux/uaccess.h>
> @@ -1013,16 +1010,13 @@ static void nop_release(struct device *dev)
> =20
>  }
> =20
> -static struct usba_udc the_udc =3D {
> -	.gadget	=3D {
> -		.ops		=3D &usba_udc_ops,
> -		.ep_list	=3D LIST_HEAD_INIT(the_udc.gadget.ep_list),
> -		.max_speed	=3D USB_SPEED_HIGH,
> -		.name		=3D "atmel_usba_udc",
> -		.dev	=3D {
> -			.init_name	=3D "gadget",
> -			.release	=3D nop_release,
> -		},
> +struct usb_gadget usba_gadget_template =3D {
> +	.ops		=3D &usba_udc_ops,
> +	.max_speed	=3D USB_SPEED_HIGH,
> +	.name		=3D "atmel_usba_udc",
> +	.dev	=3D {
> +		.init_name	=3D "gadget",
> +		.release	=3D nop_release,
>  	},
>  };
> =20
> @@ -1839,10 +1833,17 @@ static int __init usba_udc_probe(struct platform_=
device *pdev)
>  	struct usba_platform_data *pdata =3D pdev->dev.platform_data;
>  	struct resource *regs, *fifo;
>  	struct clk *pclk, *hclk;
> -	struct usba_udc *udc =3D &the_udc;
> +	struct usba_udc *udc;
>  	static struct usba_ep *usba_ep;
>  	int irq, ret, i;
> =20
> +	udc =3D devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
> +	if (!udc)
> +		return -ENOMEM;
> +
> +	udc->gadget =3D usba_gadget_template;
> +	INIT_LIST_HEAD(&udc->gadget.ep_list);
> +
>  	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, CTRL_IOMEM_ID);
>  	fifo =3D platform_get_resource(pdev, IORESOURCE_MEM, FIFO_IOMEM_ID);
>  	if (!regs || !fifo || !pdata)
> @@ -1897,8 +1898,7 @@ static int __init usba_udc_probe(struct platform_de=
vice *pdev)
>  		goto err_alloc_ep;
> =20
>  	udc->usba_ep =3D usba_ep;
> -
> -	the_udc.gadget.ep0 =3D &usba_ep[0].ep;
> +	udc->gadget.ep0 =3D &usba_ep[0].ep;
> =20
>  	INIT_LIST_HEAD(&usba_ep[0].ep.ep_list);
>  	usba_ep[0].ep_regs =3D udc->regs + USBA_EPT_BASE(0);
> @@ -1907,7 +1907,7 @@ static int __init usba_udc_probe(struct platform_de=
vice *pdev)
>  	usba_ep[0].ep.ops =3D &usba_ep_ops;
>  	usba_ep[0].ep.name =3D pdata->ep[0].name;
>  	usba_ep[0].ep.maxpacket =3D pdata->ep[0].fifo_size;
> -	usba_ep[0].udc =3D &the_udc;
> +	usba_ep[0].udc =3D udc;
>  	INIT_LIST_HEAD(&usba_ep[0].queue);
>  	usba_ep[0].fifo_size =3D pdata->ep[0].fifo_size;
>  	usba_ep[0].nr_banks =3D pdata->ep[0].nr_banks;
> @@ -1924,7 +1924,7 @@ static int __init usba_udc_probe(struct platform_de=
vice *pdev)
>  		ep->ep.ops =3D &usba_ep_ops;
>  		ep->ep.name =3D pdata->ep[i].name;
>  		ep->ep.maxpacket =3D pdata->ep[i].fifo_size;
> -		ep->udc =3D &the_udc;
> +		ep->udc =3D udc;
>  		INIT_LIST_HEAD(&ep->queue);
>  		ep->fifo_size =3D pdata->ep[i].fifo_size;
>  		ep->nr_banks =3D pdata->ep[i].nr_banks;
> --=20
> 1.7.10.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
balbi

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRnmQgAAoJEIaOsuA1yqRE4yMP/3QEZY8E32+XNIe3zVbPIR6e
ZU2NesJiFdpLvDgothDzliNYJwuZM0QWREjQdJdqGOSOKlBPFq7Ccv2X4eQbLshj
wgtAg7LLcDqWx0r4ZASlC7yAxgr6f9aZ/CUSl+Dx6N8Dcl/Dov95zKVOYm95XrMh
icN83gQUHLjTFgJFM/zhNKhPOTNXqAL+HOK7AKg+6xjDWpchy5KAgGoKlLh106Iw
sXxIhY3GyscIA8m2L7kbGEI6TFh+rY5rrv4ZZoeBKyTH9piOYtlRrWmaxFvLenpD
LoeFUDVTwRmPslcVFOl4XIP6+FVUX0UO/YMHHOoqA77YIpCncdNVlppOKpybCL2A
FihslWACElhqeNOAEPz/UmUKXXryWdeTCzg1YY5+ucWol60GThB7gbvYz7elfKnC
1AwDTq7mOKPk1b9CMVqx86n/b+rvJAel+Wi0oG++N2dTGIj1EuU2QBQtkrgOd7oJ
lXwUOIXkqrXFLBH/UI0m302oHOsEEs5xCRRSCPLu7+B8X/hMlaXLhC+17dVjYzhQ
gaJEIPiyzxsUWwvz5M/973oNoA4qXmmI5nw5eDLswM7Z21gwSizsuUubU0ySlttM
5wKVDaAtkeVNykC/vGNhIx6f+2naJrGhpNAzuC0veeVJ2HmeiDV12viclnvsdsLB
nq4L2ZEufP0CozvxZ81u
=iCqS
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
