Return-Path: <jic23@kernel.org>
Date: Sat, 9 Feb 2019 15:17:15 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 3/6] dt-bindings: fix incorrect bmi160 IRQ note
Message-ID: <20190209151715.676fc7df@archlinux>
In-Reply-To: <20190202215601.20275-4-martin@martingkelly.com>
References: <20190202215601.20275-1-martin@martingkelly.com>
	<20190202215601.20275-4-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat,  2 Feb 2019 13:55:58 -0800
Martin Kelly <martin@martingkelly.com> wrote:

> From: Martin Kelly <martin@martingkelly.com>
> 
> The bmi160 bindings say that the BMI160 requires level-triggered,
> active-low interrupts, but it actually supports all interrupt types, so fix
> the note to reflect that.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
I'm not sure why you changed the example, but it does no hard.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/imu/bmi160.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> index 0c1c105fb503..1aec19997fb5 100644
> --- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> @@ -9,7 +9,7 @@ Required properties:
>   - spi-max-frequency : set maximum clock frequency (only for SPI)
> 
>  Optional properties:
> - - interrupts : interrupt mapping for IRQ, must be IRQ_TYPE_LEVEL_LOW
> + - interrupts : interrupt mapping for IRQ
>   - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
>     input, set to "INT2" if INT2 pin should be used instead
> 
> @@ -20,7 +20,7 @@ bmi160@68 {
>  	reg = <0x68>;
> 
>  	interrupt-parent = <&gpio4>;
> -	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +	interrupts = <12 IRQ_TYPE_EDGE_RISING>;
>  	interrupt-names = "INT1";
>  };
> 
> --
> 2.11.0
> 
