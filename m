From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: add maintainer for maxbotix
 ultrasonic driver
Date: Sun, 24 Mar 2019 12:08:22 +0000
Message-ID: <20190324120822.3afdd2e4@archlinux>
References: <20190317203827.ocgsj24itlqzqjvc@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190317203827.ocgsj24itlqzqjvc@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

On Sun, 17 Mar 2019 21:38:29 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> add a maintainer for the newly created ultrasonic driver family of maxbotix
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Applied.

Thanks,

Jonathan

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dce5c099f43c..fa054f8cc7fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9234,6 +9234,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/max9860.txt
>  F:	sound/soc/codecs/max9860.*
>  
> +MAXBOTIX ULTRASONIC RANGER IIO DRIVER
> +M:	Andreas Klinger <ak@it-klinger.de>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
> +F:	drivers/iio/proximity/mb1232.c
> +
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>  M:	Javier Martinez Canillas <javier@dowhile0.org>
>  L:	linux-kernel@vger.kernel.org
