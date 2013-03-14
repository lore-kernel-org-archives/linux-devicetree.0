From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH V7 1/2] ARM: bcm281xx: Add timer driver (driver
 portion)
Date: Thu, 14 Mar 2013 10:16:50 +0100 (CET)
Message-ID: <alpine.LFD.2.02.1303140951580.22263@ionos>
References: <1363210048-3334-1-git-send-email-csd@broadcom.com>
 <51410BF4.4040400@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51410BF4.4040400-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2013, John Stultz wrote:
> On 03/13/2013 02:27 PM, Christian Daudt wrote:
> > This adds support for the Broadcom timer, used in the following SoCs:
> > BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
> [snip]
> > Signed-off-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Acked-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Hey Olof,
>     So Christian mentioned you were hoping I'd pull these in through my tree,
> but I'd really rather these go via the arch-soc tree, since that is more
> likely where they will be tested and more intelligently reviewed.
> 
> I've mentioned before my distaste for the drivers/clocksource directory
> becoming a dumping ground for arch specific (for the most part arm)
> clocksource, and more recently clockevent, drivers. I initially wanted the

OTOH, if they are all in one place we have a better chance to analyze
them in bulk, find similarities and patterns for consolidation. And
it's simpler for the developer of a new SoC support to find the
matching driver for his IP block instead of copying stuff from one
mach directory to the next. We've been there :)

> But I'd really rather the patch flow for arch specific clocksource and
> clockevent drivers go through the arch tree, since there's a better chance
> folks will be building and testing against other arch specific changes that
> might cause problems. There's just no way for me to be able to intelligently
> review these sorts of changes.

I agree with the build and test part, but you can still review the
code in general - correctness of the particular hw details aside. I
just opened a random one there and found:

static cycle_t vt8500_timer_read(struct clocksource *cs)
{
        int loops = msecs_to_loops(10);
        writel(3, regbase + TIMER_CTRL_VAL);
        while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
                                                && --loops)
                cpu_relax();
        return readl(regbase + TIMER_COUNT_VAL);

You don't need particular hw knowledge to see that this looks more
than fishy at least without comments describing the hardware designers
brainfart.
 
> Now, if there are changes to the clocksource core code, then I definitely want
> to be in the path there. Additionally meta-drivers like mmio, I should
> probably be more involved with, so they can be more properly integrated into
> the clocksource core. Also for drivers that are actually arch shared (ie:
> things like hpet/acpi_pm where ia64 and x86 share them).
> 
> But if its arch specific for hardware I don't have, I'd really prefer the arch
> maintainer be the upstream path.
> 
> Thomas: Am I being too obstinate here?  If not, should we drop "F:
> drivers/clocksource" from the MAINTAINERS entry?

Maybe we should move the ARM specific ones into
drivers/clocksource/arm/ ?
 
Thanks,

	tglx
