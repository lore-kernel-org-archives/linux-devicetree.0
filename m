From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] ARM: gic: use a private mapping for CPU target
 interfaces
Date: Wed, 7 Nov 2012 10:11:00 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1211070950250.21033@xanadu.home>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-5-git-send-email-lorenzo.pieralisi@arm.com>
 <20121106221651.GE21764@mudshark.cambridge.arm.com>
 <alpine.LFD.2.02.1211061755260.21033@xanadu.home>
 <20121107102357.GD23305@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121107102357.GD23305-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
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
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 7 Nov 2012, Will Deacon wrote:

> On Tue, Nov 06, 2012 at 10:59:35PM +0000, Nicolas Pitre wrote:
> > On Tue, 6 Nov 2012, Will Deacon wrote:
> > > >  	/*
> > > > +	 * Get what the GIC says our CPU mask is.
> > > > +	 */
> > > > +	BUG_ON(cpu >= 8);
> > > > +	cpu_mask = readl_relaxed(dist_base + GIC_DIST_TARGET + 0);
> > > 
> > > Making the mask a u8 and using readb_relaxed here makes this bit of code
> > > clearer to me (and the GIC apparently allows such an access to this
> > > register).
> > 
> > Not always.  At least RTSM throws an exception if you do so.
> > Been there.
> 
> That would be a bug in the RTSM then. Have you reported it to support? (if
> not, I can chase this one up). I'd rather we just fix the model than work
> around it in Linux.

I have no problem with you chasing it down with the support people.

I don't want to wait for fixed RTSM versions to be released and the 
whole world to migrate to them though.

While the readl is maybe marginally unintuitive compared to a readb 
here, the code is always using readl everywhere else already, even using 
bit masking and shifting when a readb/writeb could have made the code 
much simpler (see gic_set_affinity() for example).  I therefore much 
prefer to stick to a proven 32-bit access than risking regression on 
some possible implementation where the 8-bit access wasn't properly 
implemented as the doc says it should and never exercised before.

In other words, I prefer erring on the safe side here.


Nicolas
