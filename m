From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] bmips: add BCM6358 support
Date: Sun, 17 Jan 2016 22:49:25 -0800
Message-ID: <0BC6030C-7485-4193-B86D-E690BF673952@gmail.com>
References: <1453030101-14794-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453030101-14794-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On January 17, 2016 3:28:20 AM PST, "=C3=81lvaro Fern=C3=A1ndez Rojas" =
<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>BCM6358 has a shared TLB which conflicts with current SMP support, so
>it must
>be disabled for now.
>BCM6358 uses >=3D 0xfff00000 addresses for internal registers, which n=
eed
>to be
>remapped (by using a simplified version of BRCM63xx ioremap.h).
>
>Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>---
> arch/mips/bmips/setup.c                    | 10 +++++++++
>arch/mips/include/asm/mach-bmips/ioremap.h | 33
>++++++++++++++++++++++++++++++
> 2 files changed, 43 insertions(+)
> create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h
>
>diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>index 3553528..38b5bd5 100644
>--- a/arch/mips/bmips/setup.c
>+++ b/arch/mips/bmips/setup.c
>@@ -95,6 +95,15 @@ static void bcm6328_quirks(void)
> 		bcm63xx_fixup_cpu1();
> }
>=20
>+static void bcm6358_quirks(void)
>+{
>+	/*
>+	 * BCM6358 needs special handling for its shared TLB, so
>+	 * disable SMP for now
>+	 */
>+	bmips_smp_enabled =3D 0;
>+}

That part looks good.

>+
> static void bcm6368_quirks(void)
> {
> 	bcm63xx_fixup_cpu1();
>@@ -104,6 +113,7 @@ static const struct bmips_quirk bmips_quirk_list[]
>=3D {
> 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
> 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
> 	{ "brcm,bcm6328",		&bcm6328_quirks			},
>+	{ "brcm,bcm6358",		&bcm6358_quirks			},
> 	{ "brcm,bcm6368",		&bcm6368_quirks			},
> 	{ "brcm,bcm63168",		&bcm6368_quirks			},
> 	{ },

<snip>

>+
>+static inline int is_bmips_internal_registers(phys_addr_t offset)
>+{
>+	if (offset >=3D 0xfff00000)
>+		return 1;
>+
>+	return 0;

That should probably be refined to be looking at the SoC/CPU you are ru=
nning on, using eventually of_machine_is_compatible on the SoC-specific=
 compatible string. For instance, on 6368 and newer, the physical regis=
ter offset moves to PA 0x1000_0000.

Thanks!

--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
