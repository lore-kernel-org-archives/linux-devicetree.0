From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/3] dt-bindings: hwmon: Add tachometer interrupt to
 pwm-fan
Date: Thu, 28 Mar 2019 13:01:59 -0500
Message-ID: <20190328180159.GA29107@bogus>
References: <1553243043-19486-1-git-send-email-stefan.wahren@i2se.com>
 <1553243043-19486-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553243043-19486-2-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 09:24:01AM +0100, Stefan Wahren wrote:
> This adds the tachometer interrupt to the pwm-fan binding, which is
> necessary for RPM support.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  .../devicetree/bindings/hwmon/pwm-fan.txt          | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> index 49ca5d8..722005f 100644
> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
> @@ -7,7 +7,16 @@ Required properties:
>  			which correspond to thermal cooling states
>  
>  Optional properties:
> -- fan-supply    : phandle to the regulator that provides power to the fan
> +- fan-supply		: phandle to the regulator that provides power to the fan
> +- interrupts		: This contains a single interrupt specifier which
> +			  describes the tachometer output of the fan as an
> +			  interrupt source. The output signal must generate a
> +			  defined number of interrupts per fan revolution, which
> +			  require that it must be self resetting edge interrupts.
> +			  See interrupt-controller/interrupts.txt for the format.
> +- pulses-per-revolution : define the tachometer pulses per fan revolution as
> +			  an integer (default is 2 interrupts per revolution).
> +			  The value must be greater than zero.
>  
>  Example:
>  	fan0: pwm-fan {
> @@ -38,3 +47,14 @@ Example:
>  					};
>  			     };
>  		};
> +
> +Example 2:
> +	fan0: pwm-fan {
> +		fan0: pwm-fan {

This line should go.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +		compatible = "pwm-fan";
> +		pwms = <&pwm 0 40000 0>;
> +		fan-supply = <&reg_fan>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		pulses-per-revolution = <2>;
> +	};
> -- 
> 2.7.4
> 
