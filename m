From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 10/10] drivers: clk: Add ZynqMP clock driver
Date: Wed, 30 May 2018 14:17:58 -0700
Message-ID: <c042fd9b-85cb-f0d3-101c-f78f3dc4fc44@infradead.org>
References: <1527713725-1086-1-git-send-email-jollys@xilinx.com>
 <1527713725-1086-11-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527713725-1086-11-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tejas Patel <tejasp@xilinx.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 05/30/2018 01:55 PM, Jolly Shah wrote:
> From: Jolly Shah <jolly.shah@xilinx.com>


> diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
> new file mode 100644
> index 0000000..fe815f7
> --- /dev/null
> +++ b/drivers/clk/zynqmp/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config COMMON_CLK_ZYNQMP
> +	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
> +	depends on OF
> +	depends on ARCH_ZYNQMP || COMPILE_TEST
> +	depends on ZYNQMP_FIRMWARE
> +	help
> +	  Support for the Zynqmp Ultrascale clock controller.
> +	  It has a dependency on the PMU firmware.
> +	  Say Y if you want to support clock support

	  Say Y if you want to include clock support.


-- 
~Randy
