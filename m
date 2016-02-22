From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] rtc: rewrite DS1302 using SPI
Date: Mon, 22 Feb 2016 12:45:14 -0600
Message-ID: <20160222184514.GA26099@rob-hp-laptop>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
 <1456105286-28598-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456105286-28598-1-git-send-email-ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:REAL TIME CLOCK SUBSYSTEM" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 04:41:22AM +0300, Sergei Ianovich wrote:
> DS1302 is half-duplex SPI device. The driver respects this fact now.
> 
> Pin configurations should be implemented using SPI subsystem.
> 
> Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> CC: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>    v5..v6
>    * rewrite the driver as an SPI slave device
>    * use "maxim" for vendor name per Kconfig
>    * stop touching device RAM in device presence test
>    * only return time from device if valid
>    * use burst mode for reading/writing time
>    * droppped charging control. I cannot test it, and it looks broken
> 
>    v4..v5
>    * drop THIS_MODULE from struct platform driver
>    * use "dallas" for vendor name per vendor-prefixes.txt
> 
>    v3..v4
>    * move DTS bindings to a different patch
> 
>    v2..v3
>    * use usleep_range instead of custom nsleep
>    * number change (07/16 -> 09/21)
> 
>    v0..v2
>    * use device tree
>    * use devm helpers where possible
> 
>  .../devicetree/bindings/rtc/rtc-ds1302.txt         |  46 +++
>  drivers/rtc/Kconfig                                |  15 +-
>  drivers/rtc/rtc-ds1302.c                           | 348 ++++++++++-----------
>  3 files changed, 212 insertions(+), 197 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> new file mode 100644
> index 0000000..b6c0973
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
> @@ -0,0 +1,46 @@
> +* Maxim/Dallas Semiconductor DS-1302 RTC
> +
> +Simple device which could be used to store date/time between reboots.
> +
> +The device uses the standard MicroWire half-duplex transfer timing.
> +Master output is set on low clock and sensed by the RTC on the rising
> +edge. Master input is set by the RTC on the trailing edge and is sensed
> +by the master on low clock.
> +
> +Required properties:
> +
> +- compatible : Should be "maxim,rtc-ds1302"

Just maxim,ds1032. RTC is implied by the part number and inline with 
existing dallas,ds1307.

> +
> +Required SPI properties:
> +
> +- reg : Should be address of the device chip select within
> +  the controller.
> +
> +- spi-max-frequency : DS-1302 has 500 kHz if powered at 2.2V,
> +  and 2MHz if powered at 5V.
> +
> +- spi-3wire : The device has a shared signal IN/OUT line.
> +
> +- spi-lsb-first : DS-1302 requires least significant bit first
> +  transfers.
> +
> +- spi-cs-high: DS-1302 has active high chip select line. This is
> +  required unless inverted in hardware.
> +
> +Example:
> +
> +spi0@901c {

spi@...

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "icpdas,spi-lp8841-rtc";

And this will need updating...

> +	reg = <0x901c 0x1>;
> +
> +	rtc@0 {
> +		compatible = "maxim,rtc-ds1302";
> +		reg = <0>;
> +		spi-max-frequency = <500000>;
> +		spi-3wire;
> +		spi-lsb-first;
> +		spi-cs-high;
> +	};
> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
