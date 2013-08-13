From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Tue, 13 Aug 2013 22:23:25 +0100
Message-ID: <520AA3CD.1040008@kernel.org>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com> <1374501843-19651-3-git-send-email-hector.palacios@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374501843-19651-3-git-send-email-hector.palacios-i7dp0qKlBMg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/22/13 15:04, Hector Palacios wrote:
> Some LRADC channels have fixed pre-dividers so they can measure
> different voltages at full scale. The reference voltage allows to
> expose a scaling attribute through the IIO sysfs so that a user can
> compute the real voltage out of a measured sample value.
> 
> Signed-off-by: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
> Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

CC'd the device tree maintainers to see if I can get a comment on this one.
(done from this initial posting of the patch so that the code is still present).
I've avoided the patch for a while because opinion was divided.

Lars-Peter Clausen commented:

I've said before that I'm not convinced that this is the right way to implement this. And considering what Thomas said
here http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg36691.html I guess I'm not alone with that opinion.

Marek replied:

He's talking about different versions of the IP block, this is the same IP
block, just connected to different inputs.

Alexander added:

I don't have any strong opinion on that and I'm certainly not an expert
but thinking about that, I feel this is different from the discussion
Thomas had. Those are reference voltages and describe how the IP block
is connected whereas what Thomas was describing is supporting multiple
versions of an IP block by describing heaps of registers in the DT. It
may look ugly here because you have a lot of channels but I find that
quite acceptable.

Personally I'm falling slightly on the side of this being a bad idea as the
fact they are specified in the processor device tree files and clearly lines
up with the compatible strings suggests this is ought to be in the driver
not the device tree.

Anyhow, looking for more opinions / acks as appropriate.

Incidentally I'm very glad that people have come forward to help with
this stuff!

Jonathan

> ---
>  Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt | 9 ++++++++-
>  arch/arm/boot/dts/imx23.dtsi                                    | 4 ++++
>  arch/arm/boot/dts/imx28.dtsi                                    | 4 ++++
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> index 4688205..6ec485c 100644
> --- a/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> +++ b/Documentation/devicetree/bindings/staging/iio/adc/mxs-lradc.txt
> @@ -1,9 +1,12 @@
>  * Freescale i.MX28 LRADC device driver
>  
>  Required properties:
> -- compatible: Should be "fsl,imx28-lradc"
> +- compatible: "fsl,imx28-lradc", "fsl,imx23-lradc"
>  - reg: Address and length of the register set for the device
>  - interrupts: Should contain the LRADC interrupts
> +- fsl,vref: Reference voltage (in mV) for each LRADC channel. This is the
> +	    maximum voltage that can be measured at full scale in each channel
> +	    considering fixed pre-dividers.
>  
>  Optional properties:
>  - fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
> @@ -18,4 +21,8 @@ Examples:
>  		reg = <0x80050000 0x2000>;
>  		interrupts = <10 14 15 16 17 18 19
>  				20 21 22 23 24 25>;
> +		fsl,vref = <1850 1850 1850 1850
> +			    1850 1850 1850 7400
> +			    1850 1850 3700 1850
> +			    3700 1850 1850 7400>
>  	};
> diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
> index 587ceef..e212902 100644
> --- a/arch/arm/boot/dts/imx23.dtsi
> +++ b/arch/arm/boot/dts/imx23.dtsi
> @@ -430,6 +430,10 @@
>  				compatible = "fsl,imx23-lradc";
>  				reg = <0x80050000 0x2000>;
>  				interrupts = <36 37 38 39 40 41 42 43 44>;
> +				fsl,vref = <1850 1850 1850 1850
> +					    1850 1850 3700 7400
> +					    1850 1850 1850 1850
> +					    1850 1850 1850 7400>;
>  				status = "disabled";
>  			};
>  
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 6a8acb0..c1b3724 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -865,6 +865,10 @@
>  				reg = <0x80050000 0x2000>;
>  				interrupts = <10 14 15 16 17 18 19
>  						20 21 22 23 24 25>;
> +				fsl,vref = <1850 1850 1850 1850
> +					    1850 1850 1850 7400
> +					    1850 1850 3700 1850
> +					    3700 1850 1850 7400>;
>  				status = "disabled";
>  			};
>  
> 
