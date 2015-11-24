From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: add epson rx6110 binding
Date: Tue, 24 Nov 2015 17:54:00 -0600
Message-ID: <20151124235337.GA18195@rob-hp-laptop>
References: <1448361533-10728-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448361533-10728-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 11:38:52AM +0100, Steffen Trumtrar wrote:
> Add the binding documentation for the Epson RX6110 RTC.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> I'm not sure what the current policy for such simple SPI bindings is.
> Are they necessary?

Yes. We do have trivial-devices.txt for i2c. We could do one for spi. 
Although, you need the mode configuration for each device, so spi is not 
so trivial.

> 
>  .../devicetree/bindings/rtc/epson,rtc-rx6110.txt   | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/epson,rtc-rx6110.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/epson,rtc-rx6110.txt b/Documentation/devicetree/bindings/rtc/epson,rtc-rx6110.txt
> new file mode 100644
> index 000000000000..7ce7ae761657
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/epson,rtc-rx6110.txt
> @@ -0,0 +1,25 @@
> +Epson RX6110 Real Time Clock
> +============================
> +
> +The Epson RX6110 can be used with SPI or I2C busses. The kind of
> +bus depends on the SPISEL pin and can not be configured via software.

Can you document I2C mode. It should just be the compatible and reg 
properties.

> +
> +SPI mode
> +--------
> +
> +Required properties:
> +- compatible: should be: "epson,rtc-rx6110"
> +- reg: chip select number
> +- spi-cs-high: RX6110 needs chipselect high
> +- spi-cpha: RX6110 works with SPI shifted clock phase
> +- spi-cpol: RX6110 works with SPI inverse clock polarity
> +
> +Example:
> +
> +	rtc: rtc@3 {
> +		compatible = "epson,rtc-rx6110"
> +		reg = <3>
> +		spi-cs-high;
> +		spi-cpba;
> +		spi-cpol;
> +	};
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
