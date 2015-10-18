From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4] rtc: pcf8563: add CLKOUT to common clock framework
Date: Sun, 18 Oct 2015 02:30:50 +0200
Message-ID: <20151018003050.GZ3421@piout.net>
References: <1444995089-14493-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444995089-14493-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Georg.Soffel-k21M0aUVSxZWk0Htik3J/w@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/10/2015 at 13:31:29 +0200, Heiko Schocher wrote :
> Add the clkout output clk to the common clock framework.
> Disable the CLKOUT of the RTC after power-up.
> After power-up/reset of the RTC, CLKOUT is enabled by default,
> with CLKOUT enabled the RTC chip has 2-3 times higher power
> consumption.
> 
> Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
> ---
> 
> Changes in v4:
> - add comments from Alexandre Belloni
>   - use devm_clk_register() instead of clk_register()
>   - rework Documentation
> 
> Changes in v3:
> - use CONFIG_COMMON_CLK for common clk framework
>   changes
> 
> Changes in v2:
> - add comments from Alexandre Belloni
>   - remove the DT property, instead
>     register for the CLKOUT a clk in the common
>     clk framework. The clk is disabled by default.
> 
>  Documentation/devicetree/bindings/rtc/pcf8563.txt |  25 ++++
>  drivers/rtc/rtc-pcf8563.c                         | 170 +++++++++++++++++++++-
>  2 files changed, 194 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
