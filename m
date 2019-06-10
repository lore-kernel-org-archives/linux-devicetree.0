From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 1/2] irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ
 ERR11171
Date: Mon, 10 Jun 2019 13:38:31 +0000
Message-ID: <20190610133830.iruld46dgb2gvnx5@fsr-ub1664-175>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610121346.15779-2-abel.vesa@nxp.com>
 <7d8a537d-7883-196a-bcb3-7ee36117074a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7d8a537d-7883-196a-bcb3-7ee36117074a@arm.com>
Content-Language: en-US
Content-ID: <C4D767B327A84E4B86BDF4999383F0A6@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jacky Bai <ping.bai@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abel Vesa <abelvesa@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-06-10 14:24:11, Marc Zyngier wrote:
> Abel,
> 
> On 10/06/2019 13:13, Abel Vesa wrote:
> > i.MX8MQ is missing the wake_request signals from GIC to GPCv2. This indirectly
> > breaks cpuidle support due to inability to wake target cores on IPIs.
> > 
> > Here is the link to the errata (see e11171):
> > 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.nxp.com%2Fdocs%2Fen%2Ferrata%2FIMX8MDQLQ_0N14W.pdf&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7Ce23f69dbe37c4e83d7ab08d6eda6f062%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636957698629664098&amp;sdata=tAFuqTJBWiSbeoUv8gqA9vQfeWAklCv3t4qk0RLJQKM%3D&amp;reserved=0
> > 
> > Now, in order to fix this, we can trigger IRQ 32 (hwirq 0) to all the cores by
> > setting 12th bit in IOMUX_GPR1 register. In order to control the target cores
> > only, that is, not waking up all the cores every time, we can unmask/mask the
> > IRQ 32 in the first GPC IMR register. So basically we can leave the IOMUX_GPR1
> > 12th bit always set and just play with the masking and unmasking the IRO 32 for
> > each independent core.
> > 
> > Since EL3 is the one that deals with powering down/up the cores, and since the
> > cores wake up in EL3, EL3 should be the one to control the IMRs in this case.
> > This implies we need to get into EL3 on every IPI to do the unmasking, leaving
> > the masking to be done on the power-up sequence by the core itself.
> > 
> > In order to be able to get into EL3 on each IPI, we 'hijack' the registered smp
> > cross call handler, in this case the gic_raise_softirq which is registered by
> > the irq-gic-v3 driver and register our own handler instead. This new handler is
> > basically a wrapper over the hijacked handler plus the call into EL3.
> > 
> > To get into EL3, we use a custom vendor SIP id added just for this purpose.
> > 
> > All of this is conditional for i.MX8MQ only.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  drivers/irqchip/irq-imx-gpcv2.c | 42 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
> > index 66501ea..b921105 100644
> > --- a/drivers/irqchip/irq-imx-gpcv2.c
> > +++ b/drivers/irqchip/irq-imx-gpcv2.c
> > @@ -6,11 +6,19 @@
> >   * published by the Free Software Foundation.
> >   */
> >  
> > +#include <linux/arm-smccc.h>
> > +#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> > +#include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/irqchip.h>
> >  #include <linux/syscore_ops.h>
> > +#include <linux/smp.h>
> > +
> > +#define IMX_SIP_GPC		0xC2000004
> > +#define IMX_SIP_GPC_CORE_WAKE	0x00
> >  
> >  #define IMR_NUM			4
> >  #define GPC_MAX_IRQS            (IMR_NUM * 32)
> > @@ -73,6 +81,37 @@ static struct syscore_ops imx_gpcv2_syscore_ops = {
> >  	.resume		= gpcv2_wakeup_source_restore,
> >  };
> >  
> > +static void (*__gic_v3_smp_cross_call)(const struct cpumask *, unsigned int);
> > +
> > +static void imx_gpcv2_raise_softirq(const struct cpumask *mask,
> > +					  unsigned int irq)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	/* call the hijacked smp cross call handler */
> > +	__gic_v3_smp_cross_call(mask, irq);
> 
> I'm feeling a bit sick... :-(
> 
> > +
> > +	/* now call into EL3 and take care of the wakeup */
> > +	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_GPC_CORE_WAKE,
> > +			*cpumask_bits(mask), 0, 0, 0, 0, 0, &res);
> 
> There is a number of things that look wrong here:
> 
> - What guarantees that this SMC call actually exists? The DT itself just
> says that this is broken, and not much about EL3.

