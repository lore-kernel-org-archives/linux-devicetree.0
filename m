From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND v2 3/4] ARM: BCM: Add SMP support for Broadcom NSP
Date: Mon, 9 Nov 2015 11:09:54 +0100
Message-ID: <CACRpkdZN-iwdR_VwktdHsw+rGQLhCgmWnERYVDE+KaYOqJR30w@mail.gmail.com>
References: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
	<1446839371-22601-4-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446839371-22601-4-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 6, 2015 at 8:49 PM, Kapil Hali <kapilh@broadcom.com> wrote:

> Add SMP support for Broadcom's Northstar Plus SoC
> cpu enable method. This changes also consolidates
> iProc family's - BCM NSP and BCM Kona, platform
> SMP handling in a common file.
>
> Northstar Plus SoC is based on ARM Cortex-A9
> revision r3p0 which requires configuration for ARM
> Errata 764369 for SMP. This change adds the needed
> configuration option.
>
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>

This version looks saner to me.

> +static int nsp_write_lut(void)
> +{
> +       void __iomem *sku_rom_lut;
> +       phys_addr_t secondary_startup_phy;
> +
> +       if (!secondary_boot) {
> +               pr_warn("required secondary boot register not specified\n");
> +               return -EINVAL;
> +       }
> +
> +       sku_rom_lut = ioremap_nocache((phys_addr_t)secondary_boot,
> +                                               sizeof(secondary_boot));

Why is this address not just taken directly from the device tree?

If it is not in the device tree: why?

Also give it a sane name, bcm_sec_boot_address or so.
"secondary_boot" sounds like a function you call to boot
the second core.

Yours,
Linus Walleij
