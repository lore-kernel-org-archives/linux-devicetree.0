From: Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Subject: Re: [V10 PATCH 2/2] irqchip: gicv2m: Add supports for ARM GICv2m
 MSI(-X)
Date: Wed, 5 Nov 2014 18:23:08 -0600
Message-ID: <545ABF6C.1000308@amd.com>
References: <1415052977-26036-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1415052977-26036-3-git-send-email-suravee.suthikulpanit@amd.com>
 <5458CE31.3040404@linux.intel.com> <545ABB4C.8010103@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <545ABB4C.8010103@amd.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>, marc.zyngier@arm.com, mark.rutland@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: Catalin.Marinas@arm.com, Will.Deacon@arm.com, liviu.dudau@arm.com, Harish.Kasiviswanathan@amd.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/5/2014 6:05 PM, Suravee Suthikulanit wrote:
> - Overall, it seems that msi_domain_alloc() could be quite different
> across architectures. Would it be possible to declare this function as
> weak, and allow arch to override (similar to arch_setup_msi_irq)?

Actually, declaring "msi_domain_ops" as non-static, and allow other code 
to override the .alloc and .free?

Thanks,

Suravee
