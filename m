From: Richard Zhao <richard.zhao@linaro.org>
Subject: Re: [PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev
Date: Sat, 17 Dec 2011 15:56:15 +0800
Message-ID: <20111217075612.GA2010@richard-laptop>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
 <1324031462-24961-4-git-send-email-richard.zhao@linaro.org>
 <21672683C5A3814BB4DB938EBE482DE40A1AE8EF74@IAD2MBX09.mex02.mlsrvr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <21672683C5A3814BB4DB938EBE482DE40A1AE8EF74@IAD2MBX09.mex02.mlsrvr.com>
Sender: cpufreq-owner@vger.kernel.org
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "davej@redhat.com" <davej@redhat.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "eric.miao@linaro.org" <eric.miao@linaro.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 16, 2011 at 11:35:39AM -0500, Mark Langsdorf wrote:
> Is there a portable/generic approach for other drivers that may
> want to use arm-cpufreq.c? arm_clk is not normally defined for
> my SoC and I don't see an easy way to pull it in.
Could you tell me the details? Is your board arch/arm/mach-highbank/ Rob
maintained?
clk API is the most generic way for arm as far as I find out.

Thanks
Richard
> 
> --Mark Langsdorf
> Calxeda, Inc.
> 
> ________________________________________
> From: Richard Zhao [richard.zhao@linaro.org]
> Sent: Friday, December 16, 2011 4:31 AM
> To: linux-arm-kernel@lists.infradead.org; cpufreq@vger.kernel.org; devicetree-discuss@lists.ozlabs.org
> Cc: linux@arm.linux.org.uk; davej@redhat.com; kernel@pengutronix.de; shawn.guo@linaro.org; eric.miao@linaro.org; Mark Langsdorf; linaro-dev@lists.linaro.org; patches@linaro.org; Richard Zhao
> Subject: [PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev
> 
> cpufreq needs cpu clock to change frequency.
> 
> Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> ---
>  arch/arm/mach-imx/clock-imx6q.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
> index 039a7ab..72acbc2 100644
> --- a/arch/arm/mach-imx/clock-imx6q.c
> +++ b/arch/arm/mach-imx/clock-imx6q.c
> @@ -1911,6 +1911,7 @@ static struct clk_lookup lookups[] = {
>         _REGISTER_CLOCK(NULL, "gpmi_io_clk", gpmi_io_clk),
>         _REGISTER_CLOCK(NULL, "usboh3_clk", usboh3_clk),
>         _REGISTER_CLOCK(NULL, "sata_clk", sata_clk),
> +       _REGISTER_CLOCK(NULL, "cpu", arm_clk),
>  };
> 
>  int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
> --
> 1.7.5.4
