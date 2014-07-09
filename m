From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC v4 12/20] DT: Add documentation for LED Class Flash
 Manger
Date: Wed, 09 Jul 2014 18:34:03 +0200
Message-ID: <53BD6EFB.8010304@samsung.com>
References: <1404921824-22781-1-git-send-email-j.anaszewski@samsung.com>
 <1404921824-22781-14-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1404921824-22781-14-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

Please ignore this message (and 20/20). They were sent
as a result of a mistake.

Best Regards,
Jacek Anaszewski

On 07/09/2014 06:03 PM, Jacek Anaszewski wrote:
> This patch documents LED Class Flash Manager
> related bindings.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>   .../bindings/leds/leds-flash-manager.txt           |  171 ++++++++++++++++++++
>   1 file changed, 171 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-flash-manager.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-flash-manager.txt b/Documentation/devicetree/bindings/leds/leds-flash-manager.txt
> new file mode 100644
> index 0000000..2d78208
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-flash-manager.txt
> @@ -0,0 +1,171 @@
> +* LED Flash Manager
> +
> +Flash manager is a part of LED Flash Class. It maintains
> +all the flash led devices which have their external strobe
> +signals routed through mulitplexing devices.
> +The multiplexers are aggregated in the standalone 'flash_muxes'
> +node in the form of subnodes and the flash led devices refer
> +to those nodes' labels.
> +
> +
> +flash_muxes node
> +----------------
> +
> +muxN subnode
> +------------
> +
> +There must be at least one muxN subnode, where N is the identifier
> +of the node, present in the flash_muxes node. One muxN node
> +represents one multiplexer.
> +
> +Required properties (mutually exclusive):
> +- gpios		: specifies the gpio pins used to set the states
> +		  of mux selectors, LSB first
> +- mux-async	: phandle to the node of the multiplexing device
> +
> +
> +
> +flash led device node
> +---------------------
> +
> +Following subnodes must be added to the LED Flash Class device
> +tree node described in Documentation/devicetree/bindings/leds/common.txt.
> +
> +
> +gate-software-strobe subnode
> +----------------------------
> +
> +The node defines configuration of multiplexers that needs
> +to be applied to route software strobe signal to the flash
> +led device.
> +
> +Required properties:
> +- mux		: phandle to the muxN node defined
> +		  in the flash_muxes node
> +- mux-line-id	: mux line identifier
> +
> +Optional subnodes:
> +- gate-software-strobe : if there are many multiplexers to configure,
> +			 they can be recursively nested.
> +
> +
> +gate-external-strobeN subnode
> +-----------------------------
> +
> +The node defines configuration of multiplexers that needs
> +to be applied to route external strobe signal to the flash
> +led device. A flash led device can have many external strobe
> +signal sources.
> +
> +Required properties:
> +- mux			: phandle to the muxN node defined
> +			  in the flash_muxes node
> +- mux-line-id		: mux line identifier
> +Optional properties:
> +- strobe-provider	: phandle to the device providing the
> +			  strobe signal. It is expected only
> +			  on the first level node. The referenced
> +			  node is expected to have 'compatible'
> +			  property, as providers are labelled
> +			  with it in the LED subsystem
> +
> +Optional subnodes:
> +- gate-external-strobeN	: if there are many multiplexers to configure,
> +			  they can be recursively nested.
> +
> +
> +Example:
> +
> +Following board configuration is assumed in this example and
> +
> +    ---------- ----------
> +    | FLASH1 | | FLASH2 |
> +    ---------- ----------
> +           \(0)   /(1)
> +          ----------
> +          |  MUX1  |
> +          ----------
> +              |
> +          ----------
> +          |  MUX2  |
> +          ----------
> +           /(0)   \(1)
> +      ----------  --------------------
> +      |  MUX3  |  | SOC FLASHEN GPIO |
> +      ----------  --------------------
> +       /(0)   \(1)
> +----------- -----------
> +| SENSOR1 | | SENSOR2 |
> +----------- -----------
> +
> +FLASH1 : max77693-flash
> +FLASH2 : some other flash led device
> +SENSOR1: s5c73m3_spi
> +SENSOR2: s5k6a3
> +
> +
> +dummy_mux: led_mux {
> +	compatible = "led-async-mux";
> +};
> +
> +flash_muxes {
> +	flash_mux1: mux1 {
> +                gpios = <&gpj1 1 0>, <&gpj1 2 0>;
> +	};
> +
> +	flash_mux2: mux2 {
> +		mux-async = <&dummy_mux>;
> +	};
> +
> +	flash_mux3: mux3 {
> +                gpios = <&gpl1 1 0>, <&gpl1 2 0>;
> +	};
> +};
> +
> +max77693-flash {
> +	compatible = "maxim,max77693-flash";
> +
> +	//other device specific properties here
> +
> +	gate-software-strobe {
> +		mux = <&flash_mux1>;
> +		mux-line-id = <0>;
> +
> +		gate-software-strobe {
> +			mux = <&flash_mux2>;
> +			mux-line-id = <1>;
> +		};
> +	};
> +
> +	gate-external-strobe1 {
> +		strobe-provider = <&s5c73m3_spi>;
> +		mux = <&flash_mux1>;
> +		mux-line-id = <0>;
> +
> +		gate-external-strobe1 {
> +			mux = <&flash_mux2>;
> +			mux-line-id = <0>;
> +
> +			gate-external-strobe1 {
> +				mux = <&flash_mux3>;
> +				mux-line-id = <0>;
> +			};
> +		};
> +	};
> +
> +	gate-external-strobe2 {
> +		strobe-provider = <&s5k6a3>;
> +		mux = <&flash_mux1>;
> +		mux-line-id = <0>;
> +
> +		gate-external-strobe2 {
> +			mux = <&flash_mux2>;
> +			mux-line-id = <0>;
> +
> +			gate-external-strobe2 {
> +				mux = <&flash_mux3>;
> +				mux-line-id = <1>;
> +			};
> +		};
> +	};
> +};
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
