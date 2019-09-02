From: Rob Herring <robh@kernel.org>
Subject: Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Date: Mon, 02 Sep 2019 14:39:04 +0100
Message-ID: <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
References: <20190830091720.41156-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830091720.41156-1-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, mark.rutland@arm.com, leoyang.li@nxp.com, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Fuzzey <mfuzzey@parkeon.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 05:17:19PM +0800, Biwen Li wrote:
> Add some properties for pcf85263/pcf85363 as follows:
>   - interrupt-output-pin: string type
>   - quartz-load-capacitance: integer type
>   - quartz-drive-strength: integer type
>   - quartz-low-jitter: bool type
>   - wakeup-source: bool type
> 
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  .../devicetree/bindings/rtc/pcf85363.txt      | 31 +++++++++++++++++++
>  include/dt-bindings/rtc/pcf85363.h            | 15 +++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> 
> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> index 94adc1cf93d9..d83359990bd7 100644
> --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> @@ -8,10 +8,41 @@ Required properties:
>  Optional properties:
>  - interrupts: IRQ line for the RTC (not implemented).
>  
> +- interrupt-output-pin: The interrupt output pin must be
> +  "NONE", "INTA" or "INTB", default value is "NONE"
> +
> +- quartz-load-capacitance: The internal capacitor to select for the quartz:
> +	PCF85263_QUARTZCAP_7pF		[0]
> +	PCF85263_QUARTZCAP_6pF		[1]
> +	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT

We have a common property for this. Use it.

> +
> +- quartz-drive-strength: Drive strength for the quartz:
> +	PCF85263_QUARTZDRIVE_NORMAL	[0] DEFAULT
> +	PCF85263_QUARTZDRIVE_LOW	[1]
> +	PCF85263_QUARTZDRIVE_HIGH	[2]
> +
> +- quartz-low-jitter: Boolean property, if present enables low jitter mode
> +  which reduces jitter at the cost of increased power consumption.

These 2  need vendor prefixes.

> +
> +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> +  independently of the availability of an IRQ line connected to the SoC.
> +  This is useful if the IRQ line is connected to a PMIC or other circuit
> +  that can power up the device rather than to a normal SOC interrupt.
> +
>  Example:
>  
>  pcf85363: pcf85363@51 {
>  	compatible = "nxp,pcf85363";
>  	reg = <0x51>;
> +
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +
> +	#include <dt-bindings/rtc/pcf85363.h>
> +	wakeup-source;
> +	interrupt-output-pin = "INTA";
> +	quartz-load-capacitance = <PCF85363_QUARTZCAP_12p5pF>;
> +	quartz-drive-strength = <PCF85363_QUARTZDRIVE_LOW>;
> +	quartz-low-jitter;
>  };
>  
> diff --git a/include/dt-bindings/rtc/pcf85363.h b/include/dt-bindings/rtc/pcf85363.h
> new file mode 100644
> index 000000000000..2c06c28eb5ff
> --- /dev/null
> +++ b/include/dt-bindings/rtc/pcf85363.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_RTC_PCF85363_H
> +#define _DT_BINDINGS_RTC_PCF85363_H
> +
> +/* Quartz capacitance */
> +#define PCF85363_QUARTZCAP_7pF		0
> +#define PCF85363_QUARTZCAP_6pF		1
> +#define PCF85363_QUARTZCAP_12p5pF	2
> +
> +/* Quartz drive strength */
> +#define PCF85363_QUARTZDRIVE_NORMAL	0
> +#define PCF85363_QUARTZDRIVE_LOW	1
> +#define PCF85363_QUARTZDRIVE_HIGH	2
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_H */
> -- 
> 2.17.1
> 
