From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC/PATCH 2/4] PCI: Export PCI ACS and DMA searching functions
 to modules
Date: Wed, 22 May 2019 16:00:38 -0500
Message-ID: <20190522210038.GE79339@google.com>
References: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
 <1558118857-16912-3-git-send-email-isaacm@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558118857-16912-3-git-send-email-isaacm@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, frowand.list@gmail.com, joro@8bytes.org, robin.murphy@arm.com, will.deacon@arm.com, kernel-team@android.com, pratikp@codeaurora.org, lmark@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 11:47:35AM -0700, Isaac J. Manjarres wrote:
> IOMMU drivers that can be compiled as modules may
> want to use pci_for_each_dma_alias() and pci_request_acs(),
> so export those functions.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci.c    | 1 +
>  drivers/pci/search.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 766f577..3f354c1 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3124,6 +3124,7 @@ void pci_request_acs(void)
>  {
>  	pci_acs_enable = 1;
>  }
> +EXPORT_SYMBOL_GPL(pci_request_acs);
>  
>  static const char *disable_acs_redir_param;
>  
> diff --git a/drivers/pci/search.c b/drivers/pci/search.c
> index 2b5f720..cf9ede9 100644
> --- a/drivers/pci/search.c
> +++ b/drivers/pci/search.c
> @@ -111,6 +111,7 @@ int pci_for_each_dma_alias(struct pci_dev *pdev,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(pci_for_each_dma_alias);
>  
>  static struct pci_bus *pci_do_find_bus(struct pci_bus *bus, unsigned char busnr)
>  {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
