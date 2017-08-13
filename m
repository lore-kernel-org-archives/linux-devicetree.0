From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 10/13] ARM: dts: rockchip: add saradc support for rv1108
Date: Sun, 13 Aug 2017 14:13:01 +0200
Message-ID: <2309743.33rDFhBfGp@phil>
References: <1502422578-30611-1-git-send-email-andy.yan@rock-chips.com> <1502423211-31216-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502423211-31216-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Freitag, 11. August 2017, 11:46:51 CEST schrieb Andy Yan:
> Add saradc device tree node for rv1108 soc
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 

> +	adc: adc@1038c000 {
> +		compatible = "rockchip,rv1108-saradc", "rockchip,rk3399-saradc";
> +		reg = <0x1038c000 0x100>;
> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +		#io-channel-cells = <1>;
> +		io-channel-ranges;

What do you need the io-channel-ranges for?
I.e. according to the documenation it is meant for when the adc is also
a "bus node" and has children that should inherit channels from it.

In all saradc uses so far we only have separate nodes referencing the
adc controller (like adc-keys etc), so this does not look like it is needed?


Heiko
