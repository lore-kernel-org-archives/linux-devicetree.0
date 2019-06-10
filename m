From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 1/2] irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ
 ERR11171
Date: Mon, 10 Jun 2019 14:12:48 +0000
Message-ID: <20190610141246.2xyod7zq3txm76o6@fsr-ub1664-175>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610121346.15779-2-abel.vesa@nxp.com>
 <7d8a537d-7883-196a-bcb3-7ee36117074a@arm.com>
 <20190610133830.iruld46dgb2gvnx5@fsr-ub1664-175>
 <44ce3775-29d2-8f17-9410-1896d6385e4d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <44ce3775-29d2-8f17-9410-1896d6385e4d@arm.com>
Content-Language: en-US
Content-ID: <61CE8B7E28F12E4086911DFD1B8CFF03@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 19-06-10 14:51:48, Marc Zyngier wrote:
> On 10/06/2019 14:38, Abel Vesa wrote:
> > On 19-06-10 14:24:11, Marc Zyngier wrote:
> >> Abel,
> >>
> >> On 10/06/2019 13:13, Abel Vesa wrote:
> >>> i.MX8MQ is missing the wake_request signals from GIC to GPCv2. This i=
ndirectly
> >>> breaks cpuidle support due to inability to wake target cores on IPIs.
> >>>
> >>> Here is the link to the errata (see e11171):
> >>>
> >>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.nxp.com%2Fdocs%2Fen%2Ferrata%2FIMX8MDQLQ_0N14W.pdf&amp;data=3D02%7C01%7C=
abel.vesa%40nxp.com%7Cf74b196c8beb46599f8408d6edaace09%7C686ea1d3bc2b4c6fa9=
2cd99c5c301635%7C0%7C0%7C636957715230445874&amp;sdata=3DruP3qm1NTLTdoLC5XDu=
0uN5yNKLb4%2F2iP9kF5vdr1OI%3D&amp;reserved=3D0
> >>>
> >>> Now, in order to fix this, we can trigger IRQ 32 (hwirq 0) to all the=
 cores by
> >>> setting 12th bit in IOMUX_GPR1 register. In order to control the targ=
et cores
> >>> only, that is, not waking up all the cores every time, we can unmask/=
mask the
> >>> IRQ 32 in the first GPC IMR register. So basically we can leave the I=
OMUX_GPR1
> >>> 12th bit always set and just play with the masking and unmasking the =
IRO 32 for
> >>> each independent core.
> >>>
> >>> Since EL3 is the one that deals with powering down/up the cores, and =
since the
> >>> cores wake up in EL3, EL3 should be the one to control the IMRs in th=
is case.
> >>> This implies we need to get into EL3 on every IPI to do the unmasking=
, leaving
> >>> the masking to be done on the power-up sequence by the core itself.
> >>>
> >>> In order to be able to get into EL3 on each IPI, we 'hijack' the regi=
stered smp
> >>> cross call handler, in this case the gic_raise_softirq which is regis=
tered by
> >>> the irq-gic-v3 driver and register our own handler instead. This new =
handler is
> >>> basically a wrapper over the hijacked handler plus the call into EL3.
> >>>
> >>> To get into EL3, we use a custom vendor SIP id added just for this pu=
rpose.
> >>>
> >>> All of this is conditional for i.MX8MQ only.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> >>> ---
> >>>  drivers/irqchip/irq-imx-gpcv2.c | 42 +++++++++++++++++++++++++++++++=
++++++++++
> >>>  1 file changed, 42 insertions(+)
> >>>
> >>> diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-im=
x-gpcv2.c
> >>> index 66501ea..b921105 100644
> >>> --- a/drivers/irqchip/irq-imx-gpcv2.c
> >>> +++ b/drivers/irqchip/irq-imx-gpcv2.c
> >>> @@ -6,11 +6,19 @@
> >>>   * published by the Free Software Foundation.
> >>>   */
> >>> =20
> >>> +#include <linux/arm-smccc.h>
> >>> +#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
> >>> +#include <linux/mfd/syscon.h>
> >>>  #include <linux/of_address.h>
> >>>  #include <linux/of_irq.h>
> >>> +#include <linux/regmap.h>
> >>>  #include <linux/slab.h>
> >>>  #include <linux/irqchip.h>
> >>>  #include <linux/syscore_ops.h>
> >>> +#include <linux/smp.h>
> >>> +
> >>> +#define IMX_SIP_GPC		0xC2000004
> >>> +#define IMX_SIP_GPC_CORE_WAKE	0x00
> >>> =20
> >>>  #define IMR_NUM			4
> >>>  #define GPC_MAX_IRQS            (IMR_NUM * 32)
> >>> @@ -73,6 +81,37 @@ static struct syscore_ops imx_gpcv2_syscore_ops =
=3D {
> >>>  	.resume		=3D gpcv2_wakeup_source_restore,
> >>>  };
> >>> =20
> >>> +static void (*__gic_v3_smp_cross_call)(const struct cpumask *, unsig=
ned int);
> >>> +
> >>> +static void imx_gpcv2_raise_softirq(const struct cpumask *mask,
> >>> +					  unsigned int irq)
> >>> +{
> >>> +	struct arm_smccc_res res;
> >>> +
> >>> +	/* call the hijacked smp cross call handler */
> >>> +	__gic_v3_smp_cross_call(mask, irq);
> >>
> >> I'm feeling a bit sick... :-(
> >>
> >>> +
> >>> +	/* now call into EL3 and take care of the wakeup */
> >>> +	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_GPC_CORE_WAKE,
> >>> +			*cpumask_bits(mask), 0, 0, 0, 0, 0, &res);
> >>
> >> There is a number of things that look wrong here:
> >>
> >> - What guarantees that this SMC call actually exists? The DT itself ju=
st
> >> says that this is broken, and not much about EL3.
> >=20
> > OK, that's easy to fix.
>=20
> Sure. How?
>=20

