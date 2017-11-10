From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCHv4 1/3] ARMv8: dts: ls1046a: add the property of IB and OB
Date: Fri, 10 Nov 2017 11:52:21 +0530
Message-ID: <20b8f1d2-f817-469f-afbf-66f25d6f8c46@ti.com>
References: <20171110034847.17891-1-xiaowei.bao@nxp.com>
 <20171110034847.17891-2-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171110034847.17891-2-xiaowei.bao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bao Xiaowei <xiaowei.bao@nxp.com>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, bhelgaas@google.com, shawnguo@kernel.org, madalin.bucur@nxp.com, sumit.garg@nxp.com, yangbo.lu@nxp.com, hongtao.jia@nxp.com, Yuantian.Tang@nxp.com, leoyang.li@nxp.com, jingoohan1@gmail.com, pbrobinson@gmail.com, songxiaowei@hisilicon.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, Minghuan.Lian@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Bao,

On Friday 10 November 2017 09:18 AM, Bao Xiaowei wrote:
> Add the property of inbound and outbound windows number for ep
> driver.
> 
> Signed-off-by: Bao Xiaowei <xiaowei.bao@nxp.com>
> Acked-by: Minghuan Lian <minghuan.Lian@nxp.com>
> ---
>  v2:
>  - no change
>  v3:
>  - modify the commit message
>  v4:
>  - no change
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

$subject should start with something like
arm64: dts: ls1046a: **
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 06b5e12d04d8..f8332669663c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -674,6 +674,8 @@
>  			device_type = "pci";
>  			dma-coherent;
>  			num-lanes = <4>;
> +			num-ib-windows = <6>;
> +			num-ob-windows = <6>;

EP specific properties shouldn't be added in RC dt node. Ideally you should
have a separate dt node for RC and EP.

Thanks
Kishon
