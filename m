From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v3 4/4] MIPS: BMIPS: accept UHI interface for passing
 a dtb
Date: Fri, 17 Apr 2015 20:09:35 -0700
Message-ID: <5531CAEF.9090606@gmail.com>
References: <1428834301-12721-1-git-send-email-jogo@openwrt.org> <1428834301-12721-5-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428834301-12721-5-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 12/04/2015 03:25, Jonas Gorski a =C3=A9crit :
> Detect and use passed dtb address using the UHI interface. This allow=
s for
> booting with a vmlinux.bin appended dtb instead of using a built-in o=
ne.

No particular objections to this change, current platforms support by
this change fall under 3 categories:

- BCM7xxx using a CFE providing a firmware interface you call into usin=
g
code from arch/mips/fw/cfe/
- BCM63xx CFE
- BCM33xx using Aeolus [1]

The first two are likely not going to be changed since these are
currently deployed products/systems, however the latter could be change=
d
to match UHI as Kevin proposed a while ago.

>=20
> Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> ---
>  arch/mips/bmips/setup.c |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index fae800e..526ec27 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -149,6 +149,8 @@ void __init plat_mem_setup(void)
>  	/* intended to somewhat resemble ARM; see Documentation/arm/Booting=
 */
>  	if (fw_arg0 =3D=3D 0 && fw_arg1 =3D=3D 0xffffffff)
>  		dtb =3D phys_to_virt(fw_arg2);
> +	else if (fw_arg0 =3D=3D -2) /* UHI interface */
> +		dtb =3D (void *)fw_arg1;
>  	else if (__dtb_start !=3D __dtb_end)
>  		dtb =3D (void *)__dtb_start;
>  	else
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