If the SMC_UNK is returned, then we keep the IOMUX_GPR1 bit 12 set and the =
IMR1 bit 0
for that core unset. That would always wake up the cores and therefore no t=
he
cpuidle will not have any effect.

> >=20
> >>
> >> - What guarantees that the cpumask matches the physical layout? I coul=
d
> >> have booted via kexec, and logical CPU0 is now physical CPU3.
> >>
> >=20
> > Fair point. I didn't think of that. Will have to put some thought into =
it.
> >=20
> >> - What if you have more than 64 CPUs? Probably not a big deal for this
> >> particular instance, but I fully expect people to get it wrong again o=
n
> >> the next iteration if we "fix" it for them.
> >=20
> > That will never be the case. This is done in the irq-imx-gpcv2, so it
> > won't be used by any other platform. It's just a workaround for the=20
> > gpcv2.
>=20
> "never"? That's a pretty strong statement. Given that the same IP has
> been carried across a number of implementations, I fully expect imx9 (or
> whatever the next generation is labeled) to use the same stuff.
>=20

Again, this workaround will only apply to i.MX8MQ. IIRC, the gic500 was the
one that added the wake_request signals, gic400 didn't gave them.
And i.MX8MQ is the first NXP SoC to use the gic500. All the newer i.MX SoC
which use GPCv2 don't have this issue. So it's obviously related to
the switch from gic400 to gic500 when interfacing with GPCv2.

> >=20
> >>
> >> - How does it work on a 32bit kernel, when firmware advertises a SMC64=
 call?
> >>
> >=20
> > This is also easy to fix.
> >=20
> >> And also:
> >>
> >> - IMX_SIP_GMC doesn't strike me as a very distinctive name. It certain=
ly
> >> doesn't say *which* SiP is responsible for this wonderful thing. I
> >> understand that they would like to stay anonymous, but still...
> >>
> >=20
> > Fair point. The idea is to have a class of SIPs just for the GPC needed=
 actions.
>=20
> I don't know what meaning you give to the "SIP" acronym, but the SMCCC
> documentation clearly has a different definition:
>=20
> "SiP	: Silicon Partner. In this document, the silicon manufacturer."
>=20
> What I'm asking for is that the silicon vendor's name to be clearly
> spoken out.

Fair point. TBH, I used the same naming I found in some other subsystems up=
stream.
If you grep the tree for IMX_SIP you will find IMX_SIP_TIMER, IMX_SIP_SRTC =
and
IMX_SIP_CPUFREQ.

So I only followed the pattern here.

>=20
> > One thing that will come in the near future is the move of all the IMR=
=20
> > (Interrupt Mask Register) control (which is part of the GPC) to TF-A.
> > This IMX_SIP_GPC will be extended then to every action required by the =
IMR
> > and so on. Remember, GPC is more than a power controller. It's an irqch=
ip
> > too.
> >=20
> >> - It isn't clear what you gain from relying on the kernel to send the
> >> SGI, while you could do the whole thing at EL3.
> >=20
> > OK, how would you suggest to wake a core on an IPI from EL3 ?
>=20
> Erm... By writing to the ICC_SGI1R_EL1 system register, directly from
> EL3, just before you apply your workaround?

Right, but how will you know in EL3 that an IPI has been raised ?

>=20
> 	M.
> --=20
> Jazz is not dead. It just smells funny...=
