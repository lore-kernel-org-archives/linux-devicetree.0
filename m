From: srinivas kandagatla <srinivas.kandagatla@st.com>
Subject: Re: [PATCH 4/4] ARM: dts: add B2112 board support
Date: Fri, 31 Jan 2014 12:51:22 +0000
Message-ID: <52EB9C4A.7040105@st.com>
References: <1391093744-19905-1-git-send-email-patrice.chotard@st.com>
 <1391093744-19905-5-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391093744-19905-5-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Patrice CHOTARD <patrice.chotard@st.com>, Stuart Menefy <stuart.menefy@st.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, alexandre.torgue@st.com, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

On 30/01/14 14:55, Patrice CHOTARD wrote:
> From: Alexandre TORGUE <alexandre.torgue@st.com>
> 
> Add support for B2112  board based on STiD127 SoC.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  arch/arm/boot/dts/Makefile          |    3 ++-
>  arch/arm/boot/dts/stid127-b2112.dts |   35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/stid127-b2112.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d57c1a6..7173dca 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -247,7 +247,8 @@ dtb-$(CONFIG_ARCH_SPEAR6XX)+= spear600-evb.dtb
>  dtb-$(CONFIG_ARCH_STI)+= stih415-b2000.dtb \
>  	stih416-b2000.dtb \
>  	stih415-b2020.dtb \
> -	stih416-b2020.dtb
> +	stih416-b2020.dtb \
> +	stid127-b2112.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += \
>  	sun4i-a10-a1000.dtb \
>  	sun4i-a10-cubieboard.dtb \
> diff --git a/arch/arm/boot/dts/stid127-b2112.dts b/arch/arm/boot/dts/stid127-b2112.dts
> new file mode 100644
> index 0000000..b4507e3
> --- /dev/null
> +++ b/arch/arm/boot/dts/stid127-b2112.dts
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright (C) 2013 STMicroelectronics Limited.

2014

> + * Author: Alexandre Torgue <alexandre.torgue@st.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * publishhed by the Free Software Foundation.

s/publishhed/published/

> + */
> +/dts-v1/;
> +#include "stid127.dtsi"
> +
> +/ {
> +	model = "STiD127 B2112 Board";
> +	compatible = "st,stid127", "st,stid127-b2112";
> +
> +	memory{
> +		device_type = "memory";
> +		reg = <0x40000000 0x10000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyAS0,115200";
> +		linux,stdout-path = &uart2;
> +	};
> +
> +	aliases {
> +		ttyAS0 = &uart2;
> +	};
> +
> +	soc {
> +		uart2: serial@fe532000{
> +			status = "okay";
> +		};
> +	};
> +};
> 
