From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH V3 1/2] staging: iio: add channel info for sampling frequency
Date: Thu, 12 Apr 2012 14:15:11 +0100
Message-ID: <4F86D55F.2030808@cam.ac.uk>
References: <1334234288-25037-1-git-send-email-ldewangan@nvidia.com> <1334234288-25037-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334234288-25037-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, max-U9r9yeDMy7A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/12/2012 1:38 PM, Laxman Dewangan wrote:
> Adding channel info IIO_CHAN_INFO_SAMP_FREQ to select
> different sampling frequency per channel wise.
>
> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> As per discussion on previous patch, adding channel info
> for selecting sampling freqeuncy.
To match with the existing devices can we not use the abrieviation
for the attribute naming.

Other than that, all good.
>   drivers/staging/iio/iio.h               |    5 +++++
>   drivers/staging/iio/industrialio-core.c |    1 +
>   2 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/staging/iio/iio.h b/drivers/staging/iio/iio.h
> index b9cd454..9aa0dd5 100644
> --- a/drivers/staging/iio/iio.h
> +++ b/drivers/staging/iio/iio.h
> @@ -36,6 +36,7 @@ enum iio_chan_info_enum {
>   	IIO_CHAN_INFO_QUADRATURE_CORRECTION_RAW,
>   	IIO_CHAN_INFO_AVERAGE_RAW,
>   	IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY,
> +	IIO_CHAN_INFO_SAMP_FREQ,
>   };
>
>   #define IIO_CHAN_INFO_SHARED_BIT(type) BIT(type*2)
> @@ -81,6 +82,10 @@ enum iio_chan_info_enum {
>   #define IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY_SEPARATE_BIT \
>   	IIO_CHAN_INFO_SEPARATE_BIT(			       \
>   		IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY)
> +#define IIO_CHAN_INFO_SAMP_FREQ_SEPARATE_BIT		\
> +	IIO_CHAN_INFO_SEPARATE_BIT(IIO_CHAN_INFO_SAMP_FREQ)
> +#define IIO_CHAN_INFO_SAMP_FREQ_SHARED_BIT			\
> +	IIO_CHAN_INFO_SHARED_BIT(IIO_CHAN_INFO_SAMP_FREQ)
>
>   enum iio_endian {
>   	IIO_CPU,
> diff --git a/drivers/staging/iio/industrialio-core.c b/drivers/staging/iio/industrialio-core.c
> index d303bfb..14ce6ce 100644
> --- a/drivers/staging/iio/industrialio-core.c
> +++ b/drivers/staging/iio/industrialio-core.c
> @@ -90,6 +90,7 @@ static const char * const iio_chan_info_postfix[] = {
>   	[IIO_CHAN_INFO_AVERAGE_RAW] = "mean_raw",
>   	[IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY]
>   	= "filter_low_pass_3db_frequency",
> +	[IIO_CHAN_INFO_SAMP_FREQ] = "samp_freq",
"sampling_frequency"
>   };
>
>   const struct iio_chan_spec
