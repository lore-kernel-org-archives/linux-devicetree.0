From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] bmips: add BCM6358 support
Date: Thu, 3 Mar 2016 12:09:15 -0800
Message-ID: <56D899EB.5050700@gmail.com>
References: <1456054881-26787-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456054881-26787-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/02/16 03:41, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> BCM6358 has a shared TLB which conflicts with current SMP support, so=
 it must
> be disabled for now.
> BCM6358 uses >=3D 0xfffe0000 addresses for internal registers, which =
need to be
> remapped (by using a simplified version of BRCM63xx ioremap.h).
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: Use a different approach for remapping internal registers
>=20
>  arch/mips/bmips/setup.c                    | 29 +++++++++++++++++---=
---
>  arch/mips/include/asm/mach-bmips/ioremap.h | 37 ++++++++++++++++++++=
++++++++++
>  2 files changed, 59 insertions(+), 7 deletions(-)
>  create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h
>=20
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 3553528..f834a86 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/of_platform.h>
>  #include <linux/smp.h>
> +#include <linux/types.h>
>  #include <asm/addrspace.h>
>  #include <asm/bmips.h>
>  #include <asm/bootinfo.h>
> @@ -35,9 +36,12 @@
> =20
>  static const unsigned long kbase =3D VMLINUX_LOAD_ADDRESS & 0xfff000=
00;
> =20
> +phys_addr_t bmips_internal_registers;
> +
>  struct bmips_quirk {
> -	const char		*compatible;
> -	void			(*quirk_fn)(void);
> +	const char *compatible;
> +	void (*quirk_fn)(void);
> +	const phys_addr_t regs;
>  };

That does not scale very well to having some sort of generic quirk
function here.

> =20
>  static void kbase_setup(void)
> @@ -95,17 +99,27 @@ static void bcm6328_quirks(void)
>  		bcm63xx_fixup_cpu1();
>  }
> =20
> +static void bcm6358_quirks(void)
> +{
> +	/*
> +	 * BCM6358 needs special handling for its shared TLB, so
> +	 * disable SMP for now
> +	 */
> +	bmips_smp_enabled =3D 0;
> +}
> +
>  static void bcm6368_quirks(void)
>  {
>  	bcm63xx_fixup_cpu1();
>  }
> =20
>  static const struct bmips_quirk bmips_quirk_list[] =3D {
> -	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
> -	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
> -	{ "brcm,bcm6328",		&bcm6328_quirks			},
> -	{ "brcm,bcm6368",		&bcm6368_quirks			},
> -	{ "brcm,bcm63168",		&bcm6368_quirks			},
> +	{ "brcm,bcm3384-viper", &bcm3384_viper_quirks, 0 },
> +	{ "brcm,bcm33843-viper", &bcm3384_viper_quirks, 0 },
> +	{ "brcm,bcm6328", &bcm6328_quirks, 0 },
> +	{ "brcm,bcm6358", &bcm6358_quirks, 0xfffe0000 },
> +	{ "brcm,bcm6368", &bcm6368_quirks, 0 },
> +	{ "brcm,bcm63168", &bcm6368_quirks, 0 },
>  	{ },
>  };
> =20
> @@ -162,6 +176,7 @@ void __init plat_mem_setup(void)
>  	for (q =3D bmips_quirk_list; q->quirk_fn; q++) {
>  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
>  					     q->compatible)) {
> +			bmips_internal_registers =3D q->regs;
>  			q->quirk_fn();
>  		}
>  	}
> diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/i=
nclude/asm/mach-bmips/ioremap.h
> new file mode 100644
> index 0000000..5ffca94
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-bmips/ioremap.h
> @@ -0,0 +1,37 @@
> +#ifndef __ASM_MACH_BMIPS_IOREMAP_H
> +#define __ASM_MACH_BMIPS_IOREMAP_H
> +
> +#include <linux/types.h>
> +
> +extern phys_addr_t bmips_internal_registers;
> +
> +static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr,
> +					     phys_addr_t size)
> +{
> +	return phys_addr;
> +}
> +
> +static inline int is_bmips_internal_registers(phys_addr_t offset)
> +{
> +	if (bmips_internal_registers !=3D 0 && offset >=3D bmips_internal_r=
egisters)
> +		return 1;

Humm, we should probably just use a hardcoded constant here, and just
pick one which works for all SoCs, so the 3368 base address for
instance: 0xfff8_0000 seems like a good candidate, and also works for
other DSL SoCs too.
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
