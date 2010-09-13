From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: ARM machine specific DT probing
Date: Mon, 13 Sep 2010 16:03:25 +1000
Message-ID: <20100913060324.GB13154@yookeroo>
References: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
	<1283994479.4420.6.camel@pororo> <20100913022036.GD5505@yookeroo>
	<1284355802.2877.56.camel@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284355802.2877.56.camel@pororo>
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

On Mon, Sep 13, 2010 at 01:30:02PM +0800, Jeremy Kerr wrote:
> Hi David,
> 
> > Hrm.  The trouble with this idea is that it needs some measure of
> > "specificness of match",
> 
> I was originally thinking an enum, something to indicate that the match
> is for a machine or SoC or SoC-family, but that may not be flexible
> enough.
> 
> Essentially, all we really need to indicate is that "this match is more
> specific than that other match", which the match-table-ordering would
> work fine for.
> 
> With the present infrastructure, we'd need to enforce this by
> controlling the link order. However, I don't have any good ideas about
> how we could do this neatly.

Right, hence the fiddly.  As a first cut, you could just split the
table into multiple pieces - traverse the "per-soc" table, then the
"per-machine" table.  That should be pretty easy to implement and if
you build your macros and whatnot correctly it should be possible to
then generalize that without requiring changes on the individual
machine description declaration side.

> Maybe we could get make to work out the dependencies (this mdesc needs
> to go before that one) for us :D

Heh, maybe.  Interesting idea, though potentially hairy.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
