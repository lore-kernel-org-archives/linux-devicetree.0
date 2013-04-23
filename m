From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/8] metag: minimal TZ1090 (Comet) SoC infrastructure
Date: Tue, 23 Apr 2013 17:25:34 +0200
Message-ID: <201304231725.34826.arnd@arndb.de>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-3-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1366727607-27444-3-git-send-email-james.hogan@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 23 April 2013, James Hogan wrote:

> @@ -46,6 +46,12 @@ core-y					+= arch/metag/boot/dts/
>  core-y					+= arch/metag/kernel/
>  core-y					+= arch/metag/mm/
>  
> +# SoCs
> +socdir-$(CONFIG_SOC_TZ1090)		+= tz1090
> +
> +socdirs		:= $(filter-out ., $(patsubst %,%/,$(socdir-y)))
> +core-y		+= $(addprefix arch/metag/soc/, $(socdirs))
> +

Does it actually make sense to have subdirectories per soc? I would 
suggest you copy from arm64 rather from arm for the platform support and
do it as minimal as possible. Any code you need can go into a shared directory
as a start, and if you end up needing more of a hierarchical structure,
you can add that later. Hopefully we've come to the point now where almost
everything can live in drivers/* though.

> diff --git a/arch/metag/configs/tz1090_defconfig b/arch/metag/configs/tz1090_defconfig
> new file mode 100644
> index 0000000..4794094
> --- /dev/null
> +++ b/arch/metag/configs/tz1090_defconfig

Also, if this is compatible with your previous platform, I would recommend just
having a single defconfig that runs on all supported hardware. It's easy enough
for users to turn off the drivers and platforms they don't need.

> diff --git a/arch/metag/soc/tz1090/setup.c b/arch/metag/soc/tz1090/setup.c
> new file mode 100644
> index 0000000..fbd7074
> --- /dev/null
> +++ b/arch/metag/soc/tz1090/setup.c
> +
> +#include <linux/init.h>
> +#include <asm/mach/arch.h>
> +
> +static const char *tz1090_boards_compat[] __initdata = {
> +	"toumaz,tz1090",
> +	NULL,
> +};
> +
> +MACHINE_START(TZ1090, "Generic TZ1090")
> +	.dt_compat	= tz1090_boards_compat,
> +MACHINE_END

Have you looked at the patch I sent for default platform code on ARM?
The idea is to default to an empty machine descriptor if nothing matches
the root compatible entry of the DT. The same would work here to allow
you to run without any board code at all.

	Arnd
