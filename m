Return-Path: <jic23@kernel.org>
Date: Sat, 19 Jan 2019 17:24:47 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings:bmi160: add "BOTH" int pin type
Message-ID: <20190119172447.4536fc00@archlinux>
In-Reply-To: <20190114035621.5252-5-martin@martingkelly.com>
References: <20190114035621.5252-1-martin@martingkelly.com>
	<20190114035621.5252-5-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, 13 Jan 2019 19:56:20 -0800
Martin Kelly <martin@martingkelly.com> wrote:

> From: Martin Kelly <martin@martingkelly.com>
> 
> The bindings currently allow for interrupts routing to INT1 or INT2, but
> the hardware allows for routing to both, so add "BOTH" as an int pin entry.
> 

DT binding changes should be sent to the dt list as well as Rob.

> Signed-off-by: Martin Kelly <martin@martingkelly.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/bmi160.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> index 1aec19997fb5..a56d377dabf3 100644
> --- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
> @@ -11,7 +11,8 @@ Required properties:
>  Optional properties:
>   - interrupts : interrupt mapping for IRQ
>   - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
> -   input, set to "INT2" if INT2 pin should be used instead
> +   input, set to "INT2" if INT2 pin should be used instead, set to "BOTH" if
> +   both should be used.
>  
>  Examples:
>  
> @@ -33,3 +34,13 @@ bmi160@0 {
>  	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
>  	interrupt-names = "INT2";
>  };
> +
> +bmi160@0 {
> +	compatible = "bosch,bmi160";
> +	reg = <0>;
> +	spi-max-frequency = <10000000>;
> +
> +	interrupt-parent = <&gpio2>;
> +	interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names = "BOTH";

Just have two entries, not BOTH.  Routing both internal interrupts to the
same pin on the host doesn't make any sense, so we should only see both
along with a pair of entries for the interrupts.

Jonathan
> +};
