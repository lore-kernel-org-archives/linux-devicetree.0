From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V4 PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead
 (Nexus 5X) support
Date: Tue, 25 Oct 2016 03:41:22 -0700
Message-ID: <20161025104122.GG21964@mini-rhel.redhat.com>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
 <1477048273-32451-2-git-send-email-jeremymc@redhat.com>
 <20161021192147.GM26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161021192147.GM26139-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 12:21:47PM -0700, Stephen Boyd wrote:
> On 10/21, Jeremy McNicoll wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 5dd05de..abb366e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -1,6 +1,6 @@
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb apq8096-db820c.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> 
> One line per dtb please.
> 
> >  
> >  always		:= $(dtb-y)
> >  subdir-y	:= $(dts-dirs)
> > diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> > new file mode 100644
> > index 0000000..63fa3b0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
> > @@ -0,0 +1,42 @@
> > +/* Copyright (c) 2015, LGE Inc. All rights reserved.
> > + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "msm8992.dtsi"
> > +
> > +/ {
> > +	model = "LGE MSM8992 BULLHEAD rev-1.01";
> > +	compatible = "qcom,msm8992";
> > +	/* required for bootloader to select correct board */
> > +	qcom,board-id = <0xb64 0>;
> > +};
> 
> Why do we end
> > +
> > +/ {
> 
> and then restart the root node? Just keep the same node all the
> time please.
> 
> > +	aliases {
> > +		serial0 = &blsp1_uart2;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	soc {
> > +		serial@f991e000 {
> > +			status = "okay";
> > +			pinctrl-names = "default", "sleep";
> > +			pinctrl-0 = <&blsp1_uart2_default>;
> > +			pinctrl-1 = <&blsp1_uart2_sleep>;
> > +		};
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> > new file mode 100644
> > index 0000000..5d69a6b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> > @@ -0,0 +1,214 @@
> > +/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/qcom,gcc-msm8994.h>
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. MSM 8992";
> > +	compatible = "qcom,msm8992";
> > +	// msm-id and pmic-id are needed by bootloader for
> > +	// selecting correct blob
> > +	qcom,msm-id = <251 0>, <252 0>;
> > +	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
> 
> Can't these just be in the final dts file and not in the dtsi
> file? Technically the pmic pairings are a board choice and not an
> SoC choice so they shouldn't be here. The msm-id properties are
> a little easier to justify, but then I thought we decided to only
> put them in the boards that need them?
>

Board-id and pmic-id are currently in the board file,
(msm8992-bullhead-rev-101.dts) and msm-id is staying in msm8992.dtsi
as its a _REASONABLE_ compromise.  Same thing for 8994.

[...snip...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
