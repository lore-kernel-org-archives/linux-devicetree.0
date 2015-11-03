From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Tue, 3 Nov 2015 00:29:07 -0500
Message-ID: <56384623.80305@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <3962829.iR3I63FEm8@wuerfel> <5637B7C1.2070200@codeaurora.org>
 <17979873.Bg2pv5SLy6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17979873.Bg2pv5SLy6@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/2/2015 3:55 PM, Arnd Bergmann wrote:
> Are you using message signaled interrupts then?
> Typically MSI guarantees
> ordering against DMA, but level or edge triggered interrupts by definition
> cannot (at least on PCI, but most other buses are the same way), because
> the DMA master has no insight into when a DMA is actually complete.
>
> If you use MSI, please add a comment to the readl_relaxed() that it
> is safe because of that, otherwise the next person who tries to debug
> a problem with your driver has to look into this.

No, using regular GIC SPI interrupts at this moment. I know that HW 
doesn't use any of the typical AHB/AXI ARM buses.

I'm familiar with how PCI endpoints works. While the first read in a 
typical PCI endpoint ISR flushes all outstanding requests traditionally 
to the destination, this concept does not apply here for this HW.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
