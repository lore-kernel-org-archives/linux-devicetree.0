From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 2/3] ARM: dts: sun8i: Add Allwinner A83T dtsi
Date: Wed, 6 Jan 2016 13:25:05 +0000
Message-ID: <20160106132505.GJ563@leverpostej>
References: <1452085914-29340-1-git-send-email-vishnupatekar0510@gmail.com>
 <1452085914-29340-3-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452085914-29340-3-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, maxime.ripard@free-electrons.com, linux@arm.linux.org.uk, emilio@elopez.com.ar, linus.walleij@linaro.org, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

> +	chosen {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +	};

What is the ranges property doing here?

[...]

> +	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		osc24M: osc24M_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "osc24M";
> +		};
> +
> +		osc32k: osc32k_clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +			clock-output-names = "osc32k";
> +		};
> +	};

Just put the clocks under the root node. 'clocks' is not a special node.

Thanks,
Mark.
