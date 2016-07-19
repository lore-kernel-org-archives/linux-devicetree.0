From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff, before grep check .config file exists
Date: Tue, 19 Jul 2016 08:55:27 -0700
Message-ID: <CA+rpMbJ9yN9z=V-LKf_b1Ph9YEhLeiQhY3=gpyv9-0C_WKZgtg@mail.gmail.com>
References: <1468942925-5025-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468942925-5025-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Please ignore this patch, forgot to update the commit message and subject

On Tue, Jul 19, 2016 at 8:42 AM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> scripts/dtc/dtx_diff searches CONFIG_DTC=y in .config,
> but it doesn't checks whether the file exists or not.
>
> So, this patch adds a check for .config file.
>
> Tested script with and without .config file.
>
>>/scripts/dtc/dtx_diff test.dts
>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  scripts/dtc/dtx_diff | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> index 959ab26..ec47f95 100755
> --- a/scripts/dtc/dtx_diff
> +++ b/scripts/dtc/dtx_diff
> @@ -266,7 +266,7 @@ DTC="${__KBUILD_OUTPUT}/scripts/dtc/dtc"
>
>  if [ ! -x ${DTC} ] ; then
>         __DTC="dtc"
> -       if grep -q "^CONFIG_DTC=y" ${__KBUILD_OUTPUT}/.config ; then
> +       if grep -q "^CONFIG_DTC=y" ${__KBUILD_OUTPUT}/.config 2>/dev/null; then
>                 make_command='
>           make scripts'
>         else
> --
> 2.1.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
