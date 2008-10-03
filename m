From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: The new DTS language enhancements
Date: Fri, 3 Oct 2008 11:02:52 +1000
Message-ID: <20081003010252.GD3002@yookeroo.seuss>
References: <1222889827.28471.3.camel@ld0161-tx32>
	<3643ED8C-2AED-405A-8C7E-432FB311DE6A@kernel.crashing.org>
	<fa686aa40810011551w7250a5cdoc0d928456ea34d3b@mail.gmail.com>
	<11973616-0AA9-4CA4-BC12-7B896DDF533C@kernel.crashing.org>
	<20081002143648.GJ11662@yookeroo.seuss>
	<1222964591.9242.9.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1222964591.9242.9.camel@ld0161-tx32>
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
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 02, 2008 at 11:23:11AM -0500, Jon Loeliger wrote:
> On Fri, 2008-10-03 at 00:36 +1000, David Gibson wrote:
> >  Although, the one bit I did
> > post - the integer expressions support - was met with deafening
> > silence, which is a bit frustrating.
> 
> On the contrary, by the time you had posted your patch,
> I had a complete run-time evaluation environment running
> in my development tree and it seemed a dramatic step backwards
> to apply your patch and then work around it.

Heh.  Well, I'm glad I'm not the only one guilty of being
insufficiently transparent about what I'm working on.  Bear in mind
that when I posted the expression support patch, the last thing I'd
heard on the topic was "yeah, we've been talking about this for ages
and should probably do it...".

I'm not dead-set against a runtime evaluation environment, by the way,
although I'm certainly not fully convinced we need it.  But I do
loathe the current proposed syntax.  I guess one reason I like the
macro approach is it's less syntax that needs to be invented, and
therefore less opportunity for language design mistakes.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
