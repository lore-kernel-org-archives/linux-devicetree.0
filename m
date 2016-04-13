From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: RE: [PATCH 4/6] staging: fsl-mc: Use platform_msi_* infrastructure
Date: Wed, 13 Apr 2016 14:57:17 +0000
Message-ID: <HE1PR04MB1641695115F9C31A4A620CBB8D960@HE1PR04MB1641.eurprd04.prod.outlook.com>
References: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
 <1460543456-11345-5-git-send-email-mbrugger@suse.com>
 <570E25DD.9070106@arm.com> <570E2C2C.6090900@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <570E2C2C.6090900@suse.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Matthias Brugger <mbrugger@suse.com>, Marc Zyngier <marc.zyngier@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "German.Rivera@freescale.com" <German.Rivera@freescale.com>, "jiang.liu@linux.intel.com" <jiang.liu@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bp@suse.de" <bp@suse.de>, "bhaktipriya96@gmail.com" <bhaktipriya96@gmail.com>, "agraf@suse.de" <agraf@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jroedel@suse.de" <jroedel@suse.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treding@nvidia.com" <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Matthias Brugger [mailto:mbrugger@suse.com]
> Sent: Wednesday, April 13, 2016 6:23 AM
> To: Marc Zyngier <marc.zyngier@arm.com>; gregkh@linuxfoundation.org; robh+dt@kernel.org;
> frowand.list@gmail.com; grant.likely@linaro.org; German.Rivera@freescale.com;
> jiang.liu@linux.intel.com; tglx@linutronix.de
> Cc: treding@nvidia.com; Stuart Yoder <stuart.yoder@nxp.com>; jroedel@suse.de; agraf@suse.de;
> bp@suse.de; matthias.bgg@gmail.com; bhaktipriya96@gmail.com; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; devel@driverdev.osuosl.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 4/6] staging: fsl-mc: Use platform_msi_* infrastructure
> 
> 
> 
> On 13/04/16 12:56, Marc Zyngier wrote:
> > On 13/04/16 11:30, Matthias Brugger wrote:
> >> From: Matthias Brugger <matthias.bgg@gmail.com>
> >>
> >> The fsl-mc driver can't be build as a module because it uses msi_*
> >> functions directly. Port the driver to use the platform_msi_*
> >> infrastructure instead, to allow it to be build as a module.
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> ---
> >>   .../staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c |   5 +-
> >>   drivers/staging/fsl-mc/bus/mc-allocator.c          |   9 +-
> >>   drivers/staging/fsl-mc/bus/mc-msi.c                | 169 +--------------------
> >>   drivers/staging/fsl-mc/include/mc-sys.h            |   3 +
> >>   4 files changed, 14 insertions(+), 172 deletions(-)
> >>
> >> diff --git a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c b/drivers/staging/fsl-
> mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> >> index 720e2b0..0eecb7e 100644
> >> --- a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> >> +++ b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
> >> @@ -25,7 +25,6 @@ static struct irq_chip its_msi_irq_chip = {
> >>   	.irq_mask = irq_chip_mask_parent,
> >>   	.irq_unmask = irq_chip_unmask_parent,
> >>   	.irq_eoi = irq_chip_eoi_parent,
> >> -	.irq_set_affinity = msi_domain_set_affinity
> >>   };
> >>
> >>   static int its_fsl_mc_msi_prepare(struct irq_domain *msi_domain,
> >> @@ -86,7 +85,7 @@ int __init its_fsl_mc_msi_init(void)
> >>   			continue;
> >>   		}
> >>
> >> -		mc_msi_domain = fsl_mc_msi_create_irq_domain(
> >> +		mc_msi_domain = platform_msi_create_irq_domain(
> >>   						 of_node_to_fwnode(np),
> >>   						 &its_fsl_mc_msi_domain_info,
> >>   						 parent);
> >
> > What? We are already creating a platform MSI domain for the ITS. How is
> > that going to work? If you want to convert this set of drivers to
> > platform ITS, fine. But you can't randomly hack in the ITS code and pray
> > for things not to fall apart.
> >
> 
>  From what I see, the difference between irq-gic-v3-its-fsl-mc-msi and
> the irq-gic-v3-its-platform-msi is the way ITS specific DeviceID is
> created in msi_prepare.
> 
> German, is there a reason why you use the ICID read from the DPRC as dev_id?

Because it _is_ the dev_id at the hardware level.  There is an fsl-mc bus
specific mechanism to get that id...it's not in the device tree.

Stuart
