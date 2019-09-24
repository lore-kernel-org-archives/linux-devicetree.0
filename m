From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 4/6] PCI: mobiveil: Add workaround for unsupported
 request error
Date: Tue, 24 Sep 2019 17:49:30 +0100
Message-ID: <20190924164930.GZ25745@shell.armlinux.org.uk>
References: <20190916021742.22844-1-xiaowei.bao@nxp.com>
 <20190916021742.22844-5-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190916021742.22844-5-xiaowei.bao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, Minghuan.Lian@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, bhelgaas@google.com, andrew.murray@arm.com, kishon@ti.com, shawnguo@kernel.org, mingkai.hu@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 10:17:40AM +0800, Xiaowei Bao wrote:
> Errata: unsupported request error on inbound posted write
> transaction, PCIe controller reports advisory error instead
> of uncorrectable error message to RC.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c | 13 +++++++++++++
>  drivers/pci/controller/mobiveil/pcie-mobiveil.h           |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c
> index 7bfec51..5bc9ed7 100644
> --- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c
> +++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4-ep.c
> @@ -49,6 +49,19 @@ static void ls_pcie_g4_ep_init(struct mobiveil_pcie_ep *ep)
>  	struct mobiveil_pcie *mv_pci = to_mobiveil_pcie_from_ep(ep);
>  	int win_idx;
>  	u8 bar;
> +	u32 val;
> +
> +	/*
> +	 * Errata: unsupported request error on inbound posted write
> +	 * transaction, PCIe controller reports advisory error instead
> +	 * of uncorrectable error message to RC.
> +	 * workaround: set the bit20(unsupported_request_Error_severity) with
> +	 * value 1 in uncorrectable_Error_Severity_Register, make the
> +	 * unsupported request error generate the fatal error.
> +	 */
> +	val =  csr_readl(mv_pci, CFG_UNCORRECTABLE_ERROR_SEVERITY);
> +	val |= 1 << UNSUPPORTED_REQUEST_ERROR_SHIFT;

	       BIT(UNSUPPORTED_REQUEST_ERROR_SHIFT) ?

> +	csr_writel(mv_pci, val, CFG_UNCORRECTABLE_ERROR_SEVERITY);
>  
>  	ep->bar_num = PCIE_LX2_BAR_NUM;
>  
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> index 7308fa4..a40707e 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> @@ -123,6 +123,10 @@
>  #define GPEX_BAR_SIZE_UDW		0x4DC
>  #define GPEX_BAR_SELECT			0x4E0
>  
> +#define CFG_UNCORRECTABLE_ERROR_SEVERITY	0x10c
> +#define UNSUPPORTED_REQUEST_ERROR_SHIFT		20
> +#define CFG_UNCORRECTABLE_ERROR_MASK		0x108
> +
>  /* starting offset of INTX bits in status register */
>  #define PAB_INTX_START			5
>  
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
