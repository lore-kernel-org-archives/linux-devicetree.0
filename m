From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 03/11] staging: iio: ad7780: add gain reading to ad778x
Date: Sat, 16 Mar 2019 17:54:23 +0000
Message-ID: <20190316175423.26481b43@archlinux>
References: <cover.1552700652.git.renatogeh@gmail.com>
 <aed4d900061c5733decc429d0d0816122dba0991.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <aed4d900061c5733decc429d0d0816122dba0991.1552700652.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: mark.rutland@arm.com, devel@driverdev.osuosl.org, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, robh+dt@kernel.org, giuliano.belinassi@usp.br, stefan.popa@analog.com, knaack.h@gmx.de, alexandru.Ardelean@analog.com
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 23:13:13 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> This patch adds a new functionality of reading gain values from the
> ad778x chips. This value is stored in the chip's state struct and is
> updated whenever a read or write call is performed on the driver.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>

Applied, thanks

> ---
>  drivers/staging/iio/adc/ad7780.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
> index f4cd7bc3e02f..fbcc0d3345ca 100644
> --- a/drivers/staging/iio/adc/ad7780.c
> +++ b/drivers/staging/iio/adc/ad7780.c
> @@ -42,6 +42,8 @@
>  #define AD7780_GAIN_MIDPOINT	64
>  #define AD7780_FILTER_MIDPOINT	13350
>  
> +static const unsigned int ad778x_gain[2] = { 1, 128 };
> +
>  struct ad7780_chip_info {
>  	struct iio_chan_spec	channel;
>  	unsigned int		pattern_mask;
> @@ -179,6 +181,9 @@ static int ad7780_postprocess_sample(struct ad_sigma_delta *sigma_delta,
>  	    ((raw_sample & chip_info->pattern_mask) != chip_info->pattern))
>  		return -EIO;
>  
> +	if (chip_info->is_ad778x)
> +		st->gain = ad778x_gain[raw_sample & AD7780_GAIN];
> +
>  	return 0;
>  }
>  
