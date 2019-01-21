From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: edac: ARM Cortex A15 L2 asynchronous
 error detection
Date: Mon, 21 Jan 2019 11:49:34 -0600
Message-ID: <20190121174934.GA20608@bogus>
References: <AM6PR0702MB3799A0BC3B07541CDBC4027EFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM6PR0702MB3799A0BC3B07541CDBC4027EFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 08, 2019 at 08:10:39AM +0000, Wiebe, Wladislav (Nokia - DE/Ulm) wrote:
> Add property description + example for using the
> Cortex A15 L2 asynchronous error detection driver.
> 
> Signed-off-by: Wladislav Wiebe <wladislav.wiebe@nokia.com>
> ---
>  .../bindings/edac/cortex_a15_l2_async_edac.txt     | 22 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt b/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
> new file mode 100644
> index 000000000000..9ad8c2497e70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
> @@ -0,0 +1,22 @@
> +* ARM Cortex A15 L2 internal asynchronous error detection driver
> +
> +Support for L2 internal asynchronous error detection caused by L2 RAM
> +double-bit ECC error or illegal writes to the Interrupt Controller
> +memory-map region on the Cortex A15.
> +
> +Required properties:
> +	- compatible: "arm,cortex-a15-l2-async-edac"

EDAC is a kernel name and shouldn't be in a binding (though, yes that 
is the directory name and there's examples to the contrary). How about 
just "arm,cortex-a15-l2-errirq"?

> +	- interrupts: INTERRIRQ per CPU cluster
> +
> +Example:
> +
> +cortex-a15-l2-async-edac {
> +	compatible = "arm,cortex-a15-l2-async-edac";
> +	interrupts = <0 182 4>,
> +		     <0 183 4>,
> +		     <0 184 4>,
> +		     <0 185 4>;
> +};
> +
> +Reference:
> +Cortex-A15 Technical Reference Manual, 7.7. Asynchronous errors
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b755a89fa325..0796ad6e6490 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1094,6 +1094,13 @@ F:	arch/arm/include/asm/arch_timer.h
>  F:	arch/arm64/include/asm/arch_timer.h
>  F:	drivers/clocksource/arm_arch_timer.c
>  
> +ARM CORTEX A15 L2 INTERNAL ASYNCHRONOUS ERROR DETECTION DRIVER
> +M:	Wladislav Wiebe <wladislav.wiebe@nokia.com>
> +L:	linux-edac@vger.kernel.org
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Supported
> +F:	Documentation/devicetree/bindings/edac/cortex_a15_l2_async_edac.txt
> +
>  ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -- 
> 2.16.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
