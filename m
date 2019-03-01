From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 2/2] PCI: imx6: Add code to request/control "pcie_aux"
 clock for i.MX8MQ
Date: Thu, 28 Feb 2019 17:16:21 -0800
Message-ID: <CAHQ1cqHfFivDSwt2Xo7n8qnrnZxSuzmx0he3irYg6Oxp_g=--w@mail.gmail.com>
References: <20190212015108.16952-1-andrew.smirnov@gmail.com>
 <20190212015108.16952-3-andrew.smirnov@gmail.com> <1549964166.2546.21.camel@pengutronix.de>
 <1551389037.6059.3.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551389037.6059.3.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 1:24 PM Trent Piepho <tpiepho@impinj.com> wrote:
>
> On Tue, 2019-02-12 at 10:36 +0100, Lucas Stach wrote:
> > Am Montag, den 11.02.2019, 17:51 -0800 schrieb Andrey Smirnov:
> > > PCIe IP block has additional clock, "pcie_aux", that needs to be
> > > controlled by the driver. Add code to support that.
>
> This breaks iMX7d.
>

Ugh, my bad, sorry about that.

> > >
> > > @@ -1049,6 +1059,12 @@ static int imx6_pcie_probe(struct platform_device *pdev)
> > >                     dev_err(dev, "Failed to get PCIE APPS reset control\n");
> > >                     return PTR_ERR(imx6_pcie->apps_reset);
> > >             }
> > > +
> > > +           imx6_pcie->pcie_aux = devm_clk_get(dev, "pcie_aux");
> > > +           if (IS_ERR(imx6_pcie->pcie_aux)) {
> > > +                   dev_err(dev, "pcie_aux clock source missing or invalid\n");
> > > +                   return PTR_ERR(imx6_pcie->pcie_aux);
> > > +           }
> > >             break;
> > >     default:
> > >             break;
>
> One can't see enough context in the patch above, but in linux-next this
> section is under
>
>          case IMX7D:
>          case IMX8MQ:
>
> It's being applied to imx7d and not just imx8mq and so breaks because
> imx7d dts files don't have this clock.  Not sure if this is a bug in
> this commit or some kind of merge/rebase mistake.
>

This is just a regular bug, I spaced out and missed the fact that this
path is shared between the two. I'll submit a patch moving "pci_aux"
clock request into a i.MX8MQ specific patch shortly.

Thanks,
Andrey Smirnov
