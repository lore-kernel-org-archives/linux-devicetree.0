From: Ola Jeppsson <ola@adapteva.com>
Subject: Re: [PATCH 4/5] ARM: dts: zynq: Split off Parallella Microserver
 device tree
Date: Thu, 12 Feb 2015 14:12:19 +0100
Message-ID: <54DCA6B3.1090903@adapteva.com>
References: <1423702513-4032-1-git-send-email-afaerber@suse.de> <1423702513-4032-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423702513-4032-5-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Michal Simek <michal.simek@xilinx.com>
Cc: Olof Johansson <olof@lixom.net>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2015-02-12 01:55, Andreas F=C3=A4rber wrote:
> The Microserver edition has neither HDMI nor USB.
>
> Cc: Ola Jeppsson <ola@adapteva.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>   arch/arm/boot/dts/Makefile                        |  1 +
>   arch/arm/boot/dts/zynq-parallella-microserver.dts | 19 ++++++++++++=
+++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 arch/arm/boot/dts/zynq-parallella-microserver.dt=
s
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a1c776b8dcec..42c75eeba584 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -606,6 +606,7 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D \
>   	wm8850-w70v2.dtb
>   dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
>   	zynq-parallella.dtb \
> +	zynq-parallella-microserver.dtb \
>   	zynq-zc702.dtb \
>   	zynq-zc706.dtb \
>   	zynq-zed.dtb \
> diff --git a/arch/arm/boot/dts/zynq-parallella-microserver.dts b/arch=
/arm/boot/dts/zynq-parallella-microserver.dts
> new file mode 100644
> index 000000000000..1f3bd2d27a93
> --- /dev/null
> +++ b/arch/arm/boot/dts/zynq-parallella-microserver.dts
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> + * Copyright (c) 2015 SUSE Linux GmbH
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +/dts-v1/;
> +#include "zynq-parallella1.dtsi"
> +
> +/ {
> +	model =3D "Adapteva Parallella Microserver Board";
> +};
To me it would make more sense to use the model number in the file name=
=2E
I.e., p1600 instead of microserver.

http://www.digikey.com/product-search/en?v=3D1554&FV=3Dfff40028%2Cfff80=
14d


// Ola

--=20
Phone: +46.733208642
Skype: olajep
Email: ola@adapteva.com
