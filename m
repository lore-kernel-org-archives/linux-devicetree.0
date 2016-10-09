From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V2 PATCH 03/12] msm8994 clocks: fix mapping
Date: Sat, 8 Oct 2016 20:28:53 -0500
Message-ID: <20161009012853.GI18158@rob-hp-laptop>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475375919-618-4-git-send-email-jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 07:38:30PM -0700, Jeremy McNicoll wrote:
> The paren_map is used for looking up which value to write into
> and the cmd_rcgr is for configuring the parent muxing so a change
>  2 to 5 means that the 3rd parent should be mux #5 rather than #2.
> 
> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/qcom/gcc-msm8994.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be squashed.

> 
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
> index 3897cfd..39b40d4 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -50,7 +50,7 @@ static const char * const gcc_xo_gpll0[] = {
>  static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 1 },
> -	{ P_GPLL4, 2 },
> +	{ P_GPLL4, 5 },
>  };
>  
>  static const char * const gcc_xo_gpll0_gpll4[] = {
> -- 
> 2.6.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
