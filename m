From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: RE: [PATCH 1/4] MFD: Add TPS659038 documentation under Palmas
Date: Tue, 2 Jul 2013 09:42:41 +0000
Message-ID: <DC88CAD03C0052499C1907B327FC63229F80C6@DBDE04.ent.ti.com>
References: <1371726289-10042-1-git-send-email-j-keerthy@ti.com>
 <DC88CAD03C0052499C1907B327FC63229EF495@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-omap-owner@vger.kernel.org
To: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "ldewangan@nvidia.com" <ldewangan@nvidia.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "swarren@nvidia.com" <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hello Grant,

> -----Original Message-----
> From: J, KEERTHY
> Sent: Thursday, June 27, 2013 10:03 AM
> To: grant.likely@secretlab.ca
> Cc: broonie@kernel.org; ldewangan@nvidia.com; sameo@linux.intel.com;
> swarren@nvidia.com; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; devicetree-discuss@lists.ozlabs.org;
> gg@slimlogic.co.uk; linux-omap@vger.kernel.org
> Subject: RE: [PATCH 1/4] MFD: Add TPS659038 documentation under Palmas
> 
> Hi Grant,
> 
> 
> > -----Original Message-----
> > From: J, KEERTHY
> > Sent: Monday, June 24, 2013 6:26 PM
> > To: grant.likely@secretlab.ca
> > Cc: broonie@kernel.org; ldewangan@nvidia.com; sameo@linux.intel.com;
> > swarren@nvidia.com; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; devicetree-discuss@lists.ozlabs.org;
> > gg@slimlogic.co.uk; J, KEERTHY; linux-omap@vger.kernel.org
> > Subject: RE: [PATCH 1/4] MFD: Add TPS659038 documentation under
> Palmas
> >
> > Hello Grant,
> >
> > > -----Original Message-----
> > > From: J, KEERTHY
> > > Sent: Thursday, June 20, 2013 4:35 PM
> > > To: linux-omap@vger.kernel.org; grant.likely@secretlab.ca
> > > Cc: broonie@kernel.org; J, KEERTHY; ldewangan@nvidia.com;
> > > sameo@linux.intel.com; swarren@nvidia.com; linux-
> > > kernel@vger.kernel.org; linux-doc@vger.kernel.org; devicetree-
> > > discuss@lists.ozlabs.org; gg@slimlogic.co.uk
> > > Subject: [PATCH 1/4] MFD: Add TPS659038 documentation under Palmas
> > >
> > > Add TPS659038 documentation under Palmas.
> > >
> >
> > Could you pull this Please?
> 
> A gentle ping on this.
>

A gentle ping on this. Could you pull this one?
 
> >
> > > Signed-off-by: J Keerthy <j-keerthy@ti.com>
> > > Acked-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/palmas.txt |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt
> > > b/Documentation/devicetree/bindings/mfd/palmas.txt
> > > index 7bcd59c..89cb773 100644
> > > --- a/Documentation/devicetree/bindings/mfd/palmas.txt
> > > +++ b/Documentation/devicetree/bindings/mfd/palmas.txt
> > > @@ -5,6 +5,7 @@ twl6035 (palmas)
> > >  twl6037 (palmas)
> > >  tps65913 (palmas)
> > >  tps65914 (palmas)
> > > +tps659038
> > >
> > >  Required properties:
> > >  - compatible : Should be from the list @@ -14,6 +15,7 @@ Required
> > > properties:
> > >    ti,tps65913
> > >    ti,tps65914
> > >    ti,tps80036
> > > +  ti,tps659038
> > >  and also the generic series names
> > >    ti,palmas
> > >  - interrupt-controller : palmas has its own internal IRQs
> > > --
> > > 1.7.5.4
> >
> > Regards,
> > Keerthy
> 
> Regards,
> Keerthy

Regards,
Keerthy
