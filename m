From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [RFC PATCH v2 03/14] ARM: sunxi: add Allwinner
 ARMv5 SoCs
Date: Wed, 21 Nov 2018 07:36:38 +0800
Message-ID: <464C921F-1AA7-4475-9085-25D03D21AFE2@aosc.io>
References: <cover.1542546735.git.mesihkilinc@gmail.com> <8f07fac854eaaea63e199fe0e80cf20004dffbdf.1542546735.git.mesihkilinc@gmail.com> <20181120084245.bnjdaf647e6tdlku@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBGVV2LPQKGQEHBO6Z3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181120084245.bnjdaf647e6tdlku@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B411=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:42:45, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Sun, Nov 18, 2018 at 05:17:02PM +0300, Mesih Kilinc wrote:
>> Add option for Allwinner ARMv5 SoCs and SoC F1C100s (which has a die
>> used for many new F-series products, including F1C100A, F1C100s,
>F1C200s,
>> F1C500, F1C600).
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/mach-sunxi/Kconfig    | 14 +++++++++++++-
>>  arch/arm/mach-sunxi/Makefile   |  1 +
>>  arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c
>>=20
>> diff --git a/arch/arm/mach-sunxi/Kconfig
>b/arch/arm/mach-sunxi/Kconfig
>> index 5db17ec..066644c 100644
>> --- a/arch/arm/mach-sunxi/Kconfig
>> +++ b/arch/arm/mach-sunxi/Kconfig
>> @@ -1,6 +1,6 @@
>>  menuconfig ARCH_SUNXI
>>  	bool "Allwinner SoCs"
>> -	depends on ARCH_MULTI_V7
>> +	depends on ARCH_MULTI_V5 || ARCH_MULTI_V7
>>  	select ARCH_HAS_RESET_CONTROLLER
>>  	select CLKSRC_MMIO
>>  	select GENERIC_IRQ_CHIP
>> @@ -64,4 +64,16 @@ config ARCH_SUNXI_MC_SMP
>> =20
>>  endif
>> =20
>> +if ARCH_MULTI_V5
>> +
>> +config ARCH_SUNXI_V5
>> +	bool
>> +	select SUN4I_TIMER
>
>If SUN4I_TIMER is needed both by the armv5 and armv7 cores, why did we
>need to move it out of ARCH_SUNXI?
>
>> +config MACH_SUNIV
>> +	bool "Allwinner new F-series (suniv) SoCs support"
>
>I would drop the "new" here.

Sorry, but old F-series SoCs are not suniv. They are sunii or sun3i.

>
>> +++ b/arch/arm/mach-sunxi/sunxi_v5.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Device Tree support for Allwinner F series SoCs
>> + *
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + * Copyright (C) 2018 Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>> +
>> +#include <asm/mach/arch.h>
>> +
>> +static const char * const suniv_board_dt_compat[] =3D {
>> +	"allwinner,suniv-f1c100s",
>> +	NULL,
>> +};
>> +
>> +DT_MACHINE_START(SUNXI_DT, "Allwinner suniv Family")
>> +	.dt_compat	=3D suniv_board_dt_compat,
>> +MACHINE_END
>
>Do we really need a separate file for that?
>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
