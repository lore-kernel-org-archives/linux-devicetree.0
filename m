From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 25 Aug 2015 12:36:12 +0100
Message-ID: <55DC532C.3020005@arm.com>
References: <1439977055-1747-1-git-send-email-leo.yan@linaro.org> <1439977055-1747-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439977055-1747-4-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 19/08/15 10:37, Leo Yan wrote:
> On Hi6220, below memory regions in DDR have specific purpose:
>
>    0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
>    0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
>    0x06df,f000 - 0x06df,ffff: For mailbox message data.
>

Unless I am reading the DTS file completely wrong, I don't think the 
above memory regions are in DDR as per the memory node.

> This patch reserves these memory regions and add device node for
> mailbox in dts.
>
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 20 +++++++++++++++++---
>   arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  8 ++++++++
>   2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index e36a539..d5470d3 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -7,9 +7,6 @@
>
>   /dts-v1/;
>
> -/*Reserved 1MB memory for MCU*/
> -/memreserve/ 0x05e00000 0x00100000;
> -
>   #include "hi6220.dtsi"
>
>   / {
> @@ -28,4 +25,21 @@
>   		device_type = "memory";
>   		reg = <0x0 0x0 0x0 0x40000000>;
>   	};

I have no access to the spec, but I read this as 1GB RAM @0x0
Unless this entry is completely wrong, what your commit log claims is
incorrect. If this entry is wrong I wonder how is it booting with this
DT then.

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

So I don't see how can this be part of DDR ? Or at-least part of DDR
that's mapped by kernel ?

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
