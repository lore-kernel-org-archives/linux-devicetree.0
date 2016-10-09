From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V2 PATCH 04/12] dt-bindings: qcom: Add msm8992 bindings
Date: Sat, 8 Oct 2016 20:28:47 -0500
Message-ID: <20161009012847.GG18158@rob-hp-laptop>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-5-git-send-email-jmcnicol@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475375919-618-5-git-send-email-jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 01, 2016 at 07:38:31PM -0700, Jeremy McNicoll wrote:
> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
> index 3e24518..fc5d5ee 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.txt
> +++ b/Documentation/devicetree/bindings/arm/qcom.txt
> @@ -22,6 +22,7 @@ The 'SoC' element must be one of the following strings:
>  	msm8916
>  	msm8974
>  	msm8996
> +	msm8992

What about 8994 and 8994v2?

>  
>  The 'board' element must be one of the following strings:
>  
> -- 
> 2.6.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
