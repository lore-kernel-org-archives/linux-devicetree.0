From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] backlight: 88pm860x_bl: Use of_get_child_by_name()
 instead of refcount hack
Date: Sun, 18 Jan 2015 12:46:04 +0000
Message-ID: <20150118124604.GU3574@x1>
References: <1421243519-6257-1-git-send-email-geert+renesas@glider.be>
 <1421243519-6257-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421243519-6257-4-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 14 Jan 2015, Geert Uytterhoeven wrote:

> of_find_node_by_name() calls of_node_put() on its "from" parameter.
> To counter this, pm860x_backlight_dt_init() calls of_node_get() first=
=2E
>=20
> Use of_get_child_by_name() instead to get rid of the refcount hack.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Compile-tested only
> ---
>  drivers/video/backlight/88pm860x_bl.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Looks good, applied, thanks.

> diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/ba=
cklight/88pm860x_bl.c
> index 9a23698b6fe8398c..2da5862876d1fe78 100644
> --- a/drivers/video/backlight/88pm860x_bl.c
> +++ b/drivers/video/backlight/88pm860x_bl.c
> @@ -168,10 +168,7 @@ static int pm860x_backlight_dt_init(struct platf=
orm_device *pdev,
>  	struct device_node *nproot, *np;
>  	int iset =3D 0;
> =20
> -	nproot =3D of_node_get(pdev->dev.parent->of_node);
> -	if (!nproot)
> -		return -ENODEV;
> -	nproot =3D of_find_node_by_name(nproot, "backlights");
> +	nproot =3D of_get_child_by_name(pdev->dev.parent->of_node, "backlig=
hts");
>  	if (!nproot) {
>  		dev_err(&pdev->dev, "failed to find backlights node\n");
>  		return -ENODEV;

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
