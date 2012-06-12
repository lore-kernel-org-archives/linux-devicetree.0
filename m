From: Shubhrajyoti <shubhrajyoti@ti.com>
Subject: Re: [PATCH RESEND v4] input: keyboard: Add keys driver for the LPC32xx
 SoC
Date: Tue, 12 Jun 2012 10:58:01 +0530
Message-ID: <4FD6D361.2020305@ti.com>
References: <1339443891-15197-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1339443891-15197-1-git-send-email-stigge@antcom.de>
Sender: linux-input-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: dmitry.torokhov@gmail.com, axel.lin@gmail.com, riyer@nvidia.com, michael.hennerich@analog.com, grant.likely@secretlab.ca, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Tuesday 12 June 2012 01:14 AM, Roland Stigge wrote:
> +
> +struct lpc32xx_kscan_drv {
> +	struct input_dev *input;
> +	struct lpc32xx_kscan_cfg *kscancfg;
> +	struct clk *clk;
> +	void __iomem *kscan_base;
> +	int irq;
Do you really need this irq field?  It is used in the probe and remove only.

> +	u8 lastkeystates[8];
> +	u32 io_p_start;
> +	u32 io_p_size;
> +};

