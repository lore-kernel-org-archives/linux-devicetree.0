From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Tue, 10 Dec 2013 08:40:42 +0000
Message-ID: <20131210084042.GN12675@lee--X1>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386626809-6251-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> mfd_add_device() assigns .of_node in the device objects it creates on=
ly
> if the mfd_cell for the device has the .of_compatible field set and t=
he
> DT node for the top-level MFD device contains a child whose compatibl=
e
> property matches the cell's .of_compatible field.
>=20
> This leaves .of_node unset in many cases. When this happens, entries =
in
> the DT /aliases property which refer to the top-level MFD DT node wil=
l
> never match the MFD child devices, hence causing the requested alias =
not
> to be honored.
>=20
> Solve this by setting each MFD child device's .of_node equal to the t=
op-
> level MFD device's .of_node field in the cases where it would otherwi=
se
> remain unset.

How sure are you that this will be void of repercussions?

> The first use-case for this will be aliases for the TPS6586x's RTC
> device.

Isn't it viable to supply the of_compatible strings for these nodes
and search the parent for its alias property instead?

> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> The 3 patches in this series are all independent; they can be applied
> to their respective subsystems in any order. I'm simply posting them =
as
> a series to make the use-case more obvious.
> ---
>  drivers/mfd/mfd-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 267649244737..32e8d47d9002 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -117,6 +117,8 @@ static int mfd_add_device(struct device *parent, =
int id,
>  			}
>  		}
>  	}
> +	if (!pdev->dev.of_node)
> +		pdev->dev.of_node =3D parent->of_node;
> =20
>  	if (cell->pdata_size) {
>  		ret =3D platform_device_add_data(pdev,

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
