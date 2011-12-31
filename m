From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] staging:iio: isl29018: add of_match table for device-tree
 probing
Date: Sat, 31 Dec 2011 18:42:17 +0000
Message-ID: <4EFF5789.3060602@kernel.org>
References: <1324608283-3128-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324608283-3128-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/23/2011 02:44 AM, Olof Johansson wrote:
> As simple as can be right now; just one ID and no custom properties to parse.
Looks fine to me, but I'm not familiar with device tree naming
convensions so wouldn't mind a 'yes, that's right' from someone who
is!
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/staging/iio/light/isl29018.c |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
> index 849d6a5..38ec52b 100644
> --- a/drivers/staging/iio/light/isl29018.c
> +++ b/drivers/staging/iio/light/isl29018.c
> @@ -592,11 +592,18 @@ static const struct i2c_device_id isl29018_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, isl29018_id);
>  
> +static const struct of_device_id isl29018_of_match[] = {
> +	{ .compatible = "invn,isl29018", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, isl29018_of_match);
> +
>  static struct i2c_driver isl29018_driver = {
>  	.class	= I2C_CLASS_HWMON,
>  	.driver	 = {
>  			.name = "isl29018",
>  			.owner = THIS_MODULE,
> +			.of_match_table = isl29018_of_match,
>  		    },
>  	.probe	 = isl29018_probe,
>  	.remove	 = __devexit_p(isl29018_remove),
