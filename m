From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: Add version.lds file
Date: Wed, 26 Nov 2008 13:11:51 +1100
Message-ID: <20081126021151.GG3420@yookeroo.seuss>
References: <20081125142149.GB2340@yoda.jdub.homelinux.org>
	<E1L517Q-0001Is-Fh@jdl.com>
	<20081125165747.GB17258@yoda.jdub.homelinux.org>
	<20081125171648.GC17258@yoda.jdub.homelinux.org>
	<20081126014753.GF3420@yookeroo.seuss>
	<20081125205718.68a92b73@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081125205718.68a92b73-jnIq6iUNB1CO8iYQgJmm/0EOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 25, 2008 at 08:57:18PM -0500, Josh Boyer wrote:
> On Wed, 26 Nov 2008 12:47:53 +1100
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> > > The hard-coded list is pretty simple, at the risk of missing things.
> > 
> > I'm actually not too wirried about missing things.  If we miss
> > something, it's pretty easy to fix.  It probably would be a good idea
> > to make the testsuite build against the shared version of the library
> > to verify that at least the functions exercised there are correctly
> > exposed.
> 
> That's a good idea.  I'll see what I can do there.
> 
> > I'm marginally more worried about an overbroad wildcard including
> > something we didn't really want exposed.  I think the versioning
> > script needs a:
> > 	local:
> > 		*
> > after the global list to to inhibit exposing everything else.
> 
> Ah, yes.  It would be good for someone with more of a clue than me to
> vet the list I have in the file right now, and make sure I didn't
> include/omit things that shouldn't/should be there.  Once that is done,
> I can do the local thing.

Oh, sorry forgot to add, everything on your list so far looks like it
should be exposed.  Omissions I'll need to look more carefully.  But
if the testsuite builds against it we should be pretty right.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
