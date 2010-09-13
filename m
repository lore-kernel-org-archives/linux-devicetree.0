From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Mon, 13 Sep 2010 12:20:36 +1000
Message-ID: <20100913022036.GD5505@yookeroo>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
	<1283994479.4420.6.camel@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1283994479.4420.6.camel@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 09, 2010 at 09:07:59AM +0800, Jeremy Kerr wrote:
> Hi Nicolas,
> 
> > What Jeremy did is to add a probe_dt method in the mdesc structure, and 
> > then the core is calling them in sequence until one of them returns 
> > success.
> > 
> > now, the "compatible" property is explained here:
> > 
> > http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property
> > 
> > From my understanding, this could allow for a kernel that doesn't yet 
> > support the specifics of a particular board to still be able to work 
> > using basic common support.  But for this to work, wouldn't it be 
> > necessary for the core code to try to find the best match itself rather 
> > than letting each machine's  probe_dt decide on their own?
> 
> At present, the probe_dt function is a binary match/no-match indicator,
> so the core code just selects the first match it finds. This means that
> we'll need one mdesc per machine; I'm intending to keep it simple to
> start with.
> 
> My intention in the longer-term is to allow probe_dt to indicate
> less-specific matches (eg, match on the SoC family), and change the core
> code to not break out of the loop on the first match, but continue to
> look for a better match. This way, we can have one mdesc to support a
> SoC family, but still allow that to be overridden if there's a more
> specific (eg, single machine) mdesc compiled in.

Hrm.  The trouble with this idea is that it needs some measure of
"specificness of match", and I'm not sure you can come up with an
encoding of that which is better than just order in the match
table. i.e. if you construct your match table such that more specific
matches precede less specific ones, you don't need to keep scanning
the table and then work out which is the "best" match.

> The reason I do this in the machine-specific code (rather than the core
> code checking the compatible property) is to allow the probe_dt function
> to check arbitrary data in the device tree. Perhaps we have two
> variations of a machine - both with the same compatible property, but
> distinguishable in some other way, and we need a separate mdesc for
> whatever reason.

Exactly: you do need to cover this unfortunate, but inevitable case.
The trouble is I don't see how you can have a specificness measure
without starting to make assumptions about what the probe function is
checking.

Getting the probe table ordered by specificness will be fiddly in some
cases, but not, I suspect more so than the hard cases would be anyway
with a specificness measure.  And I think it's as versatile an
encoding of specificness as you're likely to get.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
