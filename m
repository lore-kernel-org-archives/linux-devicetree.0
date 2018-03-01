From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v5 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Thu, 1 Mar 2018 15:34:02 +0000
Message-ID: <TY1PR06MB08957154C56A39C1B2449109C0C60@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-13-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXKHzpi9evmTOt58DaZzA3dHmMJsAqPNi0+j9Bv1QBbdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdXKHzpi9evmTOt58DaZzA3dHmMJsAqPNi0+j9Bv1QBbdQ@mail.gmail.com>
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

> Subject: Re: [PATCH v5 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
>
> Hi Fabrizio,
>
> On Mon, Feb 12, 2018 at 6:44 PM, Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Due to commits:
> > * "ARM: shmobile: Add watchdog support",
> > * "ARM: shmobile: rcar-gen2: Add watchdog support", and
> > * "soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2",
> > we now have everything we needed for the watchdog to work on Gen2 and
> > RZ/G1.
> >
> > This commit adds "renesas,rcar-gen2-wdt" as compatible string for R-Car
> > Gen2 and RZ/G1, and since on those platforms the rwdt clock needs to be
> > always ON, when suspending to RAM we need to explicitly disable the
> > counting by clearing TME from RWTCSRA.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
>
> Thanks for your patch!
>
> I verified this works on R-Car Gen2, so
> Reviewed-and-Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Still, more comments below...
>
> > --- a/drivers/watchdog/renesas_wdt.c
> > +++ b/drivers/watchdog/renesas_wdt.c
> > @@ -203,13 +203,29 @@ static int rwdt_remove(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > -/*
> > - * This driver does also fit for R-Car Gen2 (r8a779[0-4]) WDT. However, for SMP
> > - * to work there, one also needs a RESET (RST) driver which does not exist yet
> > - * due to HW issues. This needs to be solved before adding compatibles here.
> > - */
> > +static int __maybe_unused rwdt_suspend(struct device *dev)
> > +{
> > +       struct rwdt_priv *priv = dev_get_drvdata(dev);
> > +
> > +       if (watchdog_active(&priv->wdev))
> > +               rwdt_write(priv, priv->cks, RWTCSRA);
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused rwdt_resume(struct device *dev)
> > +{
> > +       struct rwdt_priv *priv = dev_get_drvdata(dev);
> > +
> > +       if (watchdog_active(&priv->wdev))
> > +               rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
>
> Writing to this register is not sufficient on R-Car Gen3, where PSCI
> suspend powers down the whole SoC.  Hence all WDT register content is lost,
> causing the watchdog timeout never to trigger.
> Note that this issue is pre-existing, and not caused by your patch.
>
> This can be fixed by replacing the RWTCSRA register writes in the
> suspend/resume handlers by calls to rwdt_stop() resp. rwdt_start(), like is
> done in the BSP in commit e406980763f18f38 ("watchdog: renesas-wdt: Support
> the suspend/resume"). Note that this would cause a small change in behavior
> on R-Car Gen2, where the timeout would be reset on resume, instead of
> continuing where stopped before. I don't think that hurts, though.

I see, well I believe we can make both of us happy by addressing Gen3
problems and preserving the original behaviour  from Gen2.

I am going to send a new series to address this shortly.

>
> Since I was always a bit uncomfortable with this patch doing two things at
> once (1. suspend/resume, 2. "renesas,rcar-gen2-wdt" matching), I think it
> would be better to take the patch from the BSP first, and add support for
> "renesas,rcar-gen2-wdt" in a subsequent patch.

I agree, I'll split the patch and submit suspend/resume first, Gen2 compatibility
next.

Thanks,
Fab

>
> Does the above make sense?
> Do you agree?
>
> Thanks!
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
