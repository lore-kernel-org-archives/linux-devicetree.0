From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add entry for plantower pms7003 driver
Date: Sun, 14 Jul 2019 12:36:40 +0100
Message-ID: <20190714123640.7c21034c@archlinux>
References: <20190710192155.11489-1-tduszyns@gmail.com>
        <20190710192155.11489-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710192155.11489-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 10 Jul 2019 21:21:55 +0200
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add myself as a plantower pms7003 driver maintainer.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied,

Thanks,

Jonathan

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad498428b38c..771de33ef737 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12548,6 +12548,12 @@ F:	drivers/i2c/busses/i2c-puv3.c
>  F:	drivers/video/fbdev/fb-puv3.c
>  F:	drivers/rtc/rtc-puv3.c
>  
> +PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
> +M:	Tomasz Duszynski <tduszyns@gmail.com>
> +S:	Maintained
> +F:	drivers/iio/chemical/pms7003.c
> +F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
> +
>  PMBUS HARDWARE MONITORING DRIVERS
>  M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-hwmon@vger.kernel.org
