From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Doc: mfd: as3722: Add details of optional missing
 property
Date: Mon, 16 Jun 2014 10:52:56 +0100
Message-ID: <20140616095256.GN14323@lee--X1>
References: <1402297417-9338-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402297417-9338-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

CC'ing Linus as he had an opinion.

On Mon, 09 Jun 2014, Laxman Dewangan wrote:
> Add details of following properties which are used on driver but
> not documented on DT binding document.
> - ams,enable-internal-int-pullup
> - ams,enable-internal-i2c-pullup
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reported-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/as3722.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Docum=
entation/devicetree/bindings/mfd/as3722.txt
> index 8edcb9b..4f64b2a 100644
> --- a/Documentation/devicetree/bindings/mfd/as3722.txt
> +++ b/Documentation/devicetree/bindings/mfd/as3722.txt
> @@ -13,6 +13,14 @@ Required properties:
>    The second cell is the flags, encoded as the trigger masks from bi=
nding document
>  	interrupts.txt, using dt-bindings/irq.
> =20
> +Optional properties:
> +--------------------
> +- ams,enable-internal-int-pullup: Boolean property, to enable intern=
al pullup on
> +	interrupt pin. Missing this will disable internal pullup on INT pin=
=2E
> +- ams,enable-internal-i2c-pullup: Boolean property, to enable intern=
al pullup on
> +	i2c scl/sda pins. Missing this will disable internal pullup on i2c
> +	scl/sda lines.
> +
>  Optional submodule and their properties:
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
