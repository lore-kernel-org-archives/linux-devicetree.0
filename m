From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: Add support for NXP LS1028A SoC
Date: Mon, 26 Nov 2018 22:42:10 +0800
Message-ID: <20181126144208.GC31334@dragon>
References: <1542156591-3224-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
 <1542156591-3224-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1542156591-3224-2-git-send-email-Bhaskar.Upadhaya@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Harninder Rai <harninder.rai@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 14, 2018 at 05:30:52AM +0000, Bhaskar Upadhaya wrote:
> LS1028A contains two ARM v8 CortexA72 processor cores
> with 32 KB L1-D cache and 48 KB L1-I cache
> 
> Features summary
>  Two 32-bit / 64-bit ARM v8 Cortex-A72 CPUs
>   - Arranged as single clusters of two cores sharing a 1 MB L2 cache
>   - Speed Up to 1.3 GHz
>   - Support for cluster power-gating.
>  Cache coherent interconnect (CCI-400)
>   - Hardware-managed data coherency
>   - Up to 400 MHz
>  32-bit DDR4 SDRAM memory controller with ECC
>  Two PCIe 3.0 controllers
>  One serial ATA (SATA 3.0) controller
>  Two high-speed USB 3.0 controllers with integrated PHY
> 
>  Following levels of DTSI/DTS files have been created for the LS1028A
>   SoC family:
> 
>          - fsl-ls1028a.dtsi:
>                  DTS-Include file for NXP LS1028A SoC.
> 
>          - fsl-ls1028a-qds.dts:
>                  DTS file for NXP LS1028A QDS board.
> 
>          - fsl-ls1028a-rdb.dts:
>                  DTS file for NXP LS1028A RDB board
> 
> Signed-off-by: Sudhanshu Gupta <sudhanshu.gupta@nxp.com>
> Signed-off-by: Rai Harninder <harninder.rai@nxp.com>
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>

@Leo, looks good to you?

Shawn
