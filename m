From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dtx_diff, before grep check .config file
 exists
Date: Tue, 19 Jul 2016 05:07:31 -0700
Message-ID: <578E1803.2070400@gmail.com>
References: <1468917183-6801-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468917183-6801-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/19/16 01:33, Gaurav Minocha wrote:
> scripts/dtc/dtx_diff searches CONFIG_DTC=y in .config,
> but it doesn't checks whether the file exists or not.
> 
> So, this patch adds a check for .config file.
> 
> Tested script with and without .config file.
> 
>> /scripts/dtc/dtx_diff test.dts
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  scripts/dtc/dtx_diff | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> index 959ab26..1c76dcd 100755
> --- a/scripts/dtc/dtx_diff
> +++ b/scripts/dtc/dtx_diff
> @@ -266,7 +266,8 @@ DTC="${__KBUILD_OUTPUT}/scripts/dtc/dtc"
>  
>  if [ ! -x ${DTC} ] ; then
>  	__DTC="dtc"
> -	if grep -q "^CONFIG_DTC=y" ${__KBUILD_OUTPUT}/.config ; then
> +	if [ -f "${__KBUILD_OUTPUT}/.config" ] && \
> +		grep -q "^CONFIG_DTC=y" ${__KBUILD_OUTPUT}/.config ; then
>  		make_command='
>           make scripts'
>  	else
> 

Hi Gaurav,

Thanks for chasing that down.

Instead of checking for the existance of .config, can you just redirect
stderr from the grep to /dev/null and make sure that works?

You can add my acked-by if that passes your testing.

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
