From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: Add BCM6345 support
Date: Fri, 3 Jun 2016 13:46:17 +0200
Message-ID: <CAOiHx=nu-5_CeHn8dki+v9nrP8uN2QH13gcNsejYKpt7dsmX2w@mail.gmail.com>
References: <1464941524-3992-1-git-send-email-noltari@gmail.com> <1464941524-3992-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464941524-3992-2-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 3 June 2016 at 10:12, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmai=
l.com> wrote:
> BCM6345 has only one CPU, so SMP support must be disabled.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>  arch/mips/bmips/setup.c                             | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Do=
cumentation/devicetree/bindings/mips/brcm/soc.txt
> index 4a7e030..1936e8a 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> @@ -4,7 +4,7 @@ Required properties:
>
>  - compatible: "brcm,bcm3384", "brcm,bcm33843"
>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
> -              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
> +              "brcm,bcm6328", "brcm,bcm6345", "brcm,bcm6358", "brcm,=
bcm6368",
>                "brcm,bcm63168", "brcm,bcm63268",
>                "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,=
bcm7360",
>                "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"

This is reasonable.

> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index f146d12..b0d339d 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -95,6 +95,14 @@ static void bcm6328_quirks(void)
>                 bcm63xx_fixup_cpu1();
>  }
>
> +static void bcm6345_quirks(void)
> +{
> +       /*
> +        * BCM6345 has only one CPU and no SMP support
> +        */
> +       bmips_smp_enabled =3D 0;
> +}
> +
>  static void bcm6358_quirks(void)
>  {
>         /*
> @@ -113,6 +121,7 @@ static const struct bmips_quirk bmips_quirk_list[=
] =3D {
>         { "brcm,bcm3384-viper",         &bcm3384_viper_quirks        =
   },
>         { "brcm,bcm33843-viper",        &bcm3384_viper_quirks        =
   },
>         { "brcm,bcm6328",               &bcm6328_quirks              =
   },
> +       { "brcm,bcm6345",               &bcm6345_quirks              =
   },
>         { "brcm,bcm6358",               &bcm6358_quirks              =
   },
>         { "brcm,bcm6368",               &bcm6368_quirks              =
   },
>         { "brcm,bcm63168",              &bcm6368_quirks              =
   },

This part is unnecessary, as cpu-bmips will only try to enable smp for
bmips4350 and higher. but not for bmips32/bmips3300.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
