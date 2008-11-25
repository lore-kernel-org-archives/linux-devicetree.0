From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt shared library
Date: Tue, 25 Nov 2008 14:08:52 +1100
Message-ID: <20081125030852.GB685@yookeroo.seuss>
References: <20081118174752.GA2332@yoda.jdub.homelinux.org>
	<20081119033819.GK29577@yookeroo.seuss>
	<20081119062506.495469c5@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081119062506.495469c5-jnIq6iUNB1CO8iYQgJmm/0EOCMrvLtNR@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2008 at 06:25:06AM -0500, Josh Boyer wrote:
> On Wed, 19 Nov 2008 14:38:19 +1100
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> > On Tue, Nov 18, 2008 at 12:47:52PM -0500, Josh Boyer wrote:
> > > Hi All,
> > > 
> > > There's been a bug open for a while to get a libfdt shared
> > > library built in Fedora:
> > > 
> > > http://bugzilla.redhat.com/show_bug.cgi?id=443882
> > > 
> > > This would have benefits for things like qemu and other
> > > applications that don't really need to statically link the
> > > libfdt.a into the binary itself.
> > > 
> > > The reason we're waiting is because it would be best to
> > > have the upstream project define the soname and versioning
> > > that would be used.  As mentioned in the bug, it could be
> > > as simple as using the base dtc version that it is split
> > > from, but for commonality reasons we'd want to settle on
> > > a single way to do it.  That belongs upstream.
> > > 
> > > So this is my plea for coming up with a solution.  I can
> > > code up patches, but I thought some discussion would be
> > > proper first.
> > 
> > Um.. well.. first for your immediate issue of getting libfdt into
> > Fedora, can I suggest you just use the static library.  Sure, a shared
> > library would be nice, but libfdt is sufficiently small that I don't
> > think it's that bad to link statically with it.
> 
> It's sort-of already in Fedora.  At least the source is in DTC.
> However, Fedora has rules about static libraries and when they can be
> provided.  I asked about this in the above bug report, but really what
> we're after is the shared version.

Heh, alright.

> > Longer term it would be nice to build a shared object of libfdt with
> > the rest.  Soname is pretty easy to come up with, but we should
> > possibly also do symbol versioning for further security against future
> > changes breaking things.  My current philosophy is to try very hard to
> > keep the libfdt API stable, but not try particularly hard to keep the
> > ABI stable.
> 
> OK, fine by me.  Do you want to continue on with that, or should I look
> at doing something along those lines?  The symbol versioning part would
> take me a bit.

Uh.. doesn't look like I'm going to have time for this any time soon.
So you might as well.  Maybe look at libhugetlbfs for an example of
the symbol versioning - it has a somewhat similar makefile setup, and
is reasonable simple.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
