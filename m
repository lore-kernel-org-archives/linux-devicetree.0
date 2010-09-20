From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Mon, 20 Sep 2010 11:35:21 +1000
Message-ID: <20100920013521.GD5045@yookeroo>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
	<1283994479.4420.6.camel@pororo> <20100913022036.GD5505@yookeroo>
	<1284355802.2877.56.camel@pororo> <20100913060324.GB13154@yookeroo>
	<20100916174020.GA7550@angua.secretlab.ca>
	<20100916175617.7e36ed0e@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100916175617.7e36ed0e-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 16, 2010 at 05:56:17PM -0500, Scott Wood wrote:
> On Thu, 16 Sep 2010 11:40:20 -0600
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
[snip]
> > - Revisit the meaning of top-level compatible.
> >   - I still don't think it makes sense for one board to claim
> >     compatibility with another,
> 
> Most of the time it doesn't, but there may be circumstances where things
> are only added, or where a new revision just fixes bugs but software
> that works around the bugs will still work.
> 
> If we don't allow claiming compatibility in those cases, it may
> encourage people to lie and claim to just be that old board with no
> more specific entry in the list (or just not put the board rev in the
> name at all -- which might be reasonable if the rev info is presented
> in a separate property, allowing things like greater-than/less-than
> comparisons).

I concur on the whole.  Claiming compatibility at the top-level has
its problems, but I don't think outright banning it is a nett win.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
