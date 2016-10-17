From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] Add missing space at end of pr_fmt().
Date: Mon, 17 Oct 2016 10:04:21 -0700
Message-ID: <1476723861.4414.1.camel@perches.com>
References: <1476717010-3580-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476717010-3580-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-10-17 at 08:10 -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> 
> Make pr_fmt() in fdt.c consistent with all other files in drivers/of/

Hi Frank.

Patches should use the subsystem as a subject prefix to make
the subsystem more obvious when using "git log".

This email subject could be something like:

"Subject: [PATCH] of: fdt: Add missing space at end of pr_fmt()"

Please check the git log to see examples for drivers/of/fdt.c
and pick the prefix style you think appropriate.

> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c89d5d231a0e..9f98e437e1f1 100644
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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
