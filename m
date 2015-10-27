From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] clk: bcm: Add BCM63138 clock support
Date: Tue, 27 Oct 2015 13:41:11 -0700
Message-ID: <20151027204111.GO19782@codeaurora.org>
References: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com>
 <1445917997-3629-3-git-send-email-f.fainelli@gmail.com>
 <20151027174659.GM19782@codeaurora.org>
 <562FD230.5090202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <562FD230.5090202@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/27, Florian Fainelli wrote:
> On 27/10/15 10:46, Stephen Boyd wrote:
> > On 10/26, Florian Fainelli wrote:
> >> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> >> index 85260fb96b36..a0c18528b70d 100644
> >> --- a/drivers/clk/bcm/Kconfig
> >> +++ b/drivers/clk/bcm/Kconfig
> >> @@ -1,3 +1,13 @@
> >> +config CLK_BCM_63XX
> >> +	bool "Broadcom BCM63xx clock support"
> >> +	depends on ARCH_BCM_63XX || COMPILE_TEST
> >> +	depends on COMMON_CLK
> >> +	select COMMON_CLK_IPROC
> >> +	default y
> > 
> > perhaps default CLK_BCM_63XX?
> 
> Did you mean default ARCH_BCM_63XX instead?
> 

Yes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
