From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 08/13] ARM: dts: ipq4019: Add ipq4019-ap.dk07.1 common
 data
Date: Tue, 27 Mar 2018 10:20:34 -0700
Message-ID: <20180327172034.GK1403@tuxbook-pro>
References: <1521800336-19266-1-git-send-email-sricharan@codeaurora.org>
 <1521800336-19266-9-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521800336-19266-9-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri 23 Mar 03:18 PDT 2018, Sricharan R wrote:
> +#include "qcom-ipq4019.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK07.1";
> +	compatible = "qcom,ipq4019";

The board should set these, so you shouldn't need to specify them here.
And you should be able to find a more specific compatible for the board.

> +
[..]
> +		qpic-nand@79b0000 {
> +			status = "ok";

No pinmux for the qpic on these boards?

> +		};
> +	};
> +};

Regards,
Bjorn
