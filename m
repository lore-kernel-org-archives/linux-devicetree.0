From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] staging: iio: light: isl29018: fix typo
Date: Sat, 30 Aug 2014 11:03:00 +0100
Message-ID: <5401A154.8020102@kernel.org>
References: <1409322382-30021-1-git-send-email-laurentiu.palcu@intel.com> <1409322382-30021-2-git-send-email-laurentiu.palcu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409322382-30021-2-git-send-email-laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Teodora Baluta <teodora.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/08/14 15:26, Laurentiu Palcu wrote:
> isl29108 was used, instead of isl29018.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as testing for the
autobuilders to play.

Thanks,

Jonathan
> ---
>  drivers/staging/iio/light/isl29018.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
> index 86cc8f9..63c70be 100644
> --- a/drivers/staging/iio/light/isl29018.c
> +++ b/drivers/staging/iio/light/isl29018.c
> @@ -447,7 +447,7 @@ static struct attribute *isl29018_attributes[] = {
>  	NULL
>  };
>  
> -static const struct attribute_group isl29108_group = {
> +static const struct attribute_group isl29018_group = {
>  	.attrs = isl29018_attributes,
>  };
>  
> @@ -510,8 +510,8 @@ static int isl29018_chip_init(struct isl29018_chip *chip)
>  	return 0;
>  }
>  
> -static const struct iio_info isl29108_info = {
> -	.attrs = &isl29108_group,
> +static const struct iio_info isl29018_info = {
> +	.attrs = &isl29018_group,
>  	.driver_module = THIS_MODULE,
>  	.read_raw = &isl29018_read_raw,
>  	.write_raw = &isl29018_write_raw,
> @@ -579,7 +579,7 @@ static int isl29018_probe(struct i2c_client *client,
>  	if (err)
>  		return err;
>  
> -	indio_dev->info = &isl29108_info;
> +	indio_dev->info = &isl29018_info;
>  	indio_dev->channels = isl29018_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(isl29018_channels);
>  	indio_dev->name = id->name;
> 
