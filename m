From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/25] irq_domain generalization and refinement
Date: Sun, 05 Feb 2012 18:51:48 -0600
Message-ID: <4F2F2424.3060702@gmail.com>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
 <20120204221748.GN14129@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120204221748.GN14129-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Russell,

On 02/04/2012 04:17 PM, Russell King - ARM Linux wrote:
> On Fri, Jan 27, 2012 at 02:35:54PM -0700, Grant Likely wrote:
>> Hey everyone,
>>
>> This patch series is ready for much wider consumption now.  I'd like
>> to get it into linux-next ASAP because there will be ARM board support
>> depending on it.  I'll wait a few days before I ask Stephen to pull
>> this in.
> 
> Grant,
> 
> Can you answer me this: does this irqdomain support require DT?
> 

No. It's the other way around, DT requires irqdomain. The GIC and VIC
code for example can be built with or w/o DT enabled, but both select
IRQ_DOMAIN.

FYI, I just submitted a patch that selects IRQ_DOMAIN for all of ARM:

http://www.gossamer-threads.com/lists/linux/kernel/1487231?page=last

Either we do that or we select IRQ_DOMAIN one irq_chip at a time. With
the "new" irq_domain code, we could probably do better to shrink the
code needed in the non-DT case.

> The question comes up because OMAP has converted some of their support
> to require irq domain support for their PMICs, and it seems irq domain
> support requires DT.  This seems to have made the whole of OMAP
> essentially become a DT-only platform.

I think we should select DT or not at the sub-arch level. Trying to
support both builds is a needless headache.

> 
> Removing the dependency on IRQ_DOMAIN brings up these build errors
> in the twl-core code (that being the PMIC for OMAP CPUs):
> 
> drivers/mfd/twl-core.c: In function 'twl_probe':
> drivers/mfd/twl-core.c:1229: error: invalid use of undefined type 'struct irq_domain'
> drivers/mfd/twl-core.c:1230: error: invalid use of undefined type 'struct irq_domain'
> drivers/mfd/twl-core.c:1235: error: implicit declaration of function 'irq_domain_add'
> 
> That's a bit of a problem, because afaik there aren't the DT descriptions
> for the boards I have yet, so it's causing me to see regressions when
> building and booting kernels with CONFIG_OF=n.
> 
> The more core-code we end up with which requires DT, the worse this
> problem is going to become - and obviously saying "everyone must now
> convert to DT" is, even today, a mammoth task.
> 
> Now, here's the thing: I believe that IRQ domains - at least as far as
> the hwirq stuff - should be available irrespective of whether we have
> the rest of the IRQ domain support code in place, so that IRQ support
> code doesn't have to keep playing games to decode from the global
> space to the per-controller number space.
> 
> I believe that would certainly help the current OMAP problems, where
> the current lack of CONFIG_IRQ_DOMAIN basically makes the kernel oops
> on boot.
> 
> How we fix this regression for 3.4 I've no idea at present, I'm trying
> to work out what the real dependencies are for OMAP on this stuff.
> 
> Finally, do we need asm/irq.h in our asm/prom.h ?  That's causing
> fragility between DT and non-DT builds, because people are finding
> that their DT builds work without their mach/irqs.h includes but
> fail when built with non-DT.  The only thing which DT might need -
> at the most - is NR_IRQS, but I'd hope with things like irq domains
> it doesn't actually require it.

Doesn't look like it is needed.

Rob

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
