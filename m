From: Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH][v2] arm64: Add DTS support for FSL's LS1012A SoC
Date: Thu, 24 Nov 2016 07:18:13 +0000
Message-ID: <DB6PR0401MB2407706FA8B5874F36D6D74489B60@DB6PR0401MB2407.eurprd04.prod.outlook.com>
References: <1479320647-24460-1-git-send-email-harninder.rai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479320647-24460-1-git-send-email-harninder.rai@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "oss@buserror.net" <oss@buserror.net>, Harninder Rai <harninder.rai@nxp.com>, Bhaskar U <bhaskar.upadhaya@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn and All,

Any comment for this LS1012A platform support patch?

Is this a good enough base for consequence dts update patches?  

If yes, I'd like to send some dts patches for DSPI and QSPI based on this patch. 

Thanks.
Yao

On 11/17/2016 02:24 AM, Harninder Rai wrote:
> LS1012A features an advanced 64-bit ARM v8 CortexA53 processor with 32 KB
> of parity protected L1-I cache, 32 KB of ECC protected L1-D cache, as well as 256
> KB of ECC protected L2 cache.
> 
> Features summary
>  One 64-bit ARM-v8 Cortex-A53 core with the following capabilities
>   - Arranged as a cluster of one core supporting a 256 KB L2 cache with ECC
>     protection
>   - Speed up to 800 MHz
>   - Parity-protected 32 KB L1 instruction cache and 32 KB L1 data cache
>   - Neon SIMD engine
>   - ARM v8 cryptography extensions
>  One 16-bit DDR3L SDRAM memory controller  ARM core-link CCI-400 cache
> coherent interconnect  Cryptography acceleration (SEC)  One Configurable x3
> SerDes  One PCI Express Gen2 controller, supporting x1 operation  One serial
> ATA (SATA Gen 3.0) controller  One USB 3.0/2.0 controller with integrated PHY
> 
>  Following levels of DTSI/DTS files have been created for the LS1012A
>    SoC family:
> 
>            - fsl-ls1012a.dtsi:
>                    DTS-Include file for FSL LS1012A SoC.
> 
>            - fsl-ls1012a-frdm.dts:
>                    DTS file for FSL LS1012A FRDM board.
> 
>            - fsl-ls1012a-qds.dts:
>                    DTS file for FSL LS1012A QDS board.
> 
>            - fsl-ls1012a-rdb.dts:
>                     DTS file for FSL LS1012A RDB board.
> 
> Signed-off-by: Harninder Rai <harninder.rai@nxp.com>
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
> ---
> Changes in v2: Incorporated Shawn's comments
> - Brief introduction of the SoC in commit message
> - Alphabetic ordering of labeled nodes
> - Better naming to be used for regulator node
> - Make timer node's comments more readable
> - Sort nodes with unit-address in order of the address
> 
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 115 ++++++++++
> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  | 128 +++++++++++
> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts  |  59 +++++
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     | 245
> +++++++++++++++++++++
>  5 files changed, 550 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> 
