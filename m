From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] spi: qup: Add device tree bindings information
Date: Fri, 7 Feb 2014 01:43:20 -0600
Message-ID: <20140207074320.GB2610@qualcomm.com>
References: <1391705868-20091-1-git-send-email-iivanov@mm-sol.com>
 <1391705868-20091-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391705868-20091-2-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 06:57:47PM +0200, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> 
> The Qualcomm Universal Peripheral (QUP) core is an
> AHB slave that provides a common data path (an output
> FIFO and an input FIFO) for serial peripheral interface
> (SPI) mini-core.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/spi/qcom,spi-qup.txt       |   86 ++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt b/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> new file mode 100644
> index 0000000..74565f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> @@ -0,0 +1,86 @@
> +Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
> +
> +The QUP core is an AHB slave that provides a common data path (an output FIFO
> +and an input FIFO) for serial peripheral interface (SPI) mini-core.
> +
> +SPI in master mode support up to 50MHz, up to four chip selects, and a
> +programmable data path from 4 bits to 32 bits; supports numerous protocol
> +variants.
> +
> +Required properties:
> +- compatible: 		Should contain "qcom,spi-qup-v2".

Could be more descriptive.  qcom,spi-qup-v2.1.1 for MSM8974 v1 and
qcom,spi-qup-v2.2.1 for MSM8974 v2.

> +- reg: 				Should contain base register location and length
> +- interrupts: 		Interrupt number used by this controller
> +
> +- clocks: 			Should contain the core clock and the AHB clock.
> +- clock-names: 		Should be "core" for the core clock and "iface" for the
> +                	AHB clock.
> +
> +- #address-cells: 	Number of cells required to define a chip select
> +					address on the SPI bus. Should be set to 1.
> +- #size-cells: 		Should be zero.
> +
> +Optional properties:
> +- spi-max-frequency: Specifies maximum SPI clock frequency, Units - Hz. Definition
> +                    as per Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +SPI slave nodes must be children of the SPI master node and can
> +contain properties described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Example:
> +
> +	spi_8: spi@f9964000 { /* BLSP2 QUP2 */
> +
> +		compatible = "qcom,spi-qup-v2";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0xf9964000 0x1000>;
> +		interrupts = <0 102 0>;
> +		spi-max-frequency = <19200000>;
> +
> +		clocks = <&gcc GCC_BLSP2_QUP2_SPI_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
> +		clock-names = "core", "iface";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spi8_default>;
> +
> +		device@0 {
> +			compatible = "arm,pl022-dummy";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0>; /* Chip select 0 */
> +			spi-max-frequency = <19200000>;
> +			spi-cpol;
> +		};
> +
> +		device@1 {
> +			compatible = "arm,pl022-dummy";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <1>; /* Chip select 1 */
> +			spi-max-frequency = <9600000>;
> +			spi-cpha;
> +		};
> +
> +		device@2 {
> +			compatible = "arm,pl022-dummy";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <2>; /* Chip select 2 */
> +			spi-max-frequency = <19200000>;
> +			spi-cpol;
> +			spi-cpha;
> +		};
> +
> +		device@3 {
> +			compatible = "arm,pl022-dummy";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <3>; /* Chip select 3 */
> +			spi-max-frequency = <19200000>;
> +			spi-cpol;
> +			spi-cpha;
> +			spi-cs-high;
> +		};
> +	};
> +
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
