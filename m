From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 41/41] ARM: dts: da850: Add clocks
Date: Fri, 9 Feb 2018 18:16:44 +0530
Message-ID: <075d9f68-ad82-c8c0-c302-3b07162ecb2e@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-42-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-42-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index c66cf78..7f4acd7 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -21,6 +21,36 @@
>  			#interrupt-cells = <1>;
>  			ti,intc-size = <101>;
>  			reg = <0xfffee000 0x2000>;
> +			clocks = <&psc0 6>;
> +		};
> +	};
> +	clocks: clocks {
> +		ref_clk: ref_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <24000000>;
> +			clock-output-names = "ref_clk";
> +		};

The ref_clk clock-frequency should rather be added in each board file
since its not fixed by the SoC. In general we dont want any SoC defined
properties to be overwritten by board files (except the status = property).

Thanks,
Sekhar
