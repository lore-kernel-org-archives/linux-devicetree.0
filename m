From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: Re: [V10 PATCH 2/2] irqchip: gicv2m: Add supports for ARM GICv2m
 MSI(-X)
Date: Tue, 4 Nov 2014 11:00:31 -0600
Message-ID: <5459062F.6090603@amd.com>
References: <1415052977-26036-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1415052977-26036-3-git-send-email-suravee.suthikulpanit@amd.com>
 <5458CE31.3040404@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <5458CE31.3040404@linux.intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>, marc.zyngier@arm.com, mark.rutland@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: Catalin.Marinas@arm.com, Will.Deacon@arm.com, liviu.dudau@arm.com, Harish.Kasiviswanathan@amd.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/4/14 07:01, Jiang Liu wrote:
> Hi Suravee,
> 	You may build a two level hierarchy irqdomains. Use the
> utilities in this thread
> http://www.spinics.net/lists/arm-kernel/msg374722.html to build an MSI
> irqdomain to manage MSI controllers
> in PCI devices. And build another irqdomain to manage SPI allocation
> in GICv2.
> 	That is: MSI irqdomain (program MSI registers)  -->
> GIV irqdomain (manage SPIs in GICv2 controller)

That's great. I'll look at this patch in and make use of it to create to 
MSI domain.

Thanks,

Suravee

> Regards!
> Gerry
