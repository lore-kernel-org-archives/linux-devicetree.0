From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95
 enablement
Date: Wed, 2 Mar 2016 13:52:16 +0000
Message-ID: <20160302135216.GB11670@leverpostej>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456886101-22967-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?B?QW5kcsOp?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 02, 2016 at 03:34:55AM +0100, Andreas F=C3=A4rber wrote:
> Hello,
>=20
> This series adds initial support for the Amlogic S905 based
> Tronsmart Vega S95 Pro, Meta and Telos TV boxes.
>=20
> v2:
> * Pick up previously acked "tronsmart" patch instead (Matthias)
> * Drop ARM_GIC selection (Sudeep)
> * Change some compatible strings (Sudeep, Andr=C3=A9)
> * Squash some node changes/additions
>=20
> Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
> in order to avoid the vendor U-Boot overwriting itself (fwiu);
> for the Mini Mx that's reportedly not necessary.
>=20
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 354d75402ace..b7cebdb8b1ce 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -62,7 +62,7 @@ head-y                :=3D arch/arm64/kernel/head.o
>  ifeq ($(CONFIG_ARM64_RANDOMIZE_TEXT_OFFSET), y)
>  TEXT_OFFSET :=3D $(shell awk 'BEGIN {srand(); printf "0x%03x000\n", =
int(512 * rand())}')
>  else
> -TEXT_OFFSET :=3D 0x00080000
> +TEXT_OFFSET :=3D 0x01080000
>  endif
> =20
>  # KASAN_SHADOW_OFFSET =3D VA_START + (1 << (VA_BITS - 3)) - (1 << 61=
)

Absolute NAK to this. TEXT_OFFSET is not open for platform-specific
modification.

Why can you not just load the Image 2MB higher regardless? Does the
U-Boot on this platform actually read TEXT_OFFSET and take it into
account?

> This in turn runs into an apparent regression introduced with the
> text offset randomization:
>=20
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 6ebd204da16a..afdec27c8871 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -48,7 +48,7 @@
>  #elif (PAGE_OFFSET & 0x1fffff) !=3D 0
>  #error PAGE_OFFSET must be at least 2MB aligned
>  #elif TEXT_OFFSET > 0x1fffff
> -#error TEXT_OFFSET must be less than 2MB
> +//#error TEXT_OFFSET must be less than 2MB
>  #endif
> =20
>  #define KERNEL_START   _text

This is not a regression. As above, TEXT_OFFSET is not supposed to be
modified in a platform-specific manner.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
