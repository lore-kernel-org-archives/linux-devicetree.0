From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/4] ARM: davinci: fix cpufreq registration on da850-evm
Date: Tue, 26 Mar 2019 18:51:41 +0100
Message-ID: <CAMpxmJVBTny7kzADSZHQXk_ZUjnRaNWu0Ly3WC8v+zPmR8Dizg@mail.gmail.com>
References: <20190322133105.5945-1-brgl@bgdev.pl> <20190322133105.5945-2-brgl@bgdev.pl>
 <CAHCN7xJj_aA8XFR6=ZxO-WrfkJRY5fS6NgjHbeqpdfhUnn1apA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHCN7xJj_aA8XFR6=ZxO-WrfkJRY5fS6NgjHbeqpdfhUnn1apA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

wt., 26 mar 2019 o 15:00 Adam Ford <aford173@gmail.com> napisa=C5=82(a):
>
> On Fri, Mar 22, 2019 at 8:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The system_rev variable is never set on davinci and is always 0, so
> > we're using the default max operating point of 300MHz. The cvdd supply
> > comes from the tps6507 pmic and the voltage can go all the way to 1.3V
> > so the maximum supported rate should be 456MHz.
>
> My understanding is that only certain revisions of the silicon can go
> to 456MHz.   The L138's Datasheet lists both a 456 and 375 version.  I
> cannot find a way to read a register to determine which version of the
> silicon is available. Maybe Sekhar can confirm.
>

Commit 28bd2c341120 ("davinci: am18x/da850/omap-l138 evm: add support
for higher speed grades") mentions the following:

---
U-Boot on the EVM sets up ATAG_REVISION to inform the OS
regarding the speed grade supported by the silicon. We use
this information to pass on the speed grade information to
the SoC code.
---

Should the system_rev somehow reflect that revision? Any way I can check it=
?

Bart

> adam
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  arch/arm/mach-davinci/board-da850-evm.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> >
> > diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-da=
vinci/board-da850-evm.c
> > index 1fdc9283a8c5..58b2a485b527 100644
> > --- a/arch/arm/mach-davinci/board-da850-evm.c
> > +++ b/arch/arm/mach-davinci/board-da850-evm.c
> > @@ -1155,17 +1155,7 @@ static struct edma_rsv_info *da850_edma_rsv[2] =
=3D {
> >  #ifdef CONFIG_CPU_FREQ
> >  static __init int da850_evm_init_cpufreq(void)
> >  {
> > -       switch (system_rev & 0xF) {
> > -       case 3:
> > -               da850_max_speed =3D 456000;
> > -               break;
> > -       case 2:
> > -               da850_max_speed =3D 408000;
> > -               break;
> > -       case 1:
> > -               da850_max_speed =3D 372000;
> > -               break;
> > -       }
> > +       da850_max_speed =3D 456000;
> >
> >         return da850_register_cpufreq("pll0_sysclk3");
> >  }
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
