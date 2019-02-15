From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/11] mfd: pm8xxx: disassociate old virq if hwirq mapping already exists
Date: Fri, 15 Feb 2019 13:28:02 -0800
Message-ID: <155026608236.115909.9007817366859489104@swboyd.mtv.corp.google.com>
References: <20190208021631.30252-1-masneyb@onstation.org> <20190208021631.30252-6-masneyb@onstation.org> <155020988635.115909.8353948296231202388@swboyd.mtv.corp.google.com> <20190215134733.GA21208@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215134733.GA21208@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-02-15 05:47:33)
> On Thu, Feb 14, 2019 at 09:51:26PM -0800, Stephen Boyd wrote:
> > > diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> > > index 8eb2528793f9..2f99a98ccee5 100644
> > > --- a/drivers/mfd/qcom-pm8xxx.c
> > > +++ b/drivers/mfd/qcom-pm8xxx.c
> > > @@ -380,6 +380,12 @@ static void pm8xxx_irq_domain_map(struct pm_irq_=
chip *chip,
> > >                                   struct irq_domain *domain, unsigned=
 int irq,
> > >                                   irq_hw_number_t hwirq, unsigned int=
 type)
> > >  {
> > > +       unsigned int old_virq;
> > > +
> > > +       old_virq =3D irq_find_mapping(domain, hwirq);
> > > +       if (old_virq)
> > > +               irq_domain_disassociate(domain, old_virq);
> >=20
> > Is it possible to pass 'true' for the 'realloc' argument to
> > __irq_domain_alloc_irqs() and then this disassociate change isn't
> > needed?
>=20
> The kernel doc for __irq_domain_alloc_irqs() says that the realloc
> parameter is mainly to support legacy IRQs. I don't think its a good
> idea to add new code that'll stay past the end of this patch series
> on top of that legacy interface.
>=20

Ok. The other side of the argument is that this is the only user of
irq_domain_disassociate(), which may also be some sort of legacy
interface that isn't supposed to be used. Looking at the commit that
exposed it, it seems to be that it's there for legacy reasons.

commit 43a775916d63d1c822107b39987192ca5ced445c
Author: Jiang Liu <jiang.liu@linux.intel.com>
Date:   Mon Jun 9 16:20:05 2014 +0800

    genirq: Export irq_domain_disassociate() to architecture interrupt driv=
ers
   =20
    Export irq_domain_disassociate() to architecture interrupt drivers,
    so it could be used to handle legacy IRQ descriptors on x86.

So maybe we should just use the realloc argument and bury the
disassociate API in irqdomain.c because it's not supposed to be used?
Or does the realloc path not work for some reason?
