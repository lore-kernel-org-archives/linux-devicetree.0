From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: rk322x: add spi node and spi pinctrl
Date: Sun, 06 Aug 2017 12:38:36 +0200
Message-ID: <2042865.sKzShaQPbs@phil>
References: <1501727810-31761-1-git-send-email-huibin.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501727810-31761-1-git-send-email-huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: sofia-kernel.list-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Donnerstag, 3. August 2017, 10:36:49 CEST schrieb Huibin Hong:
> Add spi node and spi pinctrl for rk322x
> 
> Signed-off-by: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

[...]


> +	};
> +
>  	wdt: watchdog@110a0000 {
>  		compatible = "rockchip,rk322x-wdt", "snps,dw-wdt";

Please make sure a patch actually applies against the mainline tree,
as here the the compatible for the watchdog looks slightly different.

In any case I've fixed that and applied it for 4.14


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
