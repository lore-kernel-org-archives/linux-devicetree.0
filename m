From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8] Documentation: add Device tree bindings for
 hwmon/nct7802
Date: Thu, 12 Nov 2015 11:26:58 -0600
Message-ID: <20151112172658.GA27337@rob-hp-laptop>
References: <1445891057-1554-1-git-send-email-const@makelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445891057-1554-1-git-send-email-const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 10:24:17PM +0200, Constantine Shulyupin wrote:
> From: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
> 
> Introduced subnodes sensor, fan and peci with properties.
> 
> Signed-off-by: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
> ---
> Changed in v8:
> - added senor type "local"
> - Compatible nodes converted to senor types "vcore", "vcc"
> 
> Changed in v7:
> - sensors type (thermistor, thermistor, voltage) and pwm type
> selected with type property instead of compatible property.
> 
> Changed in v6:
> - Removed previous definition.
> - Introduced subnodes sensor, fan and peci with properties.
> 
> Changed in v5:
> - Fixed typos
> 
> Changed in v4:
> - Removed registers initialization by names
> - Added properties nuvoton,sensor*-type
> 
> Changed in v3:
> - Fixed vendor prefix
> - Added short registers description,
>   full registers description is available at
> https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/
> 
> Changed in v2:
> - Removed nct7802,reg-init
> - Added registers initialization by names
> 
> Introduced in v1:
>  - nct7802,reg-init
> ---
>  .../devicetree/bindings/hwmon/nct7802.txt          | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> new file mode 100644
> index 0000000..8647783
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> @@ -0,0 +1,102 @@
> +Nuvoton NCT7802Y Hardware Monitoring IC
> +
> +Required node properties:
> +
> + - "compatible": must be "nuvoton,nct7802"
> + - "reg": I2C bus address of the device
> + - #address-cells=<1>;
> + - #size-cells=<0>;
> +
> +Optional subnodes:
> +
> +Sensor subnodes properties:
> + - "compatible", allowed values:
> +	 - "nuvoton,nct7802"

This should have -sensor appended?

> + - "sensor-type", allowed values:
> +	"thermal-diode"
> +	"thermistor"
> +	"voltage"
> +	"local"
> +	"vcore"
> +	"vcc"

These are different connections to the same h/w block in the chip? If 
so, then this is fine. If the h/w blocks are different, then it would be 
better to go back to different compatible strings.

> +For sensors of types "thermal-diode", "thermistor" and "voltage" required
> + - "reg": index in range 0 .. 2
> +
> +Except sensor at address 2 can't be "thermal-diode".
> +
> +Fan subnode:
> +
> +Required properties:
> + - "reg" :index of in range 0 .. 2.

What does the numbering correspond to in the h/w?

> + - "compatible", should be "nuvoton,nct7802-fan"
> +Optional boolean properties:
> + - "direct-current" :direct current powered fan instead default PWM
> + - "invert" :inverted polarity
> + - "open-drain" :open-drain output instead push pull
> +
> +Subnode "peci" properties:
> + - "reg" :index in range 0 .. 1
> + - "compatible", should be "nuvoton,nct7802-peci"
> +
> +Not defined sensors, fans and PECI modules will be disabled.
> +
> +Example nct7802 node:
> +
> +nct7802-example@28 {
> +	compatible = "nuvoton,nct7802";
> +	reg = <0x28>;
> +	#address-cells=<1>;
> +	#size-cells=<0>;
> +	local-sensor {
> +		compatible = "nuvoton,nct7802-sensor";
> +		sensor-type = "local";
> +	};
> +	sensor@0 {
> +		compatible = "nuvoton,nct7802-sensor";
> +		reg = <0>;
> +		sensor-type = "thermal-diode";
> +	};
> +	sensor@1 {
> +		compatible = "nuvoton,nct7802-sensor";
> +		reg = <1>;
> +		sensor-type = "thermistor";
> +	};
> +	sensor@2 {
> +		compatible = "nuvoton,nct7802-sensor";
> +		reg = <2>;
> +		sensor-type = "voltage";
> +	};
> +	vcc {
> +		compatible = "nuvoton,nct7802-sensor";
> +		sensor-type = "vcc";

No unit address?

> +	};
> +	vcore {
> +		compatible = "nuvoton,nct7802-sensor";
> +		sensor-type = "vcore";
> +	};
> +	pwm-fan@0 {
> +		compatible = "nuvoton,nct7802-fan";
> +		reg = <0>;
> +	};
> +	dc-fan@1 {
> +		compatible = "nuvoton,nct7802-fan";
> +		reg = <1>;
> +		direct-current;
> +		open-drain;
> +		invert;
> +	};
> +	fan@2 {
> +		compatible = "nuvoton,nct7802-fan";
> +		reg = <2>;
> +		open-drain;
> +		invert;
> +	};
> +	peci@0 {
> +		compatible = "nuvoton,nct7802-peci";
> +		reg = <0>;
> +	};
> +	peci@1 {
> +		compatible = "nuvoton,nct7802-peci";
> +		reg = <1>;
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
