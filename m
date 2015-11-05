From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND 3/4] ARM: BCM: Add SMP support for Broadcom NSP
Date: Thu, 5 Nov 2015 10:44:30 +0100
Message-ID: <CACRpkda8Fg+Z0h1+3dv=xAAKJnnXvPR=i5eyjLeLxFn467cvzA@mail.gmail.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
	<1446702681-45339-4-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446702681-45339-4-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 5, 2015 at 6:51 AM, Kapil Hali <kapilh@broadcom.com> wrote:

> Add SMP support for Broadcom's Northstar Plus SoC,
> cpu enable method and pen_release procedures. This
> changes also consolidates iProc family's - BCM NSP
> and BCM Kona, SMP handling in a common file.
>
> Northstar Plus SoC is based on ARM Cortex-A9
> revision r3p0 which requires configuration for ARM
> Errata 764369 for SMP. This change adds the needed
> configuration option.
>
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
(...)
> +/*
> + * iProc specific entry point for secondary CPUs.  This provides
> + * a "holding pen" into which all secondary cores are held until
> + * we are ready for them to initialise.
> + */

Do you *REALLY* need the complex pen hold/release semaphore
stuff?

Consult for example commit
c00def71efd919e8ae835a25f4f4c80a4b2d36d3
"ARM: ux500: simplify secondary CPU boot"

I realized the pen hold/release stuff was totally surplus on the
ux500 platform, it was probably just copied from the Vexpress
or RealView reference design and kept around because ARM
did things that way. And you are copying the same code from
other platforms again. Do you *really* understand the pen hold/release
code? (I don't.)

In our case it turned out that all that was really needed was:

- Map and enable SCU at .smp_prepare_cpus()

- Write the start address for the secondary CPU(s) in their
  magic registers/addresses i.e what you do in
  nsp_write_lut() and then call
  arch_send_wakeup_ipi_mask(cpumask_of(cpu)); in
  .smp_boot_secondary()
  It seems you may not even need the IPI, I can't see
  that call in your patch so I guess your secondary
  CPUs aren't in WFI at boot.

No pen hold/release magic! Works like a charm for us.
So see of you really need this horror story with copied
assembly code from realview etc.

Yours,
Linus Walleij
