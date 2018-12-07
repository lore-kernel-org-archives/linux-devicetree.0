From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 0/3] PCIE support for i.MX8MQ
Date: Thu, 6 Dec 2018 18:44:11 -0800
Message-ID: <CAHQ1cqHVjNTQrHi2BgR9k74hKD8Wh93FqMoeZPmNEhGWnEmdjQ@mail.gmail.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com> <20181206121550.GA2725@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206121550.GA2725@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 6, 2018 at 4:15 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Wed, Dec 05, 2018 at 11:35:42PM -0800, Andrey Smirnov wrote:
> > Everyone:
> >
> > This series contains changes I made in order to enable support of PCIE
> > IP block on i.MX8MQ SoCs (full tree can be found at [github-v2]).
> >
> > NOTE: The last patch have a Kconfig symbol depenency on [imx8mq-kconfig].
> >
> > Changes since [v1]:
> >
> >  - Driver changed to use single "fsl,controller-id" property to
> >    distinguish between two intances of PCIE IP block
> >
> >  - All code pertaining to L1SS was dropped to simplify the patch
> >
> >  - Documented additions to DT bindings
> >
> > Feedback is welcome!
> >
> > Thanks,
> > Andrey Smirnov
>
> Andrey,
>
> I have applied the patches, I would like to make the CC list in standard
> format so I kindly ask you firstname/surname for cphealy@gmail.com, I
> could not find it in the maintainers list but I want to keep the CC
> list as per patches (I removed the lists, though).

Oh, sorry about that! That would be Chris Healy <cphealy@gmail.com>.
Let me know if anything else is needed.

Thanks,
Andrey Smirnov
