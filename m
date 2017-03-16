From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] mfd: rk808: Add RK805 support
Date: Thu, 16 Mar 2017 09:18:39 +0000
Message-ID: <20170316091839.glh2ugaumdmewo33@dell>
References: <1489630504-11328-1-git-send-email-zhangqing@rock-chips.com>
 <1489630504-11328-5-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489630504-11328-5-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Mar 2017, Elaine Zhang wrote:

> The RK805 chip is a Power Management IC (PMIC) for multimedia and handheld
> devices. It contains the following components:
> 
>     - Regulators
>     - RTC
>     - Clocking
> 
> Both RK808 and RK805 chips are using a similar register map,
> so we can reuse the RTC and Clocking functionality.
> 
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  drivers/clk/Kconfig |   4 +-
>  drivers/mfd/Kconfig |   4 +-
>  drivers/mfd/rk808.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/rtc/Kconfig |   4 +-
>  4 files changed, 128 insertions(+), 6 deletions(-)

Did you see my review of this patch already?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
