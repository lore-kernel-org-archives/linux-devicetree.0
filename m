From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 0/3] PCIE support for i.MX8MQ
Date: Fri, 14 Dec 2018 21:25:04 -0800
Message-ID: <CAHQ1cqG3s4J42V3oUPOGssUPw6dypZqYrtpkRphHPdiYFs9j1g@mail.gmail.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com>
 <20181206121550.GA2725@e107981-ln.cambridge.arm.com> <20181214203828.GD20725@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214203828.GD20725@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: helgaas@kernel.org
Cc: lorenzo.pieralisi@arm.com, Dong Aisheng <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-imx@nxp.com, Leonard Crestez <leonard.crestez@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Trent Piepho <tpiepho@impinj.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 12:38 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Trent]
>
> On Thu, Dec 06, 2018 at 12:15:50PM +0000, Lorenzo Pieralisi wrote:
> > On Wed, Dec 05, 2018 at 11:35:42PM -0800, Andrey Smirnov wrote:
> > > Everyone:
> > >
> > > This series contains changes I made in order to enable support of PCIE
> > > IP block on i.MX8MQ SoCs (full tree can be found at [github-v2]).
> > >
> > > NOTE: The last patch have a Kconfig symbol depenency on [imx8mq-kconfig].
> > >
> > > Changes since [v1]:
> > >
> > >  - Driver changed to use single "fsl,controller-id" property to
> > >    distinguish between two intances of PCIE IP block
> > >
> > >  - All code pertaining to L1SS was dropped to simplify the patch
> > >
> > >  - Documented additions to DT bindings
> > >
> > > Feedback is welcome!
> > >
> > > Thanks,
> > > Andrey Smirnov
> >
> > Andrey,
> >
> > I have applied the patches, ...
>
> When I merged your pci/dwc branch, I noticed what looks like a merge
> conflict between these commits:
>
>   d123765b58ee ("PCI: dwc: Adjust Kconfig to allow IMX6 PCIe host on IMX7")
>   1a059d994189 ("PCI: imx: Add support for i.MX8MQ")
>
> d123765b58ee added SOC_IMX7D:
>
>   -       depends on SOC_IMX6Q || (ARM && COMPILE_TEST)
>   +       depends on SOC_IMX6Q || SOC_IMX7D || (ARM && COMPILE_TEST)
>
> and 1a059d994189 added SOC_IMX8MQ but dropped SOC_IMX7D again, which looks
> like a mistake:
>
>   -       depends on SOC_IMX6Q || SOC_IMX7D || (ARM && COMPILE_TEST)
>   +       depends on SOC_IMX8MQ || SOC_IMX6Q || (ARM && COMPILE_TEST)
>
> So my "next" branch[1] (current head 7053eeb009e0) is:
>
>   config PCI_IMX6
>         bool "Freescale i.MX6/7 PCIe controller"
>         depends on SOC_IMX8MQ || SOC_IMX6Q || (ARM && COMPILE_TEST)
>         depends on PCI_MSI_IRQ_DOMAIN
>         select PCIE_DW_HOST
>
> which I think is wrong.

Yeah, this is definitely wrong, should be SOC_IMX8MQ || SOC_IMX6Q ||
SOC_IMX7D || (ARM && COMPILE_TEST)

> Lorenzo, if you update your pci/dwc branch,  I'll rebuild my "next" branch.
>
> If you want to tweak the switch statements and/or IMX8 checks, you
> could do that at the same time.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=next

OK, I'll use the branch above for v3 of the patches.

Thanks,
Andrey Smirnov
