From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM64: dts: meson-axg: uart: drop legacy
 compatible name from EE UART
Date: Mon, 08 Jan 2018 09:56:42 +0100
Message-ID: <1515401802.5048.71.camel@baylibre.com>
References: <20180106001044.108163-1-yixun.lan@amlogic.com>
         <20180106001044.108163-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180106001044.108163-3-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2018-01-06 at 08:10 +0800, Yixun Lan wrote:
> When update the clock info for the UART controller in the EE domain,
> the driver explicitly require 'pclk' in order to work properly.
> 
> With current logic of the code, the driver will go for the legacy clock probe
> routine[1] if it find current compatible string match to 'amlogic,meson-uart',
> which result in not requesting the 'pclk' clock, thus break the driver in the end.
> 
> [1] drivers/tty/serial/meson_uart.c:685
> 
>         /* Use legacy way until all platforms switch to new bindings */
>         if (of_device_is_compatible(pdev->dev.of_node, "amlogic,meson-uart"))
>                 ret = meson_uart_probe_clocks_legacy(pdev, port);
>         else
>                 ret = meson_uart_probe_clocks(pdev, port);

I don't think you should add this code snip here. Anybody can look at the driver
code to see that

> 
> Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
