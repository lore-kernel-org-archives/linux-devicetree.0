From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt-bindings: Document bindings
 for Aspeed AST2400/AST2500 ADC
Date: Tue, 21 Mar 2017 22:16:10 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1703212215100.26011@vps.pmeerw.net>
References: <20170321204828.31303-1-raltherr@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170321204828.31303-1-raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Signed-off-by: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

extreme nitpicking below

 ---
> 
> Changes in v2:
> - Rewritten as an IIO ADC device
> 
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> new file mode 100644
> index 000000000000..7748c2c2ad0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> @@ -0,0 +1,20 @@
> +Aspeed AST2400/2500 ADC
> +
> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
> +single ended.
> +
> +Required properties:
> +- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
> +- reg: memory window mapping address and length
> +- clocks: Input clock used to derive the sample clock. Expected to be the
> +          SoC's APB clock.
> +- #io-channel-cells: Must be set to <1> to indicate channels are selected
> +                     by index.
> +
> +Example:
> +	adc@1e6e9000 {
> +		compatible = "aspeed,ast2400-adc";
> +		reg = <0x1e6e9000 0xB0>;

maybe 0xb0 (consistent lowercase hex)?

> +		clocks = <&clk_apb>;
> +		#io-channel-cells = <1>;
> +	};
> 

-- 

Peter Meerwald-Stadler
Mobile: +43 664 24 44 418
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
