From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 01/10] ARM: cygnus: fix link failures when
 CONFIG_COMMON_CLK_IPROC is disabled
Date: Wed, 21 Oct 2015 16:40:02 -0700
Message-ID: <20151021234002.GN19782@codeaurora.org>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
 <1444938513-10758-2-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444938513-10758-2-git-send-email-jonmason@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Mason <jonmason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 10/15, Jon Mason wrote:
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 88febf5..46ee475 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -9,10 +9,8 @@ config CLK_BCM_KONA
>  	  in the BCM281xx and BCM21664 families.
>  
>  config COMMON_CLK_IPROC
> -	bool "Broadcom iProc clock support"
> -	depends on ARCH_BCM_IPROC

Another patch added COMPILE_TEST here, so I've removed
COMPILE_TEST now.

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
