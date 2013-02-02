From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/11] iio/adc: (max1363) Provide OF node information
 to iio device
Date: Sat, 02 Feb 2013 10:06:24 +0000
Message-ID: <510CE520.7010308@kernel.org>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net> <1359668588-13678-6-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-6-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 09:43 PM, Guenter Roeck wrote:
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Applied to togreg branch of iio.git

A previous merge seems to have gone wrong in this driver and some
removed functions have reappeared. I'll post a patch for that in a few mins.

> ---
>  drivers/iio/adc/max1363.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index 03b25b3..ca8bbc1 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -1538,6 +1538,7 @@ static int max1363_probe(struct i2c_client *client,
>  		goto error_out;
>  	}
>  
> +	indio_dev->dev.of_node = client->dev.of_node;
>  	ret = iio_map_array_register(indio_dev, client->dev.platform_data);
>  	if (ret < 0)
>  		goto error_free_device;
> 
