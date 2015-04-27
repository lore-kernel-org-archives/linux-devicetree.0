From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] misc: ti-st: don't use NULL pdata
Date: Mon, 27 Apr 2015 11:52:43 +0300
Message-ID: <20150427085242.GM16501@mwanda>
References: <1430000118-26386-1-git-send-email-eric.nelson@boundarydevices.com>
 <1430000118-26386-3-git-send-email-eric.nelson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430000118-26386-3-git-send-email-eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, der.herr-kA1LtwSENNE@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bvijay-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eyalr-l0cyMroinI0@public.gmane.org, robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 25, 2015 at 03:15:17PM -0700, Eric Nelson wrote:
> Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> ---
>  drivers/misc/ti-st/st_kim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
> index c5a0e15..4b44345 100644
> --- a/drivers/misc/ti-st/st_kim.c
> +++ b/drivers/misc/ti-st/st_kim.c
> @@ -755,8 +755,10 @@ static struct ti_st_plat_data *get_platform_data(struct device *dev)
>  
>  	dt_pdata = kzalloc(sizeof(*dt_pdata), GFP_KERNEL);
>  
> -	if (!dt_pdata)
> +	if (!dt_pdata) {
>  		pr_err("Can't allocate device_tree platform data\n");
> +		return 0;

		return NULL;

Zero means success.  You can delete the error message if you want.
That's just a waste of memory.  1) It's never going to be printed.
2)  If this particular allocation failed then we would be able to tell
exactly what failed from the stack dump and from the message in the
caller function.

> +	}

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
