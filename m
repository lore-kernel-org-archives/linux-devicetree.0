From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] ePAPR 1.1 to do list
Date: Mon, 20 Sep 2010 12:44:55 +1000
Message-ID: <20100920024455.GG5045@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F@az33exm25.fsl.freescale.net>
	<20100913131752.54981fb1@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100913131752.54981fb1-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
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
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 13, 2010 at 01:17:52PM -0500, Scott Wood wrote:
> On Mon, 30 Aug 2010 14:34:44 -0700
> Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > I've consolidated what I am aware of with respect to errors found in
> > 1.0,
> > clarifications needed, and new mechanisms to go into ePAPR 1.1 into
> > a single list.
> > 
> > Let me know if you are aware of anything else.
> > 
> > ePAPR 1.1 To Do
> > ---------------
> > 
> > 1. Fix typos, misc cleanup
> > 
> >    -device_type="simple-bus" in 8572 soc node example (p.96)
> >    -p.51, line 27-- ET_EXEC is 0x2 not 0x1
> >    -p.41, broken cross reference
> >    -missing period on virtual reg on ns16550
> 
> 2.3.11 says device_type should only be present for cpu and memory
> nodes, but the example trees in the appendices contain device_type =
> "serial", "network", "pci", and "open-pic" (as well as the simple-bus
> error mentioned above).

Ugh, yeah.  This is a little complicated.  So, the rule of thumb we've
been using in the wild is slightly more nuanced than ePAPR states.  It
is basically:
	- *do* use device_type on cpu and memory nodes
	- use of existing real-OF defined device types ("serial",
"network" and "pci") is acceptable, but not required.  It's quite
likely that existing OSes may use "pci" in particular, so this is
somewhat important for compatibility with OF practice
	- absolutely *don't* define and use any new, not already OF
established device_type values

"open-pic" has its own complications.  It's very nasty to have it in
an ePAPR context, but of course the open-pic binding is an old real-OF
binding that will specify "device_type", and existing open-pic drivers
may expect it.

I'm not sure how best to deal with these.

> In general the examples should be checked for compliance and current
> best practices (e.g. the 8572ds tree has a node named "soc8572") -- and
> perhaps should show what the tree looks like after "filled in by
> u-boot" has taken place.

I think such a general audit is a very good idea, though.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
