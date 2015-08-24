From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Hi6220 mailbox node
Date: Mon, 24 Aug 2015 11:00:54 +0100
Message-ID: <20150824100054.GB7139@leverpostej>
References: <1440039239-8772-1-git-send-email-leo.yan@linaro.org>
 <1440039239-8772-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440039239-8772-4-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <kongfei>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 03:53:59AM +0100, Leo Yan wrote:
> On Hi6220, below memory regions in DDR have specific purpose:
> 
>   0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
>   0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
>   0x06df,f000 - 0x06df,ffff: For mailbox message data.
> 
> This patch reserves these memory regions and add device node for
> mailbox in dts.
> 
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 20 +++++++++++++++++---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  8 ++++++++
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index e36a539..d5470d3 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -7,9 +7,6 @@
>  
>  /dts-v1/;
>  
> -/*Reserved 1MB memory for MCU*/
> -/memreserve/ 0x05e00000 0x00100000;
> -
>  #include "hi6220.dtsi"
>  
>  / {
> @@ -28,4 +25,21 @@
>  		device_type = "memory";
>  		reg = <0x0 0x0 0x0 0x40000000>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		mcu-buf@05e00000 {
> +			no-map;
> +			reg = <0x0 0x05e00000 0x0 0x00100000>,	/* MCU firmware buffer */
> +			      <0x0 0x0740f000 0x0 0x00001000>;	/* MCU firmware section */
> +		};
> +
> +		mbox-buf@06dff000 {
> +			no-map;
> +			reg = <0x0 0x06dff000 0x0 0x00001000>;	/* Mailbox message buf */
> +		};
> +	};
>  };

As mentioned in my other reply [1], you should fix your EFI memory map
instead. There is no reason for this at all.

Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-August/365921.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
