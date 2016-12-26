From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6: Add Savageboard common file
Date: Mon, 26 Dec 2016 14:26:33 -0200
Message-ID: <CAOMZO5CV3Dgzr-uV8fcp9xCPcwb_CfsvcgE4Onb9wjuK-MmDug@mail.gmail.com>
References: <20161209010436.7994-1-woogyom.kim@gmail.com> <20161209010436.7994-2-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161209010436.7994-2-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 8, 2016 at 11:04 PM, Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> * Memory
>   memblock for DDR3 1GB
>
> * Regulator
>   3.3V for panel and backlight.
>
> * Display
>   Enable HDMI and LVDS panel. Savageboard supports AVIC TM097TDH02 panel
>   which is compatible with Hannstar HSD100PXN1, so reuse it.
>
> * Clock
>   The commit d28be499c45e6 is applied to support LVDS and HDMI output
>   simultaneously.
>
> * Pinmux
>   eMMC, ethernet, HDMI, I2C, power button, PWM, SD card and UART.
>
> * Others
>   Enable ethernet, UART1 debug, USB host, USDHC3 for microSD card and
>   USDHC4 for built-in eMMC storage.
>
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
