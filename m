From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add roc-rk3328-cc board
Date: Mon, 29 Jan 2018 17:21:27 -0600
Message-ID: <20180129232127.unanaujy44q42bul@rob-hp-laptop>
References: <20180106094538.15568-1-djw@t-chip.com.cn>
 <20180123021017.24110-1-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180123021017.24110-1-djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Levin Du <zslevin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 23, 2018 at 10:10:17AM +0800, djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org wrote:
> From: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
> 
> Hi all,
> 
> v3:
> Use pmic@18 instead of rk805@18
> Use macro definition RK_Pxx in gpio number
> 
> v2:
> Use SPDX license tag
> 
> Thanks.

All of this above belongs below the '---' so it is not in the commit 
msg.

Otherwise,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> The roc-rk3328-cc is a credit card size single board computer using the
> Rockchip RK3328 Quad-Core ARM Cortex A53 64-Bit Processor and supporting
> up to 2GB 2133MHz LPDDR4 memory. It provides eMMC module socket, MicroSD
> Card slot, USB 2.0/3.0, Gigabit Ethernet, HDMI/CVBS, Infrared Receiver,
> SPDIF/I2S, and SPI/I2C/UART/PWM interfaces.
> 
> The devicetree currently supports basic peripherals.
> 
> Signed-off-by: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     | 276 +++++++++++++++++++++
>  3 files changed, 281 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
