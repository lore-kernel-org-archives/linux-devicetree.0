From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: specify initrd location using 64-bit
Date: Wed, 12 Sep 2012 18:16:09 +0200
Message-ID: <CAMuHMdUuQzD0bq8PifBea2-0Pk7RhmPA0-GAFprsk+vMxMGjGw@mail.gmail.com>
References: <1347465937-7056-1-git-send-email-cyril@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1347465937-7056-1-git-send-email-cyril@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyril Chemparathy <cyril@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux@openrisc.net, linuxppc-dev@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au, a-jacquiot@ti.com, arnd@arndb.de, benh@kernel.crashing.org, bigeasy@linutronix.de, blogic@openwrt.org, david.daney@cavium.com, dhowells@redhat.com, grant.likely@secretlab.ca, hpa@zytor.com, jonas@southpole.se, linus.walleij@linaro.org, linux@arm.linux.org.uk, m.szyprowski@samsung.com, mahesh@linux.vnet.ibm.com, mingo@redhat.com, monstr@monstr.eu, msalter@redhat.com, nico@linaro.org, paul.gortmaker@windriver.com, paulus@samba.org, ralf@linux-mips.org, rob.herring@calxeda.com, suzuki@in.ibm.com, tglx@linutronix.de, tj@kernel.org, x86@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2012 at 6:05 PM, Cyril Chemparathy <cyril@ti.com> wrote:
> On some PAE architectures, the entire range of physical memory could reside
> outside the 32-bit limit.  These systems need the ability to specify the
> initrd location using 64-bit numbers.
>
> This patch globally modifies the early_init_dt_setup_initrd_arch() function to
> use 64-bit numbers instead of the current unsigned long.

> -void __init early_init_dt_setup_initrd_arch(unsigned long start, unsigned long end)
> +void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)

Why not phys_addr_t?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
