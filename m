From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 12/13] ARM: STi: DT: STiH410: Add STiH410 SoC clock support.
Date: Mon, 10 Nov 2014 10:20:39 +0100
Message-ID: <54608367.6010901@st.com>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org> <1415361475-6218-13-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415361475-6218-13-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 11/07/2014 12:57 PM, Peter Griffin wrote:
> The STiH410 is an advanced multi-HD AVC processor with 3D graphics acceleration
> and 1.5-GHz ARM Cortex-A9 SMP CPU part of the stih407 family.
>
> It has wide connectivity including USB 3.0, PCI-e, SATA and gigabit ethernet.
>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm/boot/dts/Makefile           |   1 +
>   arch/arm/boot/dts/stih410-b2120.dts  |  42 +++++
>   arch/arm/boot/dts/stih410-clock.dtsi | 338 +++++++++++++++++++++++++++++++++++
You are adding a new board also, not only clocks.
Please fix the commit title.

>   3 files changed, 381 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stih410-b2120.dts
>   create mode 100644 arch/arm/boot/dts/stih410-clock.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 38c89ca..04cf4a4 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -409,6 +409,7 @@ dtb-$(CONFIG_ARCH_SPEAR3XX)+= spear300-evb.dtb \
>   	spear320-hmi.dtb
>   dtb-$(CONFIG_ARCH_SPEAR6XX)+= spear600-evb.dtb
>   dtb-$(CONFIG_ARCH_STI)+= stih407-b2120.dtb \
> +	stih410-b2120.dtb \
>   	stih415-b2000.dtb \
>   	stih415-b2020.dtb \
>   	stih416-b2000.dtb \
> diff --git a/arch/arm/boot/dts/stih410-b2120.dts b/arch/arm/boot/dts/stih410-b2120.dts
> new file mode 100644
> index 0000000..06ee73b
> --- /dev/null
> +++ b/arch/arm/boot/dts/stih410-b2120.dts
> @@ -0,0 +1,42 @@
> +/*
> + * Copyright (C) 2014 STMicroelectronics (R&D) Limited.
> + * Author: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +/dts-v1/;
> +#include "stih407-clock.dtsi"
This file should be included by a SoC dtsi file, not a board file, no?
> +#include "stih407-family.dtsi"
> +#include "stihxxx-b2120.dtsi"
> +/ {
> +	model = "STiH410 B2120";
> +	compatible = "st,stih410-b2120", "st,stih410";
> +
> +	aliases {
> +		ohci0 = &ohci0;
> +		ehci0 = &ehci0;
> +		ohci1 = &ohci1;
> +		ehci1 = &ehci1;
> +	};
> +
> +	soc {
> +
> +		ohci0: usb@9a03c00 {
> +			status = "okay";
> +		};
> +
> +		ehci0: usb@9a03e00 {
> +			status = "okay";
> +		};
> +
> +		ohci1: usb@9a83c00 {
> +			status = "okay";
> +		};
> +
> +		ehci1: usb@9a83e00 {
> +			status = "okay";
> +		};
> +	};
> +};
>
<snip>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
