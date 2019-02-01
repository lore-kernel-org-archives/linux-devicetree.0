From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 0/5] Add Oxalis board support
Date: Fri, 1 Feb 2019 08:58:17 +0530
Message-ID: <20190201032817.GA3008@Mani-XPS-13-9360>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 09:51:42AM +0530, Manivannan Sadhasivam wrote:
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

Hi Shawn,

Any update on this patchset?

Thanks,
Mani

> Changes in v3:
> 
> * Fixed LS1012A and LS1021A bindings
> * Added missing devicetree compatibles for LS1021A based boards
> * Added Rob's Reviewed-by tag for Vendor prefix patch
> 
> Changes in v2:
> 
> As per Rob's review:
> 
> * Adopted the Oxalis board binding to JSON format.
> * Sorted the EBS-SYSTART vendor prefix alphabetically.
> * Used the generic node name for audio codec.
> 
> Manivannan Sadhasivam (5):
>   dt-bindings: arm: fsl: Fix bindings for LS1012A and LS1021A based
>     boards
>   ARM: dts: Add devicetree compatibles for LS1021A based boards
>   dt-bindings: vendor-prefixes: Add EBS-SYSTART GmbH Vendor Prefix
>   dt-bindings: arm: fsl: Add devicetree binding for Oxalis
>   arm64: dts: freescale: Add devicetree for Oxalis
> 
>  .../devicetree/bindings/arm/fsl.yaml          | 11 ++-
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts   |  1 +
>  arch/arm/boot/dts/ls1021a-qds.dts             |  1 +
>  arch/arm/boot/dts/ls1021a-twr.dts             |  1 +
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/fsl-ls1012a-oxalis.dts | 96 +++++++++++++++++++
>  7 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dts
> 
> -- 
> 2.17.1
> 
