From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 RESEND 7/9] pinctrl: Add pinctrl driver for the RK805
 PMIC
Date: Mon, 21 Aug 2017 09:16:31 +0100
Message-ID: <20170821081631.p432zapqkrjzmwj7@dell>
References: <20170821012842.17875-1-heiko@sntech.de>
 <20170821012842.17875-8-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170821012842.17875-8-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Aug 2017, Heiko Stuebner wrote:

> From: Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> RK805 is one of Rockchip PMICs family, it has 2 output only GPIOs.
> 
> This driver is also designed for other Rockchip PMICs to expend.
> Different PMIC maybe have different pin features, for example,
> RK816 has one pin which can be used for TS or GPIO(input/out).
> The mainly difference between PMICs pins are pinmux, direction
> and output value, that is 'struct rk805_pin_config'.
> 
> Signed-off-by: Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/pinctrl/Kconfig         |   9 +
>  drivers/pinctrl/Makefile        |   1 +
>  drivers/pinctrl/pinctrl-rk805.c | 493 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 503 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-rk805.c

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
