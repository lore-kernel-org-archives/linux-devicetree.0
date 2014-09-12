From: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 2/2] DT: iio: vadc: document dt binding
Date: Sat, 13 Sep 2014 01:35:11 +0200
Message-ID: <5413832F.6040503@gmx.de>
References: <1410448403-19402-1-git-send-email-svarbanov@mm-sol.com> <1410448403-19402-3-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410448403-19402-3-git-send-email-svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stanimir Varbanov schrieb, Am 11.09.2014 17:13:
> Document DT binding for Qualcomm SPMI PMIC voltage ADC
> driver.
> 
Still one typo left.
> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  123 ++++++++++++++++++++
>  1 files changed, 123 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> new file mode 100644
> index 0000000..5abb491
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
> @@ -0,0 +1,123 @@
> +Qualcomm's SPMI PMIC voltage ADC
> +
> +SPMI PMIC voltage ADC (VADC) provides interface to clients to read
> +voltage. A 15 bit ADC is used for voltage measurements. There are multiple
> +peripherals to the VADC and the scope of the driver is to provide interface
> +for the USR peripheral of the VADC.
> +
> +VADC node:
> +
> +- compatible:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Should contain "qcom,spmi-vadc".
> +
> +- reg:
> +    Usage: required
> +    Value type: <u32>
> +    Definition: Base address in the SPMI PMIC register map.
> +
> +- address-cells:
> +    Usage: required
> +    Value type: <u32>
> +    Definition: Must be one.
> +
> +- size-cells:
> +    Usage: required
> +    Value type: <u32>
> +    Definition: Must be zero.
> +
> +- interrupts:
> +    Usage: required
> +    Value type: <prop-encoded-array>
> +    Definition: End of convertion interrupt number.
Typo: conversion
> +
> +- qcom,poll-eoc:
> +    Usage: optional
> +    Value type: <empty>
> +    Definition: Use polling instead of interrupt for end of conversion
> +            completion.
> +
> +Channel node properties:
> +
> +- reg:
> +    Usage: required
> +    Value type: <u32>
> +    Definition: AMUX channel number.
> +            See include/dt-bindings/iio/qcom,spmi-pmic-vadc.h
> +
> +- qcom,decimation:
> +    Usage: optional
> +    Value type: <u32>
> +    Definition: Sampling rate to use for the individual channel measurement.
> +            Quicker measurements can be made by reducing decimation ratio.
> +            Valid values are 512, 1024, 2048, 4096.
> +            If property is not found, default value of 512 will be used.
> +
> +- qcom,pre-scaling:
> +    Usage: optional
> +    Value type: <u32 array>
> +    Definition: Used for scaling the channel input signal before the signal is
> +            fed to VADC. The configuration for this node is to know the
> +            pre-determined ratio and use it for post scaling. Select one from
> +            the following options.
> +            <1 1>, <1 3>, <1 4>, <1 6>, <1 20>, <1 8>, <10 81>, <1 10>
> +            If property is not found default value depending of chip will be used.
> +
> +- qcom,ratiometric:
> +    Usage: optional
> +    Value type: <empty>
> +    Definition: Channel calibration type. If this property is specified
> +            VADC will use the VDD reference(1.8V) and GND for channel
> +            calibration. If property is not found, channel will be
> +            calibrated with 625mV and 1.25V reference channels.
> +
> +- qcom,hw-settle-time:
> +    Usage: optional
> +    Value type: <u32>
> +    Definition: Time between AMUX getting configured and the ADC starting
> +            conversion. Delay = 100us * (value) for value < 11, and
> +            2ms * (value - 10) otherwise.
> +            Valid values are: 0, 100, 200, 300, 400, 500, 600, 700, 800,
> +            900 us and 1, 2, 4, 6, 8, 10 ms
> +            If property is not found, channel will use 0us.
> +
> +- qcom,avg-samples:
> +    Usage: optional
> +    Value type: <u32>
> +    Definition: Number of samples to be used for measurement.
> +            Fast averaging provides the option to obtain a single measurement
> +            from the ADC that is an average of multiple samples. The value
> +            selected is 2^(value).
> +            Valid values are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
> +            If property is not found, 1 sample will be used.
> +
> +NOTE: At least one channel node is required.
> +
> +Example:
> +	/* VADC node */
> +	pmic_vadc: vadc@3100 {
> +		compatible = "qcom,spmi-vadc";
> +		reg = <0x3100 0x100>;
> +		interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#io-channel-cells = <1>;
> +		io-channel-ranges;
> +
> +		/* Channel node */
> +		usb_id_nopull {
> +			reg = <VADC_LR_MUX10_USB_ID>;
> +			qcom,decimation = <512>;
> +			qcom,ratiometric;
> +			qcom,hw-settle-time = <200>;
> +			qcom,avg-samples = <1>;
> +			qcom,pre-scaling = <1 3>;
> +		};
> +	};
> +
> +	/* IIO client node */
> +	usb {
> +		io-channels = <&pmic_vadc VADC_LR_MUX10_USB_ID>;
> +		io-channel-names = "vadc";
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
