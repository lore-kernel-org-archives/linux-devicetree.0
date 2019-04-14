Return-Path: <jic23@kernel.org>
Date: Sun, 14 Apr 2019 11:04:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor
 device binding
Message-ID: <20190414110441.1e58f58c@archlinux>
In-Reply-To: <20190411001209.29488-2-rjones@gateworks.com>
References: <20190305203252.13647-1-rjones@gateworks.com>
	<20190411001209.29488-1-rjones@gateworks.com>
	<20190411001209.29488-2-rjones@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Robert Jones <rjones@gateworks.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
List-ID: <devicetree@vger.kernel.org>

On Wed, 10 Apr 2019 17:12:08 -0700
Robert Jones <rjones@gateworks.com> wrote:

> Signed-off-by: Robert Jones <rjones@gateworks.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
> index 52ee4ba..0ef64a4 100644
> --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> @@ -49,6 +49,7 @@ Accelerometers:
>  - st,lis2dw12
>  - st,lis3dhh
>  - st,lis3de
> +- st,lis2de12
>  
>  Gyroscopes:
>  - st,l3g4200d-gyro
