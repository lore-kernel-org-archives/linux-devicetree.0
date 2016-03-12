From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/1] iio:pressure:ms5611: fix crash when probing
 regulator
Date: Sat, 12 Mar 2016 11:04:32 +0000
Message-ID: <56E3F7C0.3080408@kernel.org>
References: <cover.1457522751.git.gregor.boirie@parrot.com>
 <7767ba4decd3938eb1b37990f707b016228e0ef5.1457522751.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7767ba4decd3938eb1b37990f707b016228e0ef5.1457522751.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/03/16 11:34, Gregor Boirie wrote:
> When not compiled-in, regulator layer will return a NULL pointer when
> trying to get a reference to any regulator using devm_regulator_get().  As
> IS_ERR() does not consider this an error, the ms5611 probing operation will
> try to enable a NULL regulator, which will invariably cause a kernel
> crash.
> This patch fixes this situation by using devm_regulator_get_optional()
> instead of devm_regulator_get().
> 
> Fixes: 3145229f9191 ("iio:pressure:ms5611: power regulator support")
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>

I've been thinking a bit more about these cases and think we are missusing
the optional regulators.  If regulator support is present and a non optional
register is requested then it will feed a dummy regulator back. 
The intent of this is to handle the case where an non optional regulator is
needed, but not specified (typically because it is always on).

So the question is how should we handle the regulators not built in case.
If you do call devm_regulator_get you'll get a null pointer.
Without regulators built in regulator_enable will be fine (returns 0)
as does regulator disable.

So I'm unclear on where the crash is coming from.

Also interesting is this driver enables the regulator but never disables
it (which it should).   I was clearly half asleep when reviewing this.
Sorry!

Jonathan


> ---
>  drivers/iio/pressure/ms5611_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
> index 37dbc04..a2a871b 100644
> --- a/drivers/iio/pressure/ms5611_core.c
> +++ b/drivers/iio/pressure/ms5611_core.c
> @@ -387,8 +387,8 @@ static const struct iio_info ms5611_info = {
>  static int ms5611_init(struct iio_dev *indio_dev)
>  {
>  	int ret;
> -	struct regulator *vdd = devm_regulator_get(indio_dev->dev.parent,
> -	                                           "vdd");
> +	struct regulator *vdd =
> +		devm_regulator_get_optional(indio_dev->dev.parent, "vdd");
>  
>  	/* Enable attached regulator if any. */
>  	if (!IS_ERR(vdd)) {
> @@ -398,6 +398,10 @@ static int ms5611_init(struct iio_dev *indio_dev)
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
