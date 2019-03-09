From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/3] iio: accel: kxcjk1013: Add device tree support
Date: Sat, 9 Mar 2019 18:16:49 +0000
Message-ID: <20190309181649.228507de@archlinux>
References: <20190304151912.11485-1-decatf@gmail.com>
        <20190304151912.11485-4-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304151912.11485-4-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Yang <decatf@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 10:19:12 -0500
Robert Yang <decatf@gmail.com> wrote:

> Add device tree support for kxcjk-1013 accelerometer sensors.
> 
> Signed-off-by: Robert Yang <decatf@gmail.com>
One comment below. 

Applied with that minor tweak to the togreg branch of iio.git
and pushed out as testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/accel/kxcjk-1013.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
> index 7096e577b23f..e4cbc443e6ed 100644
> --- a/drivers/iio/accel/kxcjk-1013.c
> +++ b/drivers/iio/accel/kxcjk-1013.c
> @@ -1510,10 +1510,20 @@ static const struct i2c_device_id kxcjk1013_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);
>  
> +static const struct of_device_id kxcjk1013_of_match[] = {
> +	{ .compatible = "kionix,kxcjk1013", },
> +	{ .compatible = "kionix,kxcj91008", },
> +	{ .compatible = "kionix,kxtj21009", },
> +	{ .compatible = "kionix,kxtf9", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, kxcjk1013_of_match);
> +
>  static struct i2c_driver kxcjk1013_driver = {
>  	.driver = {
>  		.name	= KXCJK1013_DRV_NAME,
>  		.acpi_match_table = ACPI_PTR(kx_acpi_match),
> +		.of_match_table = of_match_ptr(kxcjk1013_of_match),
Sorry. I'd missed this before, but general preference is to not
use of_match_table any more because it stops people using the
somewhat odd ACPI object that lets you used dt bindings
via ACPI.

I'll drop it.

>  		.pm	= &kxcjk1013_pm_ops,
>  	},
>  	.probe		= kxcjk1013_probe,
