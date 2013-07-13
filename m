From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: DT binding review for Armada display subsystem
Date: Sat, 13 Jul 2013 21:51:52 +0100
Message-ID: <20130713205152.GO24642@n2100.arm.linux.org.uk>
References: <20130712164428.AC3D2FAAE9@dev.laptop.org>
 <20130712203952.6b7aa927@armhf>
 <CAMLZHHT1oAvOLe3JgQqMqLNXEr0NGrdtgELtF_djbqLFceHtiQ@mail.gmail.com>
 <20130713103516.38a55b0b@armhf> <51E13272.5040903@gmail.com>
 <20130713111239.GM24642@n2100.arm.linux.org.uk> <51E1921A.3070207@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E1921A.3070207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 13, 2013 at 07:44:58PM +0200, Sebastian Hesselbarth wrote:
> On 07/13/2013 01:12 PM, Russell King - ARM Linux wrote:
>> When I designed the clk API, I arranged for things like clk_get() to
>> take a reference on the module if the clock was supplied by a module.
>> You'll see some evidence of that by looking back in the git history
>> for arch/arm/mach-integrator/include/mach/clkdev.h.
>
> Last time I checked, clkdev API neither implements referencing nor
> unregister.

*Sigh*.

a613163dff04cbfcb7d66b06ef4a5f65498ee59b:
arch/arm/mach-integrator/include/mach/clkdev.h:
-struct clk {
-       unsigned long           rate;
-       const struct clk_ops    *ops;
-       struct module           *owner;
-       const struct icst_params *params;
-       void __iomem            *vcoreg;
-       void                    *data;
-};
-
-static inline int __clk_get(struct clk *clk)
-{
-       return try_module_get(clk->owner);
-}
-
-static inline void __clk_put(struct clk *clk)
-{
-       module_put(clk->owner);
-}

70ee65771424829fd092a1df9afcc7e24c94004b:
arch/arm/mach-integrator/impd1.c:
 static int impd1_probe(struct lm_device *dev)
...
-       for (i = 0; i < ARRAY_SIZE(impd1->vcos); i++) {
-               impd1->vcos[i].ops = &impd1_clk_ops,
-               impd1->vcos[i].owner = THIS_MODULE,
-               impd1->vcos[i].params = &impd1_vco_params,
-               impd1->vcos[i].data = impd1;
-       }
-       impd1->vcos[0].vcoreg = impd1->base + IMPD1_OSC1;
-       impd1->vcos[1].vcoreg = impd1->base + IMPD1_OSC2;
-
-       impd1->clks[0] = clkdev_alloc(&impd1->vcos[0], NULL, "lm%x:01000",
-                                       dev->id);
-       impd1->clks[1] = clkdev_alloc(&fixed_14745600, NULL, "lm%x:00100",
-                                       dev->id);
-       impd1->clks[2] = clkdev_alloc(&fixed_14745600, NULL, "lm%x:00200",
-                                       dev->id);
-       for (i = 0; i < ARRAY_SIZE(impd1->clks); i++)
-               clkdev_add(impd1->clks[i]);
...
 static void impd1_remove(struct lm_device *dev)
...
-       for (i = 0; i < ARRAY_SIZE(impd1->clks); i++)
-               clkdev_drop(impd1->clks[i]);

drivers/clk/clkdev.c:
/*
 * clkdev_drop - remove a clock dynamically allocated
 */
void clkdev_drop(struct clk_lookup *cl)
{
        mutex_lock(&clocks_mutex);
        list_del(&cl->node);
        mutex_unlock(&clocks_mutex);
        kfree(cl);
}
EXPORT_SYMBOL(clkdev_drop);

No, of course, I'm imagining all the above!

Now, today, the IM-PD/1 support got broken in respect of ensuring that
things are properly refcounted in the rush to convert things to this
wonderful new common clk API - because it's oh soooooo much better.  Yes,
right, I'd forgotten the number one rule of kernel programming - always
sacrifice correctness when we get a new fantasic hip idea!  Silly me.

> This is on Mike's list and IIRC there already has been
> a proposal for unregister. Si5351 was the first clkdev driver ever
> that could possibly be unloaded, so there may be still some features
> missing.

Utter rubbish - it's not the first as you can see from the above.
Integrator had this support since the clk and clkdev APIs came along,
because the IM-PD/1 module was implemented as a module, and it has to
create and register clocks for its peripherals.

What you've found is a backwards step with the common clk API, nothing
more.
