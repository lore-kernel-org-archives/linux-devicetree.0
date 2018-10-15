From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 2/9] PCI: mediatek: Fix class type for MT7622 as
 PCI_CLASS_BRIDGE_PCI
Date: Mon, 15 Oct 2018 13:37:13 -0500
Message-ID: <20181015183713.GC5906@bhelgaas-glaptop.roam.corp.google.com>
References: <1539590940-13355-1-git-send-email-honghui.zhang@mediatek.com>
 <1539590940-13355-3-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539590940-13355-3-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, youlin.pei@mediatek.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, marc.zyngier@arm.com, jianjun.wang@mediatek.com, yt.shen@mediatek.com, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, yong.wu@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 15, 2018 at 04:08:53PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The commit 101c92dc80c8 ("PCI: mediatek: Set up vendor ID and class
> type for MT7622") have set the class type for MT7622 as un-properly
> value of PCI_CLASS_BRIDGE_HOST.
> 
> The PCIe controller of MT7622 is complexed with Root Port and PCI-to-PCI
> bridge, the bridge has type 1 configuration space header and related bridge
> windows. The HW default value of this bridge's class type is invalid. Fix
> its class type as PCI_CLASS_BRIDGE_PCI since it is HW defines.
> 
> Making the bridge visiable to PCI framework by setting its class type
> properly will get its bridge windows configurated during PCI device
> enumerate.
> 
> Fixes: 101c92dc80c8 ("PCI: mediatek: Set up vendor ID and class type for MT7622")
> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>

Nak until this patch is preceded by one that fixes the PCI core defect
I pointed out earlier [1].  It's OK to change the class code, but
not as a way of working around that PCI core defect.

[1] https://lore.kernel.org/linux-pci/20181012141202.GV5906@bhelgaas-glaptop.roam.corp.google.com

> ---
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 288b8e2..bcdac9b 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -432,7 +432,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		val = PCI_VENDOR_ID_MEDIATEK;
>  		writew(val, port->base + PCIE_CONF_VEND_ID);
>  
> -		val = PCI_CLASS_BRIDGE_HOST;
> +		val = PCI_CLASS_BRIDGE_PCI;
>  		writew(val, port->base + PCIE_CONF_CLASS_ID);
>  	}
>  
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
