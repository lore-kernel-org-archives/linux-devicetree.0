From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and
 evaluation board dts
Date: Fri, 13 Mar 2015 10:52:07 +0000
Message-ID: <20150313105207.GB3592@leverpostej>
References: <1426182985-10425-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426182985-10425-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

> +/ {
> +	chosen {
> +		stdout-path = &blsp1_uart2;
> +	};

It would be good if we had the configuration too (see
Documentation/devicetree/bindings/chosen.txt), as that avoids any
reliance on kernel defaults.

You can refer to an alias, so this could be:

aliases {
	serial0 = &blsp1_uart2;
};

chosen {
	stdout-path = "serial0:115200n8";
};

...assuming that 115200n8 is correct for your UART, of course.


[...]

> +#include "skeleton.dtsi"

I'd like to get rid of skeleton.dtsi; it causes more problems than it
solves (the address/size cells mismatch is confusing and hidden, people
forget to fill in memory nodes appropriately, etc).

Please remove this include and place appropriate #address-cells and #size-cells here.

I'd strongly recommend going with /#size-cells = <2>; it' will save on a
lot of pain if you need to add PCIe or something with large ranges
later. If things all fall in 4GB within the SoC then have
/soc/#size=cells = <1> and an appropriate /soc/ranges property.

I note this DT doesn't have any memory nodes. Is that an accident or
does the loader fill that in?

If the latter, have an empty node with a comment to that effect.

Mark.
