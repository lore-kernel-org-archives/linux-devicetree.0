From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X)
 support
Date: Thu, 3 Nov 2016 22:38:24 +0000
Message-ID: <20161103223823.GA30414@remoulade>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-2-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-2-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 04:16:56AM -0700, Jeremy McNicoll wrote:
> +	memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;

These shouldn't be here. There are no sub-nodes that this should affect.

> +		device_type = "memory";
> +		reg = <0 0 0 0>; // bootloader will update
> +	};
> +
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +			clock-output-names = "sleep_clk";
> +		};
> +	};

Please get rid of the clocks container node, and put these directly under the
root node.

Thanks,
Mark.
