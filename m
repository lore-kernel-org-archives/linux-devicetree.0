From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] MIPS: dts: Add VoCore2 board
Date: Thu, 17 Aug 2017 16:36:28 -0500
Message-ID: <20170817213628.nrkeuek7vu6oebfx@rob-hp-laptop>
References: <1502814773-40842-1-git-send-email-harvey.hunt@imgtec.com>
 <1502814773-40842-2-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1502814773-40842-2-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 15, 2017 at 05:32:52PM +0100, Harvey Hunt wrote:
> The VoCore2 board is a low cost MT7628A based board with 128MB RAM, 16MB
> flash and multiple external peripherals.
> 
> This initial DTS provides enough support to get to userland and use the USB
> port.
> 
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> ---
>  MAINTAINERS                           |  6 ++++++
>  arch/mips/boot/dts/ralink/Makefile    |  1 +
>  arch/mips/boot/dts/ralink/vocore2.dts | 18 ++++++++++++++++++
>  arch/mips/ralink/Kconfig              |  5 +++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ralink/vocore2.dts
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f7721d..82dcc6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14127,6 +14127,12 @@ L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
>  F:	drivers/net/vmxnet3/
>  
> +VOCORE VOCORE2 BOARD
> +M:	Harvey Hunt <harveyhuntnexus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +L:	linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> +S:	Maintained
> +F:	arch/mips/boot/dts/ralink/vocore2.dts
> +
>  VOLTAGE AND CURRENT REGULATOR FRAMEWORK
>  M:	Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  M:	Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
> index 2a72259..a191788 100644
> --- a/arch/mips/boot/dts/ralink/Makefile
> +++ b/arch/mips/boot/dts/ralink/Makefile
> @@ -2,6 +2,7 @@ dtb-$(CONFIG_DTB_RT2880_EVAL)	+= rt2880_eval.dtb
>  dtb-$(CONFIG_DTB_RT305X_EVAL)	+= rt3052_eval.dtb
>  dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
>  dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
> +dtb-$(CONFIG_DTB_VOCORE2)		+= vocore2.dtb
>  
>  obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
>  
> diff --git a/arch/mips/boot/dts/ralink/vocore2.dts b/arch/mips/boot/dts/ralink/vocore2.dts
> new file mode 100644
> index 0000000..7591340
> --- /dev/null
> +++ b/arch/mips/boot/dts/ralink/vocore2.dts
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +#include "mt7628a.dtsi"
> +
> +/ {
> +	compatible = "vocore,vocore2", "ralink,mt7628a-soc";

Is vocore,vocore2 documented?

> +	model = "VoCore2";
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x8000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS2,115200";
> +		stdout-path = "serial2:115200";
> +	};
> +};
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index 710b04c..c2b2c2d 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -82,6 +82,11 @@ choice
>  		depends on SOC_MT7620
>  		select BUILTIN_DTB
>  
> +	config DTB_VOCORE2
> +		bool "VoCore2"
> +		depends on SOC_MT7620
> +		select BUILTIN_DTB
> +
>  endchoice
>  
>  endif
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
