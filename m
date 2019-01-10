From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/3] Add Oxalis board support
Date: Thu, 10 Jan 2019 10:49:01 -0600
Message-ID: <CAL_JsqJt3aKGBPCu49OxJx0_HDu5r1W9NhRfREowaBMQ047dSA@mail.gmail.com>
References: <20190110080821.30280-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110080821.30280-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 2:08 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hello,
>
> This patchset adds Oxalis board support. This board is one of the
> 96Boards Enterprise Edition platform from EBS-SYSTART GmbH. Below are some
> of the key features of this board:
>
> * SoC: NXP Layerscape LS1012A
> * RAM: 1GB DDR3L
> * PMU: NXP VR5100
> * Storage: 64MByte SPI Flash for bootloader and RCW, MicroSD Card, SATA
> * Connectivity: 2x Ethernet
> * USB: 2x USB3.0
>
> More information about this board can be found in 96Boards product
> page: https://www.96boards.org/product/oxalis/
>
> Ethernet and SPI flash are not supported yet!
>
> Thanks,
> Mani
>
> Manivannan Sadhasivam (3):
>   dt-bindings: vendor-prefixes: Add EBS-SYSTART GmbH Vendor Prefix
>   dt-bindings: arm: fsl: Add devicetree binding for Oxalis
>   arm64: dts: freescale: Add devicetree for Oxalis
>
>  Documentation/devicetree/bindings/arm/fsl.txt |  4 +

This is converted to json-schema now (in Shawn's tree), so you'll need
to update to that.

Rob

>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/fsl-ls1012a-oxalis.dts | 96 +++++++++++++++++++
>  4 files changed, 102 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dts
>
> --
> 2.17.1
>