OK, that's easy to fix.

> 
> - What guarantees that the cpumask matches the physical layout? I could
> have booted via kexec, and logical CPU0 is now physical CPU3.
> 

Fair point. I didn't think of that. Will have to put some thought into it.

> - What if you have more than 64 CPUs? Probably not a big deal for this
> particular instance, but I fully expect people to get it wrong again on
> the next iteration if we "fix" it for them.

That will never be the case. This is done in the irq-imx-gpcv2, so it
won't be used by any other platform. It's just a workaround for the 
gpcv2.

> 
> - How does it work on a 32bit kernel, when firmware advertises a SMC64 call?
> 

This is also easy to fix.

> And also:
> 
> - IMX_SIP_GMC doesn't strike me as a very distinctive name. It certainly
> doesn't say *which* SiP is responsible for this wonderful thing. I
> understand that they would like to stay anonymous, but still...
> 

Fair point. The idea is to have a class of SIPs just for the GPC needed actions.
One thing that will come in the near future is the move of all the IMR 
(Interrupt Mask Register) control (which is part of the GPC) to TF-A.
This IMX_SIP_GPC will be extended then to every action required by the IMR
and so on. Remember, GPC is more than a power controller. It's an irqchip
too.

> - It isn't clear what you gain from relying on the kernel to send the
> SGI, while you could do the whole thing at EL3.

OK, how would you suggest to wake a core on an IPI from EL3 ?

> 
> > +}
> > +
> > +static void imx_gpcv2_wake_request_fixup(void)
> > +{
> > +	struct regmap *iomux_gpr;
> > +
> > +	/* hijack the already registered smp cross call handler */
> > +	__gic_v3_smp_cross_call = __smp_cross_call;
> > +
> > +	/* register our workaround handler for smp cross call */
> > +	set_smp_cross_call(imx_gpcv2_raise_softirq);
> > +
> > +	iomux_gpr = syscon_regmap_lookup_by_compatible("fsl,imx6q-iomuxc-gpr");
> > +	if (!IS_ERR(iomux_gpr))
> > +		regmap_update_bits(iomux_gpr, IOMUXC_GPR1, IMX6Q_GPR1_GINT,
> > +					IMX6Q_GPR1_GINT);
> > +}
> > +
> >  static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
> >  {
> >  	struct gpcv2_irqchip_data *cd = d->chip_data;
> > @@ -269,6 +308,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
> >  		cd->wakeup_sources[i] = ~0;
> >  	}
> >  
> > +	if (of_property_read_bool(node, "broken-wake-request-signals"))
> > +		imx_gpcv2_wake_request_fixup();
> > +
> >  	/* Let CORE0 as the default CPU to wake up by GPC */
> >  	cd->cpu2wakeup = GPC_IMR1_CORE0;
> >  
> > 
> 
> Overall, I find this horrible, and pretty pointless:
> 
> - Supporting this in mainline is likely to be a loosing battle (let's
> get real here, nobody will get the updated firmware)
> 
> - It doesn't solve some other problems such as the lack of LPI and PPI
> wakeup, as it was outlined in the previous iteration of such workaround.
> 
> Given this, I'm drawing the same conclusion as last time: this isn't fit
> for mainline. The real mainline fix is to prevent the use of cpuidle.
> This workaround is best kept in a vendor-specific tree.
> 
> Thanks,
> 
> 	M.
> -- 
> Jazz is not dead. It just smells funny...
