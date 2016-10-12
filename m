From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC V3 PATCH 5/7] arm64: dts: msm8994 SoC and Huawei Angler
 (Nexus 6P) support
Date: Wed, 12 Oct 2016 14:34:51 +0100
Message-ID: <20161012133450.GC21050@remoulade>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-6-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476265054-22511-6-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 02:37:32AM -0700, Jeremy McNicoll wrote:
> +/ {
> +	model = "HUAWEI MSM8994 ANGLER rev-1.01";
> +	compatible = "qcom,msm8994";
> +	qcom,board-id= <8026 0>;
> +};

This last property is undocumented, and unused.

> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8994v2.0";
> +	compatible = "qcom,msm8994";
> +	qcom,msm-id = <207 0x20000>;
> +
> +};

Likewise here.

[...]

> +/memreserve/ 0x00000000 0x00001000;
> +/memreserve/ 0xac1c0000 0x00001000;

Why? What are these attempting to protect?

Given the kernel can still map these regions with cacheable mappings, is this
definitely sufficient?

[...]

> +/ {
> +	model = "Qualcomm Technologies, Inc. MSM 8994";
> +	compatible = "qcom,msm8994";
> +	qcom,msm-id = <207 0x0>;
> +	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;

Two undocumented and unused properties.

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <1 2 0xff08>,
> +			     <1 3 0xff08>,
> +			     <1 4 0xff08>,
> +			     <1 1 0xff08>;
> +		clock-frequency = <19200000>;
> +	};

Why is the bootloader not configuring the frequency register?

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

No clocks node is necessary. Please put these under the root node.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
