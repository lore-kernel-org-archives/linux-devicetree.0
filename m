From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 PATCH 08/14] iio: iio_magn: Add event ops
Date: Tue, 01 Oct 2013 17:21:06 +0100
Message-ID: <524AF672.6000805@kernel.org>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com> <1380299538-22047-9-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380299538-22047-9-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/27/13 17:32, Lukasz Czerwinski wrote:
> Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Why?  The won't be used by the drivers as none have had the support
added to any of the parts yet.

Hopefully Denis, or someone else with access to a lot of parts
will do some of them (or at least test them for someone else).

> ---
>  drivers/iio/magnetometer/st_magn_core.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/magnetometer/st_magn_core.c b/drivers/iio/magnetometer/st_magn_core.c
> index 4460075..1e212ad 100644
> --- a/drivers/iio/magnetometer/st_magn_core.c
> +++ b/drivers/iio/magnetometer/st_magn_core.c
> @@ -343,6 +343,10 @@ static const struct iio_info magn_info = {
>  	.attrs = &st_magn_attribute_group,
>  	.read_raw = &st_magn_read_raw,
>  	.write_raw = &st_magn_write_raw,
> +	.read_event_value = &st_sensors_read_event_value,
> +	.write_event_value = &st_sensors_write_event_value,
> +	.read_event_config = &st_sensors_read_event_config,
> +	.write_event_config = &st_sensors_write_event_config,
>  };
>  
>  int st_magn_common_probe(struct iio_dev *indio_dev)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
