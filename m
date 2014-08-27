From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: dts: hix5hd2: add gmac node
Date: Wed, 27 Aug 2014 15:54:06 +0100
Message-ID: <20140827145406.GA9737@leverpostej>
References: <1409143114-23311-1-git-send-email-zhangfei.gao@linaro.org>
 <1409143114-23311-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409143114-23311-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 01:38:29PM +0100, Zhangfei Gao wrote:
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/hisi-x5hd2-dkb.dts |   26 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/hisi-x5hd2.dtsi    |   16 ++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
> index 05b44c2..0344de0 100644
> --- a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
> +++ b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
> @@ -51,3 +51,29 @@
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&gmac0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	phy-handle = <&phy2>;
> +	phy-mode = "mii";
> +	mac-address = [00 00 00 00 00 00];

If this is just so space is pre-allocated for the bootloader to patch
this, please place a comment to that effect.

Otherwise that doesn't look right.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
