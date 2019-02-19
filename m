From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 0/2] "pcie_aux" clock for i.MX8MQ
Date: Tue, 19 Feb 2019 12:42:14 +0000
Message-ID: <20190219124214.GB15442@e107981-ln.cambridge.arm.com>
References: <20190212015108.16952-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212015108.16952-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 05:51:06PM -0800, Andrey Smirnov wrote:
> Lorenzo:
> 
> This small series adds code to control "pcie_aux" clock. This is an
> oversight from original submission [pcie-imx8mq-v7], which was only
> discovered once I submitted an RFC for corresponding DT changes going
> via i.MX tree [imx-dt-rfc].
> 
> Thanks,
> Andrey Smirnov
> 
> [imx-dt-rfc] https://lore.kernel.org/lkml/20190131204333.31846-1-andrew.smirnov@gmail.com
> [pcie-imx8mq-v7] https://lore.kernel.org/lkml/20190202001523.12517-1-andrew.smirnov@gmail.com
> 
> Andrey Smirnov (2):
>   dt-bindings: imx6q-pcie: Add "pcie_aux" clock for imx8mq
>   PCI: imx6: Add code to request/control "pcie_aux" clock for i.MX8MQ
> 
>  .../devicetree/bindings/pci/fsl,imx6q-pcie.txt   |  4 ++++
>  drivers/pci/controller/dwc/pci-imx6.c            | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)

Hi Andrey,

I have applied it to pci/dwc for v5.1, however it looks like it would
break the driver with an old dts - I assume that's expected but let
me know if there is a better way to handle this.

Lorenzo
