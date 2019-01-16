From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: Add bindings for Cadence RTC
Date: Wed, 16 Jan 2019 15:08:06 -0600
Message-ID: <20190116210806.GA21535@bogus>
References: <20190111151401.25047-1-jank@cadence.com>
 <20190111151401.25047-2-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111151401.25047-2-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 03:14:00PM +0000, Jan Kotas wrote:
> This patch adds a DT binding documentation for
> Cadence RTC controller.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  Documentation/devicetree/bindings/rtc/cdns,rtc.txt | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/cdns,rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/cdns,rtc.txt b/Documentation/devicetree/bindings/rtc/cdns,rtc.txt
> new file mode 100644
> index 000000000..40713bbbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/cdns,rtc.txt
> @@ -0,0 +1,25 @@
> +Cadence Real Time Clock
> +
> +The Cadence RTC controller with date, time and alarm capabilities.
> +The alarm may wake the system from low-power state.
> +
> +Required properties:
> +- compatible: Should be "cdns,rtc-r109v3"
> +- reg: Specifies base physical address and size of the register area.
> +- interrupts: A single interrupt specifier.
> +- clocks: Must contain two entries:
> +	- pclk: APB registers clock
> +	- ref_clk: reference 1Hz of 100Hz clock, depending on IP configuration

1Hz OR 100Hz?

> +	See ../clocks/clock-bindings.txt for details.
> +
> +Example:
> +        rtc0: rtc@fd080000 {
> +        	compatible = "cdns,rtc-r109v3";
> +        	reg = <0xfd080000 0x1000>;
> +
> +        	clock-names = "pclk", "ref_clk";
> +        	clocks = <&sysclock>, <&refclock>;
> +
> +        	interrupt-parent = <&gic>;
> +        	interrupts = <0 6 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> -- 
> 2.15.0
> 
