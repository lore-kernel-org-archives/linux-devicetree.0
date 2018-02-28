From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v5 01/26] ARM: shmobile: Add watchdog support
Date: Wed, 28 Feb 2018 17:37:39 +0000
Message-ID: <TY1PR06MB089598E10BB2D1719BD05C7AC0C70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUx3A_8MeZmrwiBRqUS0oGjwrg13fy1QMsA2SUw+dR0Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdUx3A_8MeZmrwiBRqUS0oGjwrg13fy1QMsA2SUw+dR0Hg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Wim Van Sebroeck <wim@iguana.be>, linux-clk <linux-clk@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Guenter Roeck <linux@roeck-us.net>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

thank you for your feedback!

> Subject: Re: [PATCH v5 01/26] ARM: shmobile: Add watchdog support
>
> Hi Fabrizio,
>
> On Mon, Feb 12, 2018 at 6:44 PM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > On R-Car Gen2 and RZ/G1 platforms, we use the SBAR registers to make non
> > boot CPUs run a routine designed to bring up SMP and deal with hot plug.
> > The value contained in the SBAR registers is not initialized by a WDT
> > triggered reset, which means that after a WDT triggered reset we jump
> > to the SMP bring up routine, preventing the system from executing the
> > bootrom code.
> >
> > The purpose of this patch is to jump to the bootrom code in case of a
> > WDT triggered reset, and keep the SMP functionality untouched.
> > In order to tell if the code had been called due to the WDT overflowing
> > we are testing WOVF from register RWTCSRA.
> >
> > The new function shmobile_boot_vector_gen2 isn't replacing
> > shmobile_boot_vector for backward compatibility reasons. The kernel
> > will install the best option (either shmobile_boot_vector or
> > shmobile_boot_vector_gen2) to ICRAM1 after parsing the device tree,
> > according to the amount of memory available.
> >
> > Since shmobile_boot_vector has become bigger, "reg" property of nodes
> > compatible with "renesas,smp-sram" now need to be set to a value
> > greater or equal to "<0 0x60>".
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
>
> > --- a/arch/arm/mach-shmobile/common.h
> > +++ b/arch/arm/mach-shmobile/common.h
> > @@ -7,6 +7,12 @@ extern void shmobile_init_delay(void);
> >  extern void shmobile_boot_vector(void);
> >  extern unsigned long shmobile_boot_fn;
> >  extern unsigned long shmobile_boot_size;
> > +#ifdef CONFIG_ARCH_RCAR_GEN2
>
> I think this #ifdef can be removed.

I'll send a new version of this patch without ifdefs.

Thanks,
Fab

>
> > +extern void shmobile_boot_vector_gen2(void);
> > +extern unsigned long shmobile_boot_fn_gen2;
> > +extern unsigned long shmobile_boot_cpu_gen2;
> > +extern unsigned long shmobile_boot_size_gen2;
> > +#endif /* CONFIG_ARCH_RCAR_GEN2 */
> >  extern void shmobile_smp_boot(void);
> >  extern void shmobile_smp_sleep(void);
> >  extern void shmobile_smp_hook(unsigned int cpu, unsigned long fn,
>
> Apart from that:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
