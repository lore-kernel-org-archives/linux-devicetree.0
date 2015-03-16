From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH V2 4/5] MIPS: Add support for the IMG Pistachio SoC
Date: Mon, 16 Mar 2015 11:04:43 +0000
Message-ID: <5506B8CB.7000903@imgtec.com>
References: <1426287249-27185-1-git-send-email-abrestic@chromium.org> <1426287249-27185-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="5jx136UfxsMgQtpB8nEW0obGTejM1jaxT"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426287249-27185-5-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>
List-Id: devicetree@vger.kernel.org

--5jx136UfxsMgQtpB8nEW0obGTejM1jaxT
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 13/03/15 22:54, Andrew Bresticker wrote:
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index e5fc463..2298baa 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -23,6 +23,7 @@ platforms +=3D netlogic
>  platforms +=3D paravirt
>  platforms +=3D pmcs-msp71xx
>  platforms +=3D pnx833x
> +platforms +=3D pistachio

Please keep this sorted alphabetically.

>  platforms +=3D ralink
>  platforms +=3D rb532
>  platforms +=3D sgi-ip22

=2E..

> diff --git a/arch/mips/include/asm/mach-pistachio/gpio.h b/arch/mips/in=
clude/asm/mach-pistachio/gpio.h
> new file mode 100644
> index 0000000..6c1649c
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-pistachio/gpio.h
> @@ -0,0 +1,21 @@
> +/*
> + * Pistachio IRQ setup
> + *
> + * Copyright (C) 2014 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modif=
y it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#ifndef __ASM_MACH_PISTACHIO_GPIO_H
> +#define __ASM_MACH_PISTACHIO_GPIO_H
> +
> +#include <asm-generic/gpio.h>
> +
> +#define gpio_get_value	__gpio_get_value
> +#define gpio_set_value	__gpio_set_value
> +#define gpio_cansleep	__gpio_cansleep
> +#define gpio_to_irq	__gpio_to_irq

Makes me wish ARCH_HAVE_CUSTOM_GPIO_H could be selected on a
per-platform basis :P. Never mind.

> +
> +#endif /* __ASM_MACH_PISTACHIO_GPIO_H */

=2E..

> diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
> new file mode 100644
> index 0000000..6b297d5
> --- /dev/null
> +++ b/arch/mips/pistachio/init.c
> @@ -0,0 +1,131 @@

=2E..

> +static int __init plat_of_setup(void)
> +{
> +	if (!of_have_populated_dt())
> +		panic("Device tree not present");
> +
> +	if (of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL=
))
> +		panic("Failed to populate DT\n");

No need for newline in panic message.

> +
> +	return 0;
> +}
> +arch_initcall(plat_of_setup);

=2E..

Otherwise from what I can tell this patch looks good to me (though I
probably wouldn't know if something important was missing from it).

Thanks!
James


--5jx136UfxsMgQtpB8nEW0obGTejM1jaxT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVBrjLAAoJEGwLaZPeOHZ6MpwP/0wZglHXGQU6krSj1yQV377M
T26aRS1mceW8m6LJ00vNKv0cavWpAFftBN3bwd25FF1NBp/+m9gBF4oVt6+oPCSu
EJ7zSFs4NT+C3Vi9OvDI4rpEBmBbVOVKBVETnMPMc5WXJUhEK+tclR2Qw42xIHYo
GJ8dKuQWoop9itAw/GXHVtASfDBvQaW+6BKQvqV/01FNPJLfHX23oIaGZ7MMpBvG
bvrFNmPn2mS6I46/mwWf/SDOvm763/ERKNigcd5uaNRovOsxSnxeqfbiTpkRXDTW
SgvaY+ttxTVSNnsmGITGyUQxmo8OSAWDn5KluMSNgmxYuRxFSA6EaS+g2FvW8I/T
SOpBdp7KIweLFDgUe2LWlIO66tfL77LkNJfHBA5eIKEp4jS8nln3a9BHLaAkhw6T
zenIHg2bCs3JBf4XYW9K7l1Zj5Qtf0/H52zt7/6obDgr/2aDJKR+QwCvWwpQrW9f
qR3BvauwgzLPRBGm6+/pEDrKHwBvrB1NrWR7xS/Cz5nfov0FAc86R1DM69hrpa1J
n19E+J5nGhuh9DzRII4qnvrMgIhnGIZAEed/rUG714uBBlLDeqOFwhRvHiu2tPK7
i/ER1cuWTNbEX0xICbb3OtATkB0OatSTWdxvpbMFufZ228PcjaEIkMY35PQB8b3D
MXxWEBa8JjBd3rPvRd6t
=DsrG
-----END PGP SIGNATURE-----

--5jx136UfxsMgQtpB8nEW0obGTejM1jaxT--
