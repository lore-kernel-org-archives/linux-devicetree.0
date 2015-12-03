From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Thu, 03 Dec 2015 10:36:05 +0100
Message-ID: <1728470.0OiiXMcl88@wuerfel>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449110668-23647-1-git-send-email-xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 03 December 2015 10:44:28 Jiancheng Xue wrote:

> +
> +/dts-v1/;
> +#include "hi3519.dtsi"
> +
> +/ {
> +	model = "HiSilicon HI3519 DEMO Board";
> +	compatible = "hisilicon,hi3519";
> +
> +	chosen {
> +		bootargs = "mem=64M console=ttyAMA0,115200 early_printk \
> +root=/dev/mtdblock2 rootfstype=jffs2 \
> +mtdparts=hi_sfc:1M(boot),4M(kernel),11M(rootfs)";
> +	};

Most of the arguments should be dropped and replaced with the respective
DT properties in this file:

mem:		/memory (you have that already, but the size seems wrong)
console:	/chosen/stdout-path
early_printk:	just drop this, maybe use "earlycon")
root:		this one is fine
rootfstype:	should not be needed
mtdparts:	use nodes below the MTD device


> +
> +#include "skeleton.dtsi"
> +#include <dt-bindings/clock/hi3519-clock.h>
> +/ {
> +	aliases {
> +		serial0 = &uart0;
> +	};

Move this into the .dts file.

> +
> +			uart0: uart@12100000 {

rename to serial@12100000

> +			dual_timer1: dual_timer@12001000 {
> +				compatible = "arm,sp804", "arm,primecell";
> +				interrupts = <0 66 4>, <0 67 4>;
> +				reg = <0x12001000 0x1000>;
> +				clocks = <&crg HI3519_FIXED_3M>;
> +				status = "disable";
> +			};

rename to timer@12001000

> +		sysctrl: system-controller@12020000 {
> +			compatible = "hisilicon,sysctrl";
> +			reg = <0x12020000 0x1000>;
> +			reboot-offset = <0x4>;
> +		};

Is this one identical to the one in hip04?

If not, pick a new unique compatible string

> +
> +		crg: crg@12010000 {
> +			compatible = "hisilicon,hi3519-crg";


what is a "crg"? Is there a standard name for these?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
