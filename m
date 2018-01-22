From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add roc-rk3328-cc board
Date: Mon, 22 Jan 2018 11:40:47 +0100
Message-ID: <1977166.SIloaIvObo@phil>
References: <20180106094538.15568-1-djw@t-chip.com.cn> <20180120095404.32117-1-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180120095404.32117-1-djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Levin Du <zslevin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Levin,

Am Samstag, 20. Januar 2018, 17:54:04 CET schrieb djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org:
> From: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
> 
> Hi all,
>   This version uses SPDX license tag.
> 
> The roc-rk3328-cc is a credit card size single board computer using the
> Rockchip RK3328 Quad-Core ARM Cortex A53 64-Bit Processor and supporting
> up to 2GB 2133MHz LPDDR4 memory. It provides eMMC module socket, MicroSD
> Card slot, USB 2.0/3.0, Gigabit Ethernet, HDMI/CVBS, Infrared Receiver,
> SPDIF/I2S, and SPI/I2C/UART/PWM interfaces.
> 
> The devicetree currently supports basic peripherals.
> 
> Signed-off-by: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>

> +&i2c1 {
> +	status = "okay";
> +
> +	rk805: rk805@18 {

As noted by Rob in his review, this should be
	rk805: pmic@18 {

While I'd normally just change that myself when applying it looks like
you also got comments from Andy to address, so you could change this too.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
