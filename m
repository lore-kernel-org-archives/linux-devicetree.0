From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC V3 PATCH 1/7] arm64: dts: msm8992 SoC and LG Bullhead
 (Nexus 5X) support
Date: Wed, 12 Oct 2016 11:30:02 +0100
Message-ID: <20161012103001.GB19509@remoulade>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-2-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476265054-22511-2-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 02:37:28AM -0700, Jeremy McNicoll wrote:
> +/ {
> +	model = "LGE MSM8992 BULLHEAD rev-1.01";
> +	compatible = "qcom,msm8992";
> +	qcom,board-id = <0xb64 0>;
> +};

This last property doesn't seem to be documented or used in mainline.

What is it for?

> +/ {
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};

I'd recommend describing the configured rate, per
Documentation/devicetree/bindings/chosen.txt

[...]

> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8992";
> +	compatible = "qcom,msm8992";
> +	qcom,msm-id = <251 0>, <252 0>;
> +	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;

These last two are not documented, and not used in mainline.

What are they for?

> +	memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		device_type = "memory";
> +		reg = <0 0 0 0>;

If this is filled in by the bootloader, please havea coment to that effect.

> +		peripheral_mem: peripheral_region@0 {
> +			linux,reserve-contiguous-region;
> +			linux,reserve-region;
> +			linux,remove-completely;
> +			reg = <0 0x07400000 0 0x1c00000>;
> +			label = "peripheral_mem";
> +		};
> +	};

What is this?

There aren't any sub-nodes of memory (iirc reserved-memory is a separate node),
an none of these 'liux,' prefixed properties exist in mainline.

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 2 0xf08>,
> +				<1 3 0xf08>,
> +				<1 4 0xf08>,
> +				<1 1 0xf08>;
> +		clock-frequency = <19200000>;
> +	};

Why is the FW not programming the frequency register?

> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +		};
> +	};

Get rid of the clocks container node, and places these directly under the root node.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
