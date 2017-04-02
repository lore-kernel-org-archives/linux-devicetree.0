From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio: stm32-dac: Add support for STM32
 DAC
Date: Sun, 2 Apr 2017 12:16:41 +0100
Message-ID: <a6c51b90-c14b-412c-1006-cf0dd7abda0d@kernel.org>
References: <1490960707-22422-1-git-send-email-fabrice.gasnier@st.com>
 <1490960707-22422-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490960707-22422-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31/03/17 12:45, Fabrice Gasnier wrote:
> Document STMicroelectronics STM32 DAC (digital-to-analog converter).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/dac/st,stm32-dac.txt   | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> new file mode 100644
> index 0000000..1981983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> @@ -0,0 +1,56 @@
> +STMicroelectronics STM32 DAC
> +
> +The STM32 DAC is a 12-bit voltage output digital-to-analog converter. The DAC
> +can be configured in 8- or 12-bit mode. In 12-bit mode, the data could be
> +left- or right-aligned.
Whilst possibly true, do we care about the alignment?  That'll all get wrapped
up in the driver.

> It has two output channels, each with its own converter.
> +It has built-in noise and triangle waveform generator and supports external
> +triggers for conversions. The DAC's output buffer allows a high drive output
> +current.
Ah.. This is going to be fun :) More unusual hardware to find in an SoC.
> +
> +Contents of a stm32 dac root node:
> +-----------------------------------
> +Required properties:
> +- compatible: Must be "st,stm32h7-dac-core".
> +- reg: Offset and length of the device's register set.
> +- clocks: Must contain an entry for pclk (which feeds the peripheral bus
> +  interface)
> +- clock-names: Must be "pclk".
> +- vref-supply: Phandle to the vref+ input analog reference supply.
> +
> +Optional properties:
> +- resets: Must contain the phandle to the reset controller.
> +- A pinctrl state named "default" for each DAC channel may be defined to set
> +  DAC_OUTx pin in mode of operation for analog output on external pin.
> +
> +Contents of a stm32 dac child node:
> +-----------------------------------
> +DAC core node should contain at least one subnode, representing a
> +DAC instance/channel available on the machine.
> +
> +Required properties:
> +- compatible: Must be "st,stm32-dac".
> +- #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
> +  Documentation/devicetree/bindings/iio/iio-bindings.txt
> +- st,dac-channel: Must be either 1 or 2, to define channel in use (e.g.
> +  single channels: 1 or 2)
> +
> +Example:
> +	dac: dac@40007400 {
> +		compatible = "st,stm32h7-dac-core";
> +		reg = <0x40007400 0x400>;
> +		clocks = <&clk>;
> +		clock-names = "pclk";
> +		vref-supply = <&reg_vref>;
> +
> +		dac1: dac@1 {
> +			compatible = "st,stm32-dac";
> +			#io-channels-cells = <1>;
> +			st,dac-channel = <1>;
> +		};
> +
> +		dac2: dac@2 {
> +			compatible = "st,stm32-dac";
> +			#io-channels-cells = <1>;
> +			st,dac-channel = <2>;
> +		};
> +	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
