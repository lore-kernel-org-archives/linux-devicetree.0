From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/11] iio/adc: (max1363) Remove duplicate code
Date: Sat, 02 Feb 2013 10:07:39 +0000
Message-ID: <510CE56B.9090902@kernel.org>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net> <1359668588-13678-7-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-7-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 09:43 PM, Guenter Roeck wrote:
> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Applied to togreg branch of iio.git
> ---
>  drivers/iio/adc/max1363.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index ca8bbc1..2c773b4 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -1572,8 +1572,6 @@ static int max1363_probe(struct i2c_client *client,
>  	indio_dev->num_channels = st->chip_info->num_channels;
>  	indio_dev->info = st->chip_info->info;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
> -	indio_dev->channels = st->chip_info->channels;
> -	indio_dev->num_channels = st->chip_info->num_channels;
>  	ret = max1363_initial_setup(st);
>  	if (ret < 0)
>  		goto error_free_available_scan_masks;
> 
