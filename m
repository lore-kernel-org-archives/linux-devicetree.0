From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 05/13] ARM: dts: ipq4019: Add ipq4019-ap.dk04.dtsi
Date: Tue, 27 Mar 2018 10:04:50 -0700
Message-ID: <20180327170450.GH1403@tuxbook-pro>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-6-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521800336-19266-6-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
> +	soc {
> +		pinctrl@1000000 {
> +			serial_0_pins: serial0_pinmux {

Please, no underscores in the node name.

> +				mux {

Fyi, you can put the pinctrl properties directly into the state node,
omitting the "mux" level.

> +					pins = "gpio16", "gpio17";
> +					function = "blsp_uart0";
> +					bias-disable;
> +				};
> +			};
> +

Apart from this the patch looks good.

Regards,
Bjorn
