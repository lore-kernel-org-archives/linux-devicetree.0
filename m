From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: STi: Add STiH410 SoC support
Date: Thu, 5 Mar 2015 13:41:57 +0000
Message-ID: <20150305134157.GD31098@x1>
References: <1425559623-12379-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425559623-12379-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Maxime,

Can you send this directly to Arnd for inclusion into the -rcs please?

Also, please also CC -stable and add the necessary tag in the commit
message.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> This patch adds support to STiH410 SoC.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/sti.txt | 4 ++++
>  arch/arm/mach-sti/board-dt.c                  | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sti.txt b/Document=
ation/devicetree/bindings/arm/sti.txt
> index d70ec35..8d27f6b 100644
> --- a/Documentation/devicetree/bindings/arm/sti.txt
> +++ b/Documentation/devicetree/bindings/arm/sti.txt
> @@ -13,6 +13,10 @@ Boards with the ST STiH407 SoC shall have the foll=
owing properties:
>  Required root node property:
>  compatible =3D "st,stih407";
> =20
> +Boards with the ST STiH410 SoC shall have the following properties:
> +Required root node property:
> +compatible =3D "st,stih410";
> +
>  Boards with the ST STiH418 SoC shall have the following properties:
>  Required root node property:
>  compatible =3D "st,stih418";
> diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-d=
t.c
> index b067390..b373aca 100644
> --- a/arch/arm/mach-sti/board-dt.c
> +++ b/arch/arm/mach-sti/board-dt.c
> @@ -18,6 +18,7 @@ static const char *stih41x_dt_match[] __initdata =3D=
 {
>  	"st,stih415",
>  	"st,stih416",
>  	"st,stih407",
> +	"st,stih410",
>  	"st,stih418",
>  	NULL
>  };

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
