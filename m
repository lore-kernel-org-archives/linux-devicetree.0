From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: gicv2m: Clean up logic for detecting MSI
 support
Date: Fri, 18 Jul 2014 15:57:08 -0400
Message-ID: <20140718195708.GH24496@titan.lakedaemon.net>
References: <1405689996-3601-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405689996-3601-1-git-send-email-suravee.suthikulpanit@amd.com>
Sender: linux-doc-owner@vger.kernel.org
To: suravee.suthikulpanit@amd.com
Cc: marc.zyngier@arm.com, mark.rutland@arm.com, pawel.moll@arm.com, Catalin.Marinas@arm.com, Will.Deacon@arm.com, tglx@linutronix.de, Harish.Kasiviswanathan@amd.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 18, 2014 at 08:26:36AM -0500, suravee.suthikulpanit@amd.com wrote:
> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> 
> It's not quite clear that msi-controller is already checked
> by of_msi_chip_add. So, this patch add a note to clarify.
> 
> Also, clean up redundant logic and unnecessary pr_info.
> 
> Cc: Mark Rutland <Mark.Rutland@arm.com>
> Cc: Marc Zyngier <Marc.Zyngier@arm.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Catalin Marinas <Catalin.Marinas@arm.com>
> Cc: Will Deacon <Will.Deacon@arm.com>
> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
> ---
> 
> Note: This patch is created against irqchip/gic branch.
> 
>  drivers/irqchip/irq-gic-v2m.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to the unstable branch irqchip/gic-v2m until Marc returns from
vacation.  Please see my email to MarkR on your previous series
regarding the re-shuffling of the branches.

thx,

Jason.
