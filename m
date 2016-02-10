From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: lpc32xx: add HCLK PLL output configuration
Date: Wed, 10 Feb 2016 12:46:37 -0800
Message-ID: <20160210204637.GJ30978@codeaurora.org>
References: <1455130352-25860-1-git-send-email-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455130352-25860-1-git-send-email-slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/10, slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
> 
> This patch add the support to setup the HCLK PLL output
> using the "assigned-clock-rates" parameter in the device tree.
> 
> If the option is not use, the clock setup by the kickstart
> and/or bootloader remain unchanged.
> 
> The previous kernel version did not change the clock frequency
> output setup by the kickstart and/or bootloader;
> this version always setup the clock frequency output to 208MHz.
> 
> Signed-off-by: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>
> ---

I couldn't find any usage of this driver in the tree so I just
applied this to clk-next. If it needs to go into some immutable
branch please let me know.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
