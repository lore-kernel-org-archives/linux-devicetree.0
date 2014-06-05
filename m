From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 1/6] thermal: sti: Supply Device Tree
 documentation
Date: Thu, 5 Jun 2014 13:01:47 +0100
Message-ID: <20140605120147.GA7446@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1401442715-6350-1-git-send-email-lee.jones@linaro.org>
 <1401442715-6350-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401442715-6350-2-git-send-email-lee.jones@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@stlinux.com, linux-pm@vger.kernel.org, eduardo.valentin@ti.com, rui.zhang@intel.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

> +Example:
> +
> +	temp1@fdfe8000 {
> +		compatible	= "st,stih416-mpe-thermal";
> +		reg		= <0xfdfe8000 0x10>;
> +		clock-names	= "thermal";
> +		clocks		= <&CLK_M_MPETHSENS>;
> +		interrupts	= <GIC_SPI 23 IRQ_TYPE_NONE>;
> +	};

With the renaming of the STI device tree from upper to lower
case. The clock name in this example also needs updating.

Once fixed: -
 Acked-by: Peter Griffin <peter.griffin@linaro.org>

Regards,

Peter
