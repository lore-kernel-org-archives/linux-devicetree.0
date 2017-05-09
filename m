From: "Jingoo Han" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 1/3] DT add arctic to vendor prefix for ArcticSand
Date: Tue, 9 May 2017 12:00:15 -0400
Message-ID: <000001d2c8dd$5a4848e0$0ed8daa0$@gmail.com>
References: <1494334204-24633-1-git-send-email-olimpiu@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494334204-24633-1-git-send-email-olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Olimpiu Dejeu' <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bdodge-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, May 9, 2017 8:50 AM, Olimpiu Dejeu wrote:
> 
> dt-bindings: vendor-prefixes: add arctic to vendor prefix
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>

I cannot find any reason to reject this patch.

Reviewed-by: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Best regards,
Jingoo Han

> ---
> v9 => v10:
> - (Re-submit) Per Rob Herring's request changed vendor-prefix to arctic
> v8 => v9:
> - Version updated to match other patch in set. No other changes.
> v8:
> - Version to match other patches in set
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e..6f33a4b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -28,6 +28,7 @@ andestech	Andes Technology Corporation
>  apm	Applied Micro Circuits Corporation (APM)
>  aptina	Aptina Imaging
>  arasan	Arasan Chip Systems
> +arctic	Arctic Sand
>  aries	Aries Embedded GmbH
>  arm	ARM Ltd.
>  armadeus	ARMadeus Systems SARL
> --
> 2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
