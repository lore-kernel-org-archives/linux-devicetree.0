From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 06/11] staging:iio:ad7780: add chip ID values and
 mask
Date: Sat, 16 Mar 2019 18:00:42 +0000
Message-ID: <20190316180042.369d55e6@archlinux>
References: <cover.1552700652.git.renatogeh@gmail.com>
        <8154410f6c1b6cdde21cfb781dbc2088f5c91d21.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8154410f6c1b6cdde21cfb781dbc2088f5c91d21.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 23:14:27 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> The ad7780 supports both the ad778x and ad717x families. Each chip has
> a corresponding ID. This patch provides a mask for extracting ID values
> from the status bits and also macros for the correct values for the
> ad7170, ad7171, ad7780 and ad7781.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
I'll admit I find it hard to summon an enthusiasm for this patch, but
it does no harm and I don't want to delay the following ones.

Hence applied anyway.

Jonathan

> ---
> Changes in v5:
>  - Put AD7780_ID{0,1} back
> 
>  drivers/staging/iio/adc/ad7780.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
> index 94cb60c327d0..977b381c1260 100644
> --- a/drivers/staging/iio/adc/ad7780.c
> +++ b/drivers/staging/iio/adc/ad7780.c
> @@ -30,6 +30,12 @@
>  #define AD7780_ID0		BIT(3)
>  #define AD7780_GAIN		BIT(2)
>  
> +#define AD7170_ID		0
> +#define AD7171_ID		1
> +#define AD7780_ID		1
> +#define AD7781_ID		0
> +
> +#define AD7780_ID_MASK		(AD7780_ID0 | AD7780_ID1)
>  
>  #define AD7780_PATTERN_GOOD	1
>  #define AD7780_PATTERN_MASK	GENMASK(1, 0)
