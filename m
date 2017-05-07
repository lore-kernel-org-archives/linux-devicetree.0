From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 1/3] iio: adc: meson-saradc: mark all
 meson_sar_adc_data static and const
Date: Sun, 7 May 2017 12:35:07 +0100
Message-ID: <a1cd9503-9231-40e1-2189-a7692531f604@kernel.org>
References: <20170506134929.31190-1-martin.blumenstingl@googlemail.com>
 <20170506134929.31190-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170506134929.31190-2-martin.blumenstingl@googlemail.com>
Content-Language: en-GH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, thomas.langer@intel.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06/05/17 14:49, Martin Blumenstingl wrote:
> These are only passed as of_device_id.data and never modified. Thus we
> can mark them as static const, just like the of_device_id instances
> where they are used.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Good catch indeed on those consts!

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/meson_saradc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index dd4190b50df6..2f6fec995264 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -834,17 +834,17 @@ static const struct iio_info meson_sar_adc_iio_info = {
>  	.driver_module = THIS_MODULE,
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
>  	.resolution = 10,
>  	.name = "meson-gxbb-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxl_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
>  	.resolution = 12,
>  	.name = "meson-gxl-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxm_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>  	.resolution = 12,
>  	.name = "meson-gxm-saradc",
>  };
> 
