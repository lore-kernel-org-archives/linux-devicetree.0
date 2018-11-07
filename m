From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Date: Tue, 6 Nov 2018 20:24:19 -0800
Message-ID: <64720b73-dddf-783c-a3a4-3f32a748bf5d@roeck-us.net>
References: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
 <20181107040010.27436-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107040010.27436-2-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh+dt@kernel.org, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/6/18 8:00 PM, Chris Packham wrote:
> With the addition of the invert-pwm property the adt7475 needs its own
> binding documentation rather being captured under trivial-devices.txt.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   .../devicetree/bindings/hwmon/adt7475.txt     | 22 +++++++++++++++++++
>   .../devicetree/bindings/trivial-devices.txt   |  4 ----
>   2 files changed, 22 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> new file mode 100644
> index 000000000000..79255439e157
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
> @@ -0,0 +1,22 @@
> +*ADT7475 hwmon sensor.
> +
> +Required properties:
> +- compatible: One of
> +	"adi,adt7473"
> +	"adi,adt7475"
> +	"adi,adt7476"
> +	"adi,adt7490"
> +
> +- reg: I2C address
> +
> +optional properties:
> +
> +- invert-pwm: This configures the PWM to use logic low for 100% duty cycle.
> +
> +Example:
> +
> +hwmon@2e {
> +	compatible = ;
> +	reg = <0x2e>;
> +	invert-pwm;

If I understand correctly, the flag is set per pwm channel. A single global
property seems inappropriate.

Guenter

> +};
> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
> index 69c934aec13b..4f29100d6bbf 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/trivial-devices.txt
> @@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in 6-Pin SOT with SMBus Alert an
>   ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProcessor-Based Systems
>   adi,adt7461		+/-1C TDM Extended Temp Range I.C
>   adt7461			+/-1C TDM Extended Temp Range I.C
> -adi,adt7473		+/-1C TDM Extended Temp Range I.C
> -adi,adt7475		+/-1C TDM Extended Temp Range I.C
> -adi,adt7476		+/-1C TDM Extended Temp Range I.C
> -adi,adt7490		+/-1C TDM Extended Temp Range I.C
>   adi,adxl345		Three-Axis Digital Accelerometer
>   adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
>   ams,iaq-core		AMS iAQ-Core VOC Sensor
> 
