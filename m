From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] ARM: gic: use a private mapping for CPU target
 interfaces
Date: Wed, 7 Nov 2012 10:23:57 +0000
Message-ID: <20121107102357.GD23305@mudshark.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-5-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106221651.GE21764@mudshark.cambridge.arm.com>
 <alpine.LFD.2.02.1211061755260.21033@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1211061755260.21033-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2012 at 10:59:35PM +0000, Nicolas Pitre wrote:
> On Tue, 6 Nov 2012, Will Deacon wrote:
> > >  arch/arm/common/gic.c | 42 ++++++++++++++++++++++++++++++++++--------
> > >  1 file changed, 34 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
> > > index aa52699..1338a55 100644
> > > --- a/arch/arm/common/gic.c
> > > +++ b/arch/arm/common/gic.c
> > > @@ -70,6 +70,13 @@ struct gic_chip_data {
> > >  static DEFINE_RAW_SPINLOCK(irq_controller_lock);
> > >  
> > >  /*
> > > + * The GIC mapping of CPU interfaces does not necessarily match
> > > + * the logical CPU numbering.  Let's use a mapping as returned
> > > + * by the GIC itself.
> > > + */
> > > +static u8 gic_cpu_map[8] __read_mostly;
> > 
> > Can we have a #define for the number CPUs supported by the GIC? It gets
> > used a fair amount in this patch for loop bounds etc.
> 
> Sure.  I'll respin the patch.

Cheers Nicolas.

> > >  	/*
> > > +	 * Get what the GIC says our CPU mask is.
> > > +	 */
> > > +	BUG_ON(cpu >= 8);
> > > +	cpu_mask = readl_relaxed(dist_base + GIC_DIST_TARGET + 0);
> > 
> > Making the mask a u8 and using readb_relaxed here makes this bit of code
> > clearer to me (and the GIC apparently allows such an access to this
> > register).
> 
> Not always.  At least RTSM throws an exception if you do so.
> Been there.

That would be a bug in the RTSM then. Have you reported it to support? (if
not, I can chase this one up). I'd rather we just fix the model than work
around it in Linux.

Will
