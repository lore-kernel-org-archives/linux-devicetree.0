From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] iio:pressure:ms5611: fix oops when probing
 regulator
Date: Sat, 5 Mar 2016 14:36:08 +0000
Message-ID: <56DAEED8.2000009@kernel.org>
References: <cover.1456828051.git.gregor.boirie@parrot.com>
 <3c096730728684f1ce127602179c3ba73cd66cb4.1456828051.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3c096730728684f1ce127602179c3ba73cd66cb4.1456828051.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/03/16 10:31, Gregor Boirie wrote:
> When not compiled-in, regulator layer will return a NULL pointer when
> trying to get a reference to any regulator using devm_regulator_get().  As
> IS_ERR() does not consider this an error, the ms5611 probing operation will
> try to enable a NULL regulator, which will invariably cause a kernel
> crash.
> This patch fixes this situation by using devm_regulator_get_optional()
> instead of devm_regulator_get().
> 
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Ideally include a fixes tag with a patch like this...  It makes it easy for those
maintaining stable trees to figure out whether it is 'supposed' to apply to their
trees or not.
> ---
>  drivers/iio/pressure/ms5611_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
> index 992ad8d..a9c4d49 100644
> --- a/drivers/iio/pressure/ms5611_core.c
> +++ b/drivers/iio/pressure/ms5611_core.c
> @@ -291,8 +291,8 @@ static const struct iio_info ms5611_info = {
>  static int ms5611_init(struct iio_dev *indio_dev)
>  {
>  	int ret;
> -	struct regulator *vdd = devm_regulator_get(indio_dev->dev.parent,
> -	                                           "vdd");
> +	struct regulator *vdd =
> +		devm_regulator_get_optional(indio_dev->dev.parent, "vdd");
Shouldn't have a white space change like this in here.  This doesn't want to
get applied in a hurry unlike the below.  It'll probably be a post merge window
fix now...
>  
>  	/* Enable attached regulator if any. */
>  	if (!IS_ERR(vdd)) {
> @@ -302,6 +302,10 @@ static int ms5611_init(struct iio_dev *indio_dev)
>  			        "failed to enable Vdd supply: %d\n", ret);
>  			return ret;
>  		}
> +	} else {
> +		ret = PTR_ERR(vdd);
> +		if (ret != -ENODEV)
> +			return ret;
>  	}
>  
>  	ret = ms5611_reset(indio_dev);
> 
