From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 2/2] ubi: open volumes define in device tree
Date: Fri, 24 Jun 2016 15:45:45 -0300
Message-ID: <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw@mail.gmail.com>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de> <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466277476-14853-2-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18 June 2016 at 16:17, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> This makes it possible to define a volume to open in device tree. Thi=
s
> is helpful when a root file system is on a ubi layer. Without this
> patch it is only possible to device with with kernel command line
> parameters.
>
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/ubi.txt | 22 +++++++++++++++++
>  drivers/mtd/ubi/build.c                       | 34 +++++++++++++++++=
++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/ubi.txt b/Document=
ation/devicetree/bindings/mtd/ubi.txt
> index 5fcd47e..f87a7d8 100644
> --- a/Documentation/devicetree/bindings/mtd/ubi.txt
> +++ b/Documentation/devicetree/bindings/mtd/ubi.txt
> @@ -13,6 +13,16 @@ Describe of a UBI layer in device tree.
>                         which have to be assigned to the newly create=
d UBI
>                         device (assigned automatically by default)
>
> +Partitions on a UBI layer can be defined:
> +
> + - compatible:                 "ubi,volume"
> + - name:               name of the ubi volume to open
> + - ubi-mode:           mode of the ubi volume to open value:
> +                       UBI_READONLY:   1
> +                       UBI_READWRITE:  2
> +                       UBI_EXCLUSIVE:  3
> +                       UBI_METAONLY:   4
> +
>  Example:
>
>  partitions {
> @@ -29,5 +39,17 @@ partitions {
>                 label =3D "system_sw";
>                 reg =3D <0x1c0000 0xc800000>;
>                 compatible =3D "ubi,device";
> +
> +               rootfsA@0 {
> +                       compatible =3D "ubi,volume";
> +                       name =3D "rootfsA";
> +                       ubi-mode =3D <1>;
> +               };
> +
> +               data_vol@0 {
> +                       compatible =3D "ubi,volume";
> +                       name =3D "data_vol";
> +                       ubi-mode =3D <2>;
> +               };
>         };
>  };
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 16baeb5..1c22533 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1,6 +1,7 @@
>  /*
>   * Copyright (c) International Business Machines Corp., 2006
>   * Copyright (c) Nokia Corporation, 2007
> + * Copyright (c) 2016 Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>   *

A tangential comment for this and other patches.

There's no need to add your copyright when you are submitting
small contributions.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
