From: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Subject: RE: [PATCH 0/4] irqchip: gic-v2m: Rework GICv2m Initialization
Date: Mon, 11 Aug 2014 13:30:50 +0000
Message-ID: <02D2024799561B48A732D1A51CB969E836F74ABC@satlexdag05.amd.com>
References: <1407539836-9768-1-git-send-email-suravee.suthikulpanit@amd.com>
 <53E87ADA.6040204@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <53E87ADA.6040204@arm.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: 'Marc Zyngier' <marc.zyngier@arm.com>
Cc: 'Mark Rutland' <Mark.Rutland@arm.com>, "'jason@lakedaemon.net'" <jason@lakedaemon.net>, 'Pawel Moll' <Pawel.Moll@arm.com>, 'Catalin Marinas' <Catalin.Marinas@arm.com>, 'Will Deacon' <Will.Deacon@arm.com>, "'tglx@linutronix.de'" <tglx@linutronix.de>, "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, "'linux-pci@vger.kernel.org'" <linux-pci@vger.kernel.org>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'linux-doc@vger.kernel.org'" <linux-doc@vger.kernel.org>, "'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Marc,

Jason already created a branch irqchip/gic-v2m, which I have created my patch against.  So, what branch do you want me to re-create a patch against for you to review?

Suravee

-----Original Message-----
From: Marc Zyngier [mailto:marc.zyngier@arm.com] 
Sent: Monday, August 11, 2014 3:12 AM
To: Suthikulpanit, Suravee
Cc: Mark Rutland; jason@lakedaemon.net; Pawel Moll; Catalin Marinas; Will Deacon; tglx@linutronix.de; Kasiviswanathan, Harish; linux-arm-kernel@lists.infradead.org; linux-pci@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org; devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] irqchip: gic-v2m: Rework GICv2m Initialization

Hi Suravee,

On 09/08/14 00:17, suravee.suthikulpanit@amd.com wrote:
> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> 
> This patch set reworks the GICv2m initialization based on Marc Zyngier 
> review comments.
> 
> * Rebase to git://git.infradead.org/users/jcooper/linux.git 
> irqchip/gic-v2m
> 
> Suravee Suthikulpanit (1):
>   irqchip/gic-v2m: Restructure the initalization code for v2m
> 
>  Documentation/devicetree/bindings/arm/gic.txt |  37 +++++++--
>  drivers/irqchip/irq-gic-v2m.c                 | 115 +++++++++-----------------
>  drivers/irqchip/irq-gic.c                     |  30 +++----
>  drivers/irqchip/irq-gic.h                     |  10 +--
>  4 files changed, 91 insertions(+), 101 deletions(-)
> 

While I appreciate that you're trying to reduce the amount of stuff we review, it is actually much easier to look at the patch series as a whole, rather then as a diff against the previous version.

Please squash this into your original series and repost it with a log of what has changed in the cover letter.

Thanks,

	M.
--
Jazz is not dead. It just smells funny...
