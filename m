From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V3 1/3] arm64: dts: Add Hi6220 gpio configuration nodes
Date: Tue, 19 Jan 2016 13:37:19 +0000
Message-ID: <569E3C0F.3040603@arm.com>
References: <1453200681-26406-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453200681-26406-1-git-send-email-zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 19/01/16 10:51, Zhong Kaihua wrote:
> arm64: dts: Add Hi6220 gpio configuration nodes
>
> Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>                 Kong Xinwei <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/gpio/gpio-hi6220.txt       |  23 +
>   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   1 +
>   arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 259 +++++++++
>   arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi      | 607 +++++++++++++++++++++
>   4 files changed, 890 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
>   create mode 100644 arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt b/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
> new file mode 100644
> index 0000000..a9cbf21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
> @@ -0,0 +1,23 @@
> +Hisilicon Hi6220 GPIO controller bindings
> +
> +Required properties:
> +	- compatible: "arm,pl061","arm,primecell"
> +	- gpio-controller: Marks the device node as a GPIO controller.
> +	- #gpio-cells: Should be 2. See gpio.txt in this directory for a
> +		 description of	the cells format.
> +	- interrupt-controller: Mark the device node as an interrupt controller
> +

Why do you need extra binding document here as the compatible is same as
[1] ? You can extend that if required and add example there IMO.

-- 
Regards,
Sudeep

[1] Documentation/devicetree/bindings/gpio/pl061-gpio.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
