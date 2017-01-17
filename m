From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] rtc: stm32: use 0 instead of ~PWR_CR_DBP in regmap_update_bits
Date: Tue, 17 Jan 2017 11:43:40 +0100
Message-ID: <20170117104340.rn2upxp3z7zzmg32@piout.net>
References: <1484557058-21601-1-git-send-email-amelie.delaunay@st.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBZ7K67BQKGQEJEU46HQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1484557058-21601-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/01/2017 at 09:57:38 +0100, Amelie Delaunay wrote :
> Using the ~ operator on a BIT() constant results in a large 'unsigned long'
> constant that won't fit into an 'unsigned int' function argument on 64-bit
> architectures, resulting in a harmless build warning in x86 allmodconfig:
> 
> drivers/rtc/rtc-stm32.c: In function 'stm32_rtc_probe':
> drivers/rtc/rtc-stm32.c:651:51: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
>   regmap_update_bits(rtc->dbp, PWR_CR, PWR_CR_DBP, ~PWR_CR_DBP);
> 
> As PWR_CR_DBP mask prevents other bits to be cleared, replace all
> ~PWR_CR_DBP by 0.
> 
> Fixes: 4e64350f42e2 ("rtc: add STM32 RTC driver")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
> ---
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
