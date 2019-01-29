Return-Path: <SRS0=uA5R=QF=opensource.cirrus.com=ckeepax@kernel.org>
Date: Tue, 29 Jan 2019 16:58:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v6 1/6] mfd: lochnagar: Add initial binding documentation
Message-ID: <20190129165832.GK3837@imbe.wolfsonmicro.main>
References: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
To: lee.jones@linaro.org, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 17, 2019 at 02:58:53PM +0000, Charles Keepax wrote:
> +Example:
> +
> +lochnagar: lochnagar@22 {
> +	compatible = "cirrus,lochnagar2";
> +	reg = <0x22>;
> +
> +	reset-gpios = <&gpio0 55 0>;
> +	present-gpios = <&gpio0 60 0>;
> +
> +	lochnagar-clk {
> +		compatible = "cirrus,lochnagar2-clk";
> +		...
> +	};
> +
> +	lochnagar-pinctrl {
> +		compatible = "cirrus,lochnagar-pinctrl";
> +		...
> +	};
> +
> +	lochnagar-regulator {
> +		compatible = "cirrus,lochnagar-regulator";
> +		...

Sorry just realised this entry in the example is a hang over from
earlier versions of the regulator code and needs to go apologies I
will respin the series.

Thanks,
Charles
