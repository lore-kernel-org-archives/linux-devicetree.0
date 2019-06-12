From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 19/20] PCI: mobiveil: Add 8-bit and 16-bit register
 accessors
Date: Wed, 12 Jun 2019 14:54:00 +0100
Message-ID: <20190612135400.GB15747@redmoon>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-20-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190412083635.33626-20-Zhiqiang.Hou@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 08:37:05AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> There are some 8-bit and 16-bit registers in PCIe
> configuration space, so add accessors for them.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
> ---
> V5:
>  - Corrected and retouched the subject and changelog.
>  - No functionality change.
> 
>  drivers/pci/controller/pcie-mobiveil.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 411e9779da12..456adfee393c 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -268,11 +268,31 @@ static u32 csr_readl(struct mobiveil_pcie *pcie, u32 off)
>  	return csr_read(pcie, off, 0x4);
>  }
>  
> +static u32 csr_readw(struct mobiveil_pcie *pcie, u32 off)
> +{
> +	return csr_read(pcie, off, 0x2);
> +}
> +
> +static u32 csr_readb(struct mobiveil_pcie *pcie, u32 off)
> +{
> +	return csr_read(pcie, off, 0x1);
> +}
> +
>  static void csr_writel(struct mobiveil_pcie *pcie, u32 val, u32 off)
>  {
>  	csr_write(pcie, val, off, 0x4);
>  }
>  
> +static void csr_writew(struct mobiveil_pcie *pcie, u32 val, u32 off)
> +{
> +	csr_write(pcie, val, off, 0x2);
> +}
> +
> +static void csr_writeb(struct mobiveil_pcie *pcie, u32 val, u32 off)
> +{
> +	csr_write(pcie, val, off, 0x1);
> +}
> +

They are not used so you should drop this patch.

Lorenzo

>  static bool mobiveil_pcie_link_up(struct mobiveil_pcie *pcie)
>  {
>  	return (csr_readl(pcie, LTSSM_STATUS) &
> -- 
> 2.17.1
> 
