From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC 3/8] of: create of_phandle_args to simplify return of
 phandle parsing data
Date: Mon, 14 Nov 2011 11:59:09 +0800
Message-ID: <20111114035908.GA10236@S2100-06.ap.freescale.net>
References: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
 <1320801583-12774-4-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1320801583-12774-4-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Tue, Nov 08, 2011 at 06:19:38PM -0700, Grant Likely wrote:
[...]
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4948552..566deab 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -222,6 +222,13 @@ extern const void *of_get_property(const struct =
device_node *node,
>  #define for_each_property(pp, properties) \
>  	for (pp =3D properties; pp !=3D NULL; pp =3D pp->next)
> =20
> +#define MAX_PHANDLE_ARGS 8
> +struct of_phandle_args {
> +	struct device_node *np;
> +	int args_count;
> +	uint32_t args[MAX_PHANDLE_ARGS];
> +};
> +

I'm seeing a bunch of warnings like the one below when compiling imx
with the series.  And moving the definition to somewhere before
'#include <asm/prom.h>' in linux/of.h removes the warnings for me.

  CC      arch/arm/kernel/devtree.o
In file included from arch/arm/plat-mxc/include/mach/irqs.h:14:0,
                 from arch/arm/include/asm/irq.h:4,
                 from arch/arm/include/asm/prom.h:17,
                 from include/linux/of.h:133,
                 from arch/arm/kernel/devtree.c:17:
include/asm-generic/gpio.h:133:24: warning: =E2=80=98struct of_phandle_=
args=E2=80=99 declared inside parameter list
include/asm-generic/gpio.h:133:24: warning: its scope is only this defi=
nition or declaration, which is probably not what you want

--=20
Regards,
Shawn
