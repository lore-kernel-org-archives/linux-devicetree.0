From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: fdt: Add a space to the pr_fmt string
Date: Tue, 25 Oct 2016 17:34:40 -0700
Message-ID: <580FFA20.3050100@gmail.com>
References: <1477414933-24050-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477414933-24050-1-git-send-email-fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/25/16 10:02, Fabio Estevam wrote:
> Add a space to the fdt messages so they can look a bit better:
> 
> OF: fdt: Machine model: Freescale i.MX28 Evaluation Kit
> 
> instead of
> 
> OF: fdt:Machine model: Freescale i.MX28 Evaluation Kit
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c89d5d2..9f98e43 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -9,7 +9,7 @@
>   * version 2 as published by the Free Software Foundation.
>   */
>  
> -#define pr_fmt(fmt)	"OF: fdt:" fmt
> +#define pr_fmt(fmt)	"OF: fdt: " fmt
>  
>  #include <linux/crc32.h>
>  #include <linux/kernel.h>
> 

Hi Fabio,

They say great minds think alike.  I sent this same patch just a few
days ago.  http://www.spinics.net/lists/devicetree/msg146251.html
Thanks for noticing the problem and sending a patch.

Please run scripts/getmaintainer.pl before sending patches.  You
left me off the list for your patch.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
