From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/8] PCI: Add Amazon's Annapurna Labs vendor ID
Date: Fri, 12 Jul 2019 08:04:37 -0500
Message-ID: <20190712130437.GB46935@google.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
 <20190710164519.17883-2-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710164519.17883-2-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2019 at 05:53:31PM +0300, Jonathan Chocron wrote:
> Add Amazon's Annapurna Labs vendor ID to pci_ids.h.
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  include/linux/pci_ids.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 0dd239f11e91..ed350fd522c6 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2568,6 +2568,8 @@
>  
>  #define PCI_VENDOR_ID_ASMEDIA		0x1b21
>  
> +#define PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS	0x1c36
> +
>  #define PCI_VENDOR_ID_CIRCUITCO		0x1cc8
>  #define PCI_SUBSYSTEM_ID_CIRCUITCO_MINNOWBOARD	0x0001
>  
> -- 
> 2.17.1
> 
> 
