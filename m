From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: imx: add timer stop flag to ARM power off
 state
Date: Fri, 2 Feb 2018 14:16:41 +0800
Message-ID: <20180202061605.GL20833@dragon>
References: <20180110210453.19264-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180110210453.19264-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 10:04:47PM +0100, Stefan Agner wrote:
> When the CPU is in ARM power off state the ARM architected
> timers are stopped. The flag is already present in the higher
> power WAIT mode.
> 
> This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
> Without the flag the kernel freezes when the timer enters the
> first time ARM power off mode.
> 
> Note: The default timer on i.MX6SX is the i.MX GPT timer which is
> not disabled during CPU idle. However, the timer is not affected
> by the CPUIDLE_FLAG_TIMER_STOP flag. The flag only affects CPU
> local timers.
> 
> Cc: Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Reviewed-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
