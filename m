From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 10:28:26 +1000
Message-ID: <20100519002826.GG25892@yookeroo>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<201005181324.45701.jeremy.kerr@canonical.com>
	<20100518084954.GC25892@yookeroo>
	<alpine.LFD.2.00.1005180802010.12758@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1005180802010.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 18, 2010 at 08:24:06AM -0400, Nicolas Pitre wrote:
> On Tue, 18 May 2010, David Gibson wrote:
> > On Tue, May 18, 2010 at 01:24:43PM +0800, Jeremy Kerr wrote:
> > > Nicolas Pitre wrote:
[snip]
> > The only reason you'd need a subarchitecture number or equivalent is
> > if you need to do things differently in the very, very early asm boot
> > code.  We may need a minimal form of this on PowerPC if we ever
> > support multiple MMU families in the same kernel binary.
> 
> Exact.  For example, on ARM the machine ID is also used to figure out 
> the MMU mapping needed to be able to simply be able to debug the very 
> early assembly boot stage when there isn't even a stack available. While 
> this info is stored in the machine record, it is actually 
> subarchitecture specific and already half-digested for easy usage by 
> that initial MMU setup.  I just don't want to imagine what the 
> equivalent functionality with DT would look like.

Well, it wouldn't be *that* bad - you'd need a minimal asm-only tree
walker to find and look up the compatible property.  Quite possible
but, yes, fairly awkward.

Yeah, if you have to make really early MMU decisions based on
subarchitecture it probbaly makes sense to have a simple ID for
those.  So one thing to consider here is that we've contemplated
adding an "MMU family" ID to the device tree blob header for this
purpose on PowerPC.  If we did such a thing, it could also be used on
ARM for a similar purpose.  Then all the relevant machine information
is in one block, and it's just a simple fixed dereference to extract
the MMU type from the early asm.

I'd have to talk to Ben et al, but I think we'd be happy enough to
create a new dtb v18 which included that field, as well as a couple of
other small improvements to the header and blob internals.  ARM could
standardize on that as the minimum acceptable dtb version.

> > > Therefore, I don't think we need the machine ID at all: once the DT is 
> > > available, we can use that for any machine-specific stuff. Even though we're 
> > > not *configuring* it from the device tree, we can *select* it from there 
> > > instead.
> > 
> > Yes, absolutely.
> 
> Please see above why I disagree.

Well, I see your point for the early MMU stuff.  However, I'm betting
there's other, later platform related setup which could just as easily
be selected bsaed on the device tree, rather than on a magic ID.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
