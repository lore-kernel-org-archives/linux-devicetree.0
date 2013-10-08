From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] VEXPRESS: Fix VEXPRESS implicit declarations dependence
 errors.
Date: Tue, 08 Oct 2013 08:07:20 -0500
Message-ID: <52540388.8090709@gmail.com>
References: <1381228895-24814-1-git-send-email-csmanjuvijay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381228895-24814-1-git-send-email-csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Majunath Goudar <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nataraja.km-Hm3cg6mZ9cc@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2013 05:41 AM, Majunath Goudar wrote:
> This patch adds a of_find_node_by_phandle() and of_get_next_parent()
> function declaration dependence on"#ifdef CONFIG_OF" in "include/linu=
x/of.h"
> else part return inline dummy implementations (returning NULL). Witho=
ut
> this patch,build system can lead to issues. This was discovered durin=
g
> randconfig testing,in which VEXPRESS_CONFIG was enabled w/o CONFIG_OF
> being enabled,leading to the following error:

What is blocking making VExpress DT only?

The subject should reflect the subsystem you are changing and the
description is missing spaces at a minimum.

Rob

>=20
> CC      drivers/mfd/vexpress-config.o
> drivers/mfd/vexpress-config.c: In function =E2=80=98__vexpress_config=
_func_get=E2=80=99:
> drivers/mfd/vexpress-config.c:117:4: error: implicit declaration of f=
unction
> =E2=80=98of_find_node_by_phandle=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>     bridge_node =3D of_find_node_by_phandle(
>     ^
> drivers/mfd/vexpress-config.c:117:16: warning: assignment makes point=
er from
> integer without a cast [enabled by default]
>     bridge_node =3D of_find_node_by_phandle(
>=20
> Signed-off-by: Manjunath Goudar <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  include/linux/of.h |    9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/include/linux/of.h b/include/linux/of.h
> index f95aee3..968787d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -340,6 +340,15 @@ int of_device_is_stdout_path(struct device_node =
*dn);
> =20
>  #else /* CONFIG_OF */
> =20
> +static inline struct device_node *of_find_node_by_phandle(phandle ha=
ndle)
> +{
> +	return NULL;
> +}
> +static inline struct device_node *of_get_next_parent(struct device_n=
ode *node)
> +{
> +	return NULL;
> +}
> +
>  static inline const char* of_node_full_name(struct device_node *np)
>  {
>  	return "<no-node>";
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
