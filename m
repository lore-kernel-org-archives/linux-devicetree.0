From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add Garmin vendor prefix
Date: Tue, 17 Jan 2017 02:07:56 +0100
Message-ID: <06f2cde2-ac7e-d0e5-5e35-a4946d0398f8@gmail.com>
References: <20161229051306.28547-1-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161229051306.28547-1-matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/29/2016 06:13 AM, Matt Ranostay wrote:

Some commit message / description of the company would be useful.

> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
> ---
> Changes from v1:
> * switch to stock ticker for Garmin Limited
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e7f5d1..5749bfc5fc5b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -107,6 +107,7 @@ firefly	Firefly
>  focaltech	FocalTech Systems Co.,Ltd
>  friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
>  fsl	Freescale Semiconductor
> +grmn	Garmin Limited

Why grmn ? Why not 'garmin' ? Also, the rest uses Ltd. , so make it
consistent ?

>  ge	General Electric Company
>  geekbuying	GeekBuying
>  gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
