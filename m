From: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: CCI : Fix implicit declaration of function error
Date: Thu, 17 Oct 2013 13:12:28 +0100
Message-ID: <20131017121227.GC2442@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Majunath Goudar <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Majunath Goudar <manju.goudar-Hm3cg6mZ9cc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, nataraja.km-Hm3cg6mZ9cc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 14, 2013 at 03:52:27PM +0530, Majunath Goudar wrote:
> This patch adds a inline dummy implementations of_find_matching_node(=
)
> in "#ifdef CONFIG_OF" else part. Without this patch,build system can
> lead to issues. This was discovered during randconfig testing,in whic=
h
> ARM_CCI was enabled w/o CONFIG_OF being enabled,leading to the follow=
ing error:

Without fetching config info from the DT, the CCI driver is not usable,
so it makes no sense to build this driver without CONFIG_OF.

Your previous patch [1] looked sensible, but I don't see any responses
on lakml.  Are you still pursuing that patch, or is this patch intended
as a replacement?


Dummy functions for things like of_find_matching_node() might be useful
for drivers that can fall back to other config mechanisms if OF is
unavailable, but that is a separate discussion.

arm-cci is not such a driver, and any such drivers that exist toady
must be coping without the dummy OF functions.

Cheers
---Dave

[1]  http://lists.infradead.org/pipermail/linux-arm-kernel/2013-October=
/202996.html
([PATCH] BUS: CCI : Fix arm-cci implicit declarations dependence errors=
=2E)

>=20
> CC      drivers/bus/arm-cci.o
> drivers/bus/arm-cci.c: In function =E2=80=98cci_probe=E2=80=99:
> drivers/bus/arm-cci.c:971:2: error: implicit declaration of function
> =E2=80=98of_find_matching_node=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
> cc1: some warnings being treated as errors
> make[2]: *** [drivers/bus/arm-cci.o] Error 1
> make[1]: *** [drivers/bus] Error 2
> make: *** [drivers] Error 2
>=20
> Signed-off-by: Manjunath Goudar <manju.goudar-Hm3cg6mZ9cc@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  include/linux/of.h |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/linux/of.h b/include/linux/of.h
> index f95aee3..2c57aa2 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -340,6 +340,13 @@ int of_device_is_stdout_path(struct device_node =
*dn);
> =20
>  #else /* CONFIG_OF */
> =20
> +static inline struct device_node *of_find_matching_node(
> +	struct device_node *from,
> +	const struct of_device_id *matches)
> +{
> +	return NULL;
> +}
> +
>  static inline const char* of_node_full_name(struct device_node *np)
>  {
>  	return "<no-node>";
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
