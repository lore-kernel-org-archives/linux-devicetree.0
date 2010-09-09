From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Thu, 09 Sep 2010 09:07:59 +0800
Message-ID: <1283994479.4420.6.camel@pororo>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1009081523500.19366-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

> What Jeremy did is to add a probe_dt method in the mdesc structure, and 
> then the core is calling them in sequence until one of them returns 
> success.
> 
> now, the "compatible" property is explained here:
> 
> http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property
> 
> From my understanding, this could allow for a kernel that doesn't yet 
> support the specifics of a particular board to still be able to work 
> using basic common support.  But for this to work, wouldn't it be 
> necessary for the core code to try to find the best match itself rather 
> than letting each machine's  probe_dt decide on their own?

At present, the probe_dt function is a binary match/no-match indicator,
so the core code just selects the first match it finds. This means that
we'll need one mdesc per machine; I'm intending to keep it simple to
start with.

My intention in the longer-term is to allow probe_dt to indicate
less-specific matches (eg, match on the SoC family), and change the core
code to not break out of the loop on the first match, but continue to
look for a better match. This way, we can have one mdesc to support a
SoC family, but still allow that to be overridden if there's a more
specific (eg, single machine) mdesc compiled in.

The reason I do this in the machine-specific code (rather than the core
code checking the compatible property) is to allow the probe_dt function
to check arbitrary data in the device tree. Perhaps we have two
variations of a machine - both with the same compatible property, but
distinguishable in some other way, and we need a separate mdesc for
whatever reason.

Cheers,


Jeremy
