From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] sh-pfc: add macro to define pinmux without function
Date: Thu, 22 Jan 2015 23:50:41 +0200
Message-ID: <1580306.72ms5WNCEt@avalon>
References: <1421583604-27256-1-git-send-email-niso@kth.se> <1421583604-27256-2-git-send-email-niso@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421583604-27256-2-git-send-email-niso-UNjuZkX4dYU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niso-UNjuZkX4dYU@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Sunday 18 January 2015 13:20:01 Niklas S=F6derlund wrote:
> Used to define pinmux configurations where the pinmux function have n=
o
> representation in the configuration registers but instead solely depe=
nds
> on a group selection.
>=20
> Signed-off-by: Niklas S=F6derlund <niso-UNjuZkX4dYU@public.gmane.org>

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h
> b/drivers/pinctrl/sh-pfc/sh_pfc.h index 5b72831..c837286 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -167,6 +167,8 @@ struct sh_pfc_soc_info {
>  	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ipsr)
>  #define PINMUX_IPSR_NOGM(ispr, fn, ms)					\
>  	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ms)
> +#define PINMUX_IPSR_NOFN(ipsr, fn, ms)					\
> +	PINMUX_DATA(fn##_MARK, FN_##ipsr, FN_##ms)
>  #define PINMUX_IPSR_MSEL(ipsr, fn, ms)					\
>  	PINMUX_DATA(fn##_MARK, FN_##fn, FN_##ipsr, FN_##ms)
>  #define PINMUX_IPSR_MODSEL_DATA(ipsr, fn, ms)				\

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
