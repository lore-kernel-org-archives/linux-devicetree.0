From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
Date: Fri, 9 Sep 2016 14:47:37 +0300
Message-ID: <9b18bc0e-3447-6ab2-3c28-54e54a19dc6f@cogentembedded.com>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473421394-9745-8-git-send-email-bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, h-inayoshi-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, nv-dung-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/9/2016 2:43 PM, bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org wrote:

> From: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
>
> Modify CMT config to support 64bit
>
> Signed-off-by: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
> ---
>  drivers/clocksource/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 5677886..62c2bcb 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -408,7 +408,7 @@ config SYS_SUPPORTS_EM_STI
>          bool
>
>  config SH_TIMER_CMT
> -	bool "Renesas CMT timer driver" if COMPILE_TEST
> +	bool "Renesas CMT timer driver" if ( ARM64 || COMPILE_TEST )

    Parens not needed and the spaces after/before them even less so.

[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
