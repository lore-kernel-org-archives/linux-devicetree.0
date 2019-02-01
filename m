From: Michael Bittner <m.bittner@ebs-systart.com>
Subject: AW: [PATCH v3 0/5] Add Oxalis board support
Date: Fri, 01 Feb 2019 06:43:58 +0100
Message-ID: <209ab7e9.1d4b9f1.197c0e38.52d9@ebs-systart.com>
References: <20190201032817.GA3008@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201032817.GA3008@Mani-XPS-13-9360>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, a.tropschug@ebs-systart.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello @all,

in the meantime all interfaces are supported. Following a short overview.

> * RAM: 2GB (!) DDR3L
> * PMU: NXP VR5100
> * Storage: 64MByte SPI Flash for bootloader and RCW, MicroSD Card, =

> * mSATA 3.0
> * Connectivity: 2x Ethernet
> * miniPCIe
> * SD Card
> * USB: 2x USB3.0
> * I2C x 2: 2x 96Boards Expansion Connector
> * UART x 2: 1 x Terminal and 1x 96Boards Expansion Connector
> * SPI: 1x 96Boards Expansion Connector
> * GPIOs =


The first 96Board Community Header Board will be available in March, this i=
s currently in production.
I will put the schematics online soon. If you have any information missing =
please let me know. =


Best regards,
Michael

--
Tel.: +49 (0)8142/30505-0
Fax: +49 (0)8142/30505-50
Mail: m.bittner@ebs-systart.com
Internet: www.ebs-systart.com

EBS-SYSTART GmbH
Industriestra=DFe 33a
D-82194 Gr=F6benzell

Amtsgericht M=FCnchen, HRB 70338, UST-IdNr. DE128221970
Gesch=E4ftsf=FChrer: Michael Bittner


-----Urspr=FCngliche Nachricht-----
Von: Manivannan Sadhasivam [mailto:manivannan.sadhasivam@linaro.org] =

Gesendet: Freitag, 1. Februar 2019 04:28
An: shawnguo@kernel.org
Cc: leoyang.li@nxp.com; robh+dt@kernel.org; linux-arm-kernel@lists.infradea=
d.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; a.tropschu=
g@ebs-systart.com; m.bittner@ebs-systart.com; amit.kucheria@linaro.org
Betreff: Re: [PATCH v3 0/5] Add Oxalis board support

On Tue, Jan 22, 2019 at 09:51:42AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> =

> This patchset adds Oxalis board support. This board is one of the
> 96Boards Enterprise Edition platform from EBS-SYSTART GmbH. Below are some
> of the key features of this board:
> =

> * SoC: NXP Layerscape LS1012A
> * RAM: 1GB DDR3L
> * PMU: NXP VR5100
> * Storage: 64MByte SPI Flash for bootloader and RCW, MicroSD Card, SATA
> * Connectivity: 2x Ethernet
> * USB: 2x USB3.0
> =

> More information about this board can be found in 96Boards product
> page: https://www.96boards.org/product/oxalis/
> =

> Ethernet and SPI flash are not supported yet!
> =

> Thanks,
> Mani
> =


Hi Shawn,

Any update on this patchset?

Thanks,
Mani

> Changes in v3:
> =

> * Fixed LS1012A and LS1021A bindings
> * Added missing devicetree compatibles for LS1021A based boards
> * Added Rob's Reviewed-by tag for Vendor prefix patch
> =

> Changes in v2:
> =

> As per Rob's review:
> =

> * Adopted the Oxalis board binding to JSON format.
> * Sorted the EBS-SYSTART vendor prefix alphabetically.
> * Used the generic node name for audio codec.
> =

> Manivannan Sadhasivam (5):
>   dt-bindings: arm: fsl: Fix bindings for LS1012A and LS1021A based
>     boards
>   ARM: dts: Add devicetree compatibles for LS1021A based boards
>   dt-bindings: vendor-prefixes: Add EBS-SYSTART GmbH Vendor Prefix
>   dt-bindings: arm: fsl: Add devicetree binding for Oxalis
>   arm64: dts: freescale: Add devicetree for Oxalis
> =

>  .../devicetree/bindings/arm/fsl.yaml          | 11 ++-
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts   |  1 +
>  arch/arm/boot/dts/ls1021a-qds.dts             |  1 +
>  arch/arm/boot/dts/ls1021a-twr.dts             |  1 +
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/fsl-ls1012a-oxalis.dts | 96 +++++++++++++++++++
>  7 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dts
> =

> -- =

> 2.17.1
> =
