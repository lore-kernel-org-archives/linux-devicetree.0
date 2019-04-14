Return-Path: <jic23@kernel.org>
Date: Sun, 14 Apr 2019 14:40:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 6/6] MAINTAINERS: add entry for fxas21002c gyro
 driver
Message-ID: <20190414144014.34cb5d6b@archlinux>
In-Reply-To: <20190412164901.2321-7-rui.silva@linaro.org>
References: <20190412164901.2321-1-rui.silva@linaro.org>
	<20190412164901.2321-7-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 12 Apr 2019 17:49:01 +0100
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Add me as maintainer of the nxp fxas21002c gyroscope driver.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Applied.

Thanks,

Jonathan
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3671fdea5010..f770f5124f4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11117,6 +11117,16 @@ F:	Documentation/ABI/stable/sysfs-bus-nvmem
>  F:	include/linux/nvmem-consumer.h
>  F:	include/linux/nvmem-provider.h
>  
> +NXP FXAS21002C DRIVER
> +M:	Rui Miguel Silva <rmfrfs@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/gyroscope/fxas21002c.txt
> +F:	drivers/iio/gyro/fxas21002c_core.c
> +F:	drivers/iio/gyro/fxas21002c.h
> +F:	drivers/iio/gyro/fxas21002c_i2c.c
> +F:	drivers/iio/gyro/fxas21002c_spi.c
> +
>  NXP SGTL5000 DRIVER
>  M:	Fabio Estevam <festevam@gmail.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
