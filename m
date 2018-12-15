From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 3/3] PCI: imx: Add support for i.MX8MQ
Date: Fri, 14 Dec 2018 21:22:46 -0800
Message-ID: <CAHQ1cqFFm_YJne91yKVHWhMZY0KhpDfN0mbWL3YECnMo14JH4A@mail.gmail.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com>
 <20181206073545.10967-4-andrew.smirnov@gmail.com> <20181214203042.GC20725@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214203042.GC20725@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: helgaas@kernel.org
Cc: linux-pci@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, gustavo@embeddedor.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 12:30 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Gustavo for fallthrough annotation]
>
> On Wed, Dec 05, 2018 at 11:35:45PM -0800, Andrey Smirnov wrote:
> > Add code needed to support i.MX8MQ variant.
>
> > @@ -245,7 +253,8 @@ static void imx6_pcie_reset_phy(struct imx6_pcie *imx6_pcie)
> >  {
> >       u32 tmp;
> >
> > -     if (imx6_pcie->variant == IMX7D)
> > +     if (imx6_pcie->variant == IMX7D ||
> > +         imx6_pcie->variant == IMX8MQ)
>
> This style looks like a maintenance problem: the code below is probably
> IMX6-specific, and you should test for *that* instead of adding to this
> list of things that are *not* IMX6, because that list is likely to
> continue growing.  There are more occurrences below.
>

Makes sense, I'll update that patches and send a v3 out.

> > @@ -301,6 +312,7 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
> >
> >       switch (imx6_pcie->variant) {
> >       case IMX7D:
> > +     case IMX8MQ: /* FALLTHROUGH */
> >               reset_control_assert(imx6_pcie->pciephy_reset);
> >               reset_control_assert(imx6_pcie->apps_reset);
> >               break;
>
> I'm not an expert on fallthrough annotation (Gustavo, cc'd, is), but
> this looks wrong.  It's the IMX7D case that falls through, not the
> IMX8MQ case.
>
> The recent annotations added by Gustavo are at the point where the
> "break" would normally be, e.g.,
>
>   case IMX7D:
>     /* fall through */                    <--- annotation
>   case IMX8MQ:
>     <code>
>     break;
>
> But in this case there's actually no IMX7D-specific *code* there, so I
> suspect the annotation is unnecessary.  It's obvious that IMX7D and
> IMX8MQ are handled the same, so there's really no opportunity for the
> "forgotten break" mistake -Wimplicit-fallthrough is trying to find.
>
> If we *do* want this annotation, we should spell it the same as
> Gustavo has been, i.e., "fall through".
>
> Again, more occurrences below.

Yes, definitely, same mistake of mine was already caught elsewhere in
the tree https://lore.kernel.org/lkml/20181214144406.0dbffbc8@canb.auug.org.au/

I'll fix it in v3.

Thanks,
Andrey Smirnov
