From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] staging:iio: ak8975: add of_match table for device-tree
 probing
Date: Sat, 31 Dec 2011 18:43:33 +0000
Message-ID: <4EFF57D5.8010904@kernel.org>
References: <1324608402-3241-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324608402-3241-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/23/2011 02:46 AM, Olof Johansson wrote:
> Just like isl29018; trivial addition. Using both asahi-kasei,ak8975 and
> the non-prefixed version (I couldn't figure out if Asahi Kasei had a
> stock symbol to use, I only found numerical indexes for their stock info).
Again, fine by me but a confirmation from someone more device tree
oriented would be great as well.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/staging/iio/magnetometer/ak8975.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
> index 3158f12..d5ddac3 100644
> --- a/drivers/staging/iio/magnetometer/ak8975.c
> +++ b/drivers/staging/iio/magnetometer/ak8975.c
> @@ -564,9 +564,17 @@ static const struct i2c_device_id ak8975_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, ak8975_id);
>  
> +static const struct of_device_id ak8975_of_match[] = {
> +	{ .compatible = "asahi-kasei,ak8975", },
> +	{ .compatible = "ak8975", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ak8975_of_match);
> +
>  static struct i2c_driver ak8975_driver = {
>  	.driver = {
>  		.name	= "ak8975",
> +		.of_match_table = ak8975_of_match,
>  	},
>  	.probe		= ak8975_probe,
>  	.remove		= __devexit_p(ak8975_remove),
