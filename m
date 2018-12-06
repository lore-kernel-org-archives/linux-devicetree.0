From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v2 0/3] PCIE support for i.MX8MQ
Date: Thu, 6 Dec 2018 12:15:50 +0000
Message-ID: <20181206121550.GA2725@e107981-ln.cambridge.arm.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206073545.10967-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 11:35:42PM -0800, Andrey Smirnov wrote:
> Everyone:
> 
> This series contains changes I made in order to enable support of PCIE
> IP block on i.MX8MQ SoCs (full tree can be found at [github-v2]).
> 
> NOTE: The last patch have a Kconfig symbol depenency on [imx8mq-kconfig].
> 
> Changes since [v1]:
> 
>  - Driver changed to use single "fsl,controller-id" property to
>    distinguish between two intances of PCIE IP block
> 
>  - All code pertaining to L1SS was dropped to simplify the patch
> 
>  - Documented additions to DT bindings
> 
> Feedback is welcome!
> 
> Thanks,
> Andrey Smirnov

Andrey,

I have applied the patches, I would like to make the CC list in standard
format so I kindly ask you firstname/surname for cphealy@gmail.com, I
could not find it in the maintainers list but I want to keep the CC
list as per patches (I removed the lists, though).

Thanks,
Lorenzo

> [v1] https://lore.kernel.org/linux-arm-kernel/20181117181225.10737-1-andrew.smirnov@gmail.com/
> [github-v2] https://github.com/ndreys/linux/commits/imx8mq-pcie-v2
> [imx8mq-kconfig] https://lore.kernel.org/linux-arm-kernel/20181114175242.12468-1-l.stach@pengutronix.de/
> 
> Andrey Smirnov (3):
>   PCI: imx: No-op imx6_setup_phy_mpll() on i.MX7D
>   PCI: imx: No-op imx6_pcie_reset_phy() on i.MX7D
>   PCI: imx: Add support for i.MX8MQ
> 
>  .../bindings/pci/fsl,imx6q-pcie.txt           |  6 +-
>  drivers/pci/controller/dwc/Kconfig            |  2 +-
>  drivers/pci/controller/dwc/pci-imx6.c         | 87 ++++++++++++++++++-
>  3 files changed, 90 insertions(+), 5 deletions(-)
> 
> -- 
> 2.19.1
> 
