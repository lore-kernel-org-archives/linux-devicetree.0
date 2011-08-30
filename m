From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC PATCH 0/3] Yet another GIC OF binding series
Date: Tue, 30 Aug 2011 11:26:33 +0800
Message-ID: <20110830032633.GB19294@S2100-06.ap.freescale.net>
References: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, grant.likely@secretlab.ca, thomas.abraham@linaro.org, jamie@jamieiles.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2011 at 03:16:57PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Grant,
> 
> Here's yet another patch series for GIC binding and init. 
> 
> You keep saying we should have a common DT function scanning for interrupt
> controller nodes and calling their initialization functions. But that will
> not work until we have dynamic assignment of linux irq numbers. So either
> everyone should just stop trying to do DT bindings for GIC/VIC until that
> is in place, or we need an interim solution.

Yes, we need a way out.  I based my i.MX6Q series on this patch set.
With the v2 of "ARM: gic: add OF based initialization" in,

Acked-by: Shawn Guo <shawn.guo@linaro.org>
Tested-by: Shawn Guo <shawn.guo@linaro.org>

Regards,
Shawn

> This is another attempt at
> the latter. I reworked gic_of_init intending for it to be the interrupt
> controller specific initialization function that DT interrupt controller
> scanning code would call. For now, it is just called by the platform code.
> The platform initialization looks something like this:
> 
> struct of_intc_desc desc;
> memset(&desc, 0, sizeof(desc));
> desc.controller = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-gic");
> gic_of_init(&desc);
> 
> I've addressed your previous comments and in particular initializing more
> than 1 GIC is supported now.
> 
> Rob
> 
> Rob Herring (3):
>   dt: irq: add interrupt controller descriptor struct
>   ARM: gic: allow irq_start to be 0
>   ARM: gic: add OF based initialization
> 
>  Documentation/devicetree/bindings/arm/gic.txt |   28 +++++++++++++++++++
>  arch/arm/common/gic.c                         |   36 ++++++++++++++++++++++++-
>  arch/arm/include/asm/hardware/gic.h           |    2 +
>  include/linux/of_irq.h                        |    6 ++++
>  4 files changed, 71 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
> 
> -- 
> 1.7.4.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
