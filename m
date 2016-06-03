From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: adc: ina3221: Add DT binding details
Date: Thu, 2 Jun 2016 21:07:59 -0500
Message-ID: <20160603020759.GA23947@rob-hp-laptop>
References: <1464784454-7988-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464784454-7988-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 01, 2016 at 06:04:12PM +0530, Laxman Dewangan wrote:
> The INA3221 is a three-channel, high-side current and bus voltage monitor
> with an I2C interface from Texas Instruments. The INA3221 monitors both
> shunt voltage drops and bus supply voltages in addition to having
> programmable conversion times and averaging modes for these signals.
> The INA3221 offers both critical and warning alerts to detect multiple
> programmable out-of-range conditions for each channel.
> 
> Add DT binding details for INA3221 device for configuring device in
> different modes and enable multiple functionalities from device.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/ina3221.txt        | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ina3221.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ina3221.txt b/Documentation/devicetree/bindings/iio/adc/ina3221.txt
> new file mode 100644
> index 0000000..9f0908d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ina3221.txt
> @@ -0,0 +1,107 @@
> +TI INA3221 DT binding
> +
> +The INA3221 is a three-channel, high-side current and bus voltage monitor
> +with an I2C interface from Texas Instruments. The INA3221 monitors both
> +shunt voltage drops and bus supply voltages in addition to having
> +programmable conversion times and averaging modes for these signals.
> +The INA3221 offers both critical and warning alerts to detect multiple
> +programmable out-of-range conditions for each channel.
> +
> +Required properties:
> +-------------------
> +- compatible:		Must be "ti,ina3221".
> +- reg:			I2C slave device address.
> +- #io-channel-cells:	Should be set to 1. The value from the client node
> +			represent the channel number.
> +
> +Optional properties:
> +------------------
> +one-shot-average-sample:	Integer, Number of sample to average before
> +				putting in the registers in oneshot mode.
> +
> +one-shot-vbus-conv-time-us:	Integer in microseconds, ADC conversion time for
> +				bus voltage reading in oneshot mode.
> +
> +one-shot-shunt-conv-time-us:	Integer in microseconds, ADC conversion time for
> +				shunt voltage reading in oneshot mode.
> +
> +continuous-average-sample:	Integer, Number of sample to average before
> +				putting in the registers in continuous mode.
> +
> +continuous-vbus-conv-time-us:	Integer in microseconds, ADC conversion time for
> +				bus voltage reading in continuous mode.
> +
> +continuous-shunt-conv-time-us:	Integer in microseconds, ADC conversion time for
> +				shunt voltage reading in continuous mode.

These all need vendor prefix and need to state the valid range of 
values.

> +
> +enable-power-monitor:		Boolean, Enable power monitoring of the device.
> +
> +enable-continuous-mode:		Boolean. Device support oneshot and continuous
> +				mode for the channel data conversion. Presence
> +				of this property will enable the continuous
> +				mode from boot.
> +
> +enable-warning-alert:		Boolean, Enable the alert signal when shunt
> +				current cross the warning threshold on any of
> +				the channel. Absence of this property will not
> +				enable the warning alert.
> +
> +enable-critical-alert:		Boolean, Enable the alert signal when shunt
> +				current cross the critical threshold on any
> +				of the channel. Absence of this property will
> +				not enable the critical alert.

Seems like these would be a user decision.

> +
> +Optional Subnode properties:
> +---------------------------
> +The channel specific properties are provided as child node of device.
> +The fixed child node names of device node used for channel identification.
> +
> +Child node's name are "channel0" for channel 0, "channel1" for channel 1 and
> +"channel2" for channel 2.
> +
> +Channel specific properties are provided under these child node. Following
> +are the properties:
> +
> +label:					String, the name of the bus.
> +shunt-resistor-mohm:			Integer, The shunt resistance on bus
> +					in milli-ohm.

Use -micro-ohms

> +warning-current-limit-microamp:		Integer in microamp, warning current threshold
> +					for the channel	to generate warning alert.
> +critical-current-limit-microamp:	Integer in microamp, critical current threshold
> +					for the channel to generate warning alert.
> +
> +Example:
> +
> +i2c@7000c400 {
> +	ina3221x@42 {

What's the x?

> +		compatible = "ti,ina3221";
> +		reg = <0x42>;
> +		one-shot-average-sample = <1>;
> +		one-shot-vbus-conv-time-us = <140>;
> +		one-shot-shunt-conv-time-us = <140>;
> +		continuous-average-sample = <64>;
> +		continuous-vbus-conv-time-us = <140>;
> +		continuous-shunt-conv-time-us = <140>;
> +		enable-power-monitor;
> +
> +		#io-channel-cells = <1>;
> +
> +		channel0 {
> +			label = "VDD_MUX";
> +			shunt-resistor-mohm = <20>;
> +		};
> +
> +		channel1 {
> +			label = "VDD_5V_IO_SYS";
> +			shunt-resistor-mohm = <5>;
> +			warning-current-limit-microamp = <8190000>;
> +			critical-current-limit-microamp = <1000000>;
> +		};
> +
> +		channel2 {
> +			label = "VDD_3V3_SYS";
> +			shunt-resistor-mohm = <10>;
> +		};
> +	};
> +};
> -- 
> 2.1.4
> 
