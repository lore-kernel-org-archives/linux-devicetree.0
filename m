From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: gyro: bmg160: add device tree compatibility
 table
Date: Sun, 24 Mar 2019 18:05:03 +0000
Message-ID: <20190324180503.6dc1e36e@archlinux>
References: <cover.1552922054.git.hns@goldelico.com>
        <090c92487ada60e81fca341ef24e5de33a11ec4b.1552922054.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <090c92487ada60e81fca341ef24e5de33a11ec4b.1552922054.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Mon, 18 Mar 2019 16:14:14 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Add of_match_table.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
I'm not against doing this, but do note that there is still a back up
path in which the i2c_device_id table is used to match but without
the vendor part of the string.

I theory the plan is to eventually remove that, but it's not the
case that this driver could not be probed from devicetree previously.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/gyro/bmg160_i2c.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iio/gyro/bmg160_i2c.c b/drivers/iio/gyro/bmg160_i2c.c
> index 90126a5a7663..934a092134f0 100644
> --- a/drivers/iio/gyro/bmg160_i2c.c
> +++ b/drivers/iio/gyro/bmg160_i2c.c
> @@ -54,10 +54,19 @@ static const struct i2c_device_id bmg160_i2c_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, bmg160_i2c_id);
>  
> +static const struct of_device_id bmg160_of_match[] = {
> +	{ .compatible = "bosch,bmg160" },
> +	{ .compatible = "bosch,bmi055_gyro" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, bmg160_of_match);
> +
>  static struct i2c_driver bmg160_i2c_driver = {
>  	.driver = {
>  		.name	= "bmg160_i2c",
>  		.acpi_match_table = ACPI_PTR(bmg160_acpi_match),
> +		.of_match_table = bmg160_of_match,
>  		.pm	= &bmg160_pm_ops,
>  	},
>  	.probe		= bmg160_i2c_probe,
