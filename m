MIME-Version: 1.0
In-Reply-To: <1523956215-28154-2-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-2-git-send-email-t-kristo@ti.com>
Date: Wed, 18 Apr 2018 19:02:09 -0500
Message-ID: <CAL_Jsq+pHeKdEYJ51R6F25OG-zJhFsm5dQUkOoif7ujQeVm+pw@mail.gmail.com>
Subject: Re: [RFC 01/13] ARM: dts: allow building .dtb files under platform subdirs
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 4:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
> Add support to base ARM makefile for building .dtb files under platform
> specific subdirs (e.g. arch/arm/boot/dts/ti for TI SoCs.)
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index e4e537f..f6c90bc 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -343,8 +343,10 @@ $(BOOT_TARGETS): vmlinux
>  $(INSTALL_TARGETS):
>         $(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
>
> +%.dtb: dtbdir=$(patsubst %/,%,$(patsubst %./,%,$(boot)/dts/$(dir $@)))

I'd expect this to look more like the arm64 version and just add
'subdir-y' entries in the boot/dts/Makefile.

> +
>  %.dtb: | scripts
> -       $(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
> +       $(Q)$(MAKE) $(build)=$(dtbdir) MACHINE=$(MACHINE) $(boot)/dts/$@

We can drop MACHINE here.

Rob
