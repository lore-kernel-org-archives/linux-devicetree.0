From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Fri, 3 Oct 2008 10:23:59 +1000
Message-ID: <20081003002359.GC3002@yookeroo.seuss>
References: <48E396A3.809@freescale.com>
	<20081002011800.GI25598@yookeroo.seuss>
	<20081002152242.GB22258@ld0162-tx32.am.freescale.net>
	<20081002.135004.1723231860.imp@bsdimp.com>
	<1222980362.9242.25.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1222980362.9242.25.camel@ld0161-tx32>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 02, 2008 at 03:46:02PM -0500, Jon Loeliger wrote:
> On Thu, 2008-10-02 at 13:50 -0600, M. Warner Losh wrote:
> > In message: <20081002152242.GB22258-VKaLA/mbEU932VTgPCOETVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
> >             Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> > : On Thu, Oct 02, 2008 at 11:18:00AM +1000, David Gibson wrote:
> > : > > I vote against anything similar to the C preprocessor.
> > : > 
> > : > Why?
> > : 
> > : It's not nearly as powerful as the semantic approach, and it is
> > : syntactically clumsy (I do *not* want to have to put a backslash at the
> > : end of every line within a macro, for example).
> > 
> > And there are no looping constructs at all in CPP.  You flat out can't
> > do a generalized for loop with the macro language, for example.  Its
> > symbols also do not map 1-1/onto symbols used by the dts files.  It
> > can only grok macros you define for it, so it has no way of knowing
> > many useful things that dts just knows.
> > 
> > Basically, it is using a hammer to pound screws in.  Sure, it seems to
> > work, but the results are shoddy.
> > 
> > Warner
> 
> Also, it  might be worth noting that if one uses "-I dts -O dts"
> with my patch set, it is pretty-darn similar behavior to a simple
> pre-processing pass that simply expands the original constructs
> into a flat DTS file like we have today.

Sorry, I don't see the relevance of this.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
