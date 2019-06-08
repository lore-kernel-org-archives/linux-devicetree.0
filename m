From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/2] MAINTAINERS: add entry for ad7780 adc driver
Date: Sat, 8 Jun 2019 12:20:22 +0100
Message-ID: <20190608122000.46440386@archlinux>
References: <cover.1558746978.git.renatogeh@gmail.com>
        <7ccb64ba4da8f24981009187e975d71372d62fbf.1558746978.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ccb64ba4da8f24981009187e975d71372d62fbf.1558746978.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 May 2019 22:26:55 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> This patch adds a MAINTAINERS entry for the AD7780 ADC driver.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing
to be completely ignored by the autobuilders.

Thanks,

Jonathan

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54c8e14fae98..d12685c5b09a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -880,6 +880,15 @@ S:	Supported
>  F:	drivers/iio/adc/ad7768-1.c
>  F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
>  
> +ANALOG DEVICES INC AD7780 DRIVER
> +M:	Michael Hennerich <Michael.Hennerich@analog.com>
> +M:	Renato Lui Geh <renatogeh@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +W:	http://ez.analog.com/community/linux-device-drivers
> +S:	Supported
> +F:	drivers/iio/adc/ad7780.c
> +F:	Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
> +
>  ANALOG DEVICES INC AD9389B DRIVER
>  M:	Hans Verkuil <hans.verkuil@cisco.com>
>  L:	linux-media@vger.kernel.org
