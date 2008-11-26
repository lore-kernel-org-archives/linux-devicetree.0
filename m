From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] libfdt: Add version.lds file
Date: Wed, 26 Nov 2008 12:47:53 +1100
Message-ID: <20081126014753.GF3420@yookeroo.seuss>
References: <20081125142149.GB2340@yoda.jdub.homelinux.org>
	<E1L517Q-0001Is-Fh@jdl.com>
	<20081125165747.GB17258@yoda.jdub.homelinux.org>
	<20081125171648.GC17258@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081125171648.GC17258-JVa43G0qJ78RlTYtMZUE4cJ8OCA1ciLf@public.gmane.org>
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

On Tue, Nov 25, 2008 at 12:16:48PM -0500, Josh Boyer wrote:
> On Tue, Nov 25, 2008 at 11:57:47AM -0500, Josh Boyer wrote:
> >On Tue, Nov 25, 2008 at 10:50:32AM -0600, Jon Loeliger wrote:
> >>> Add the initial symbol versioning file as groundwork for creating
> >>> a libfdt shared library
> >>> 
> >>> Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> >>> ---
> >>>  libfdt/version.lds |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>>  1 files changed, 48 insertions(+), 0 deletions(-)
> >>>  create mode 100644 libfdt/version.lds
> >>> 
> >>> diff --git a/libfdt/version.lds b/libfdt/version.lds
> >>> new file mode 100644
> >>> index 0000000..7d90672
> >>> --- /dev/null
> >>> +++ b/libfdt/version.lds
> >>> @@ -0,0 +1,48 @@
> >>> +LIBFDT_1.2 {
> >>> +	global:
> >>> +		fdt_next_node;
> >>> +		fdt_check_header;
> >>> +		fdt_move;
> >>> +		fdt_string;
> >>
> >>Oh wow....  Any mechanism for making this a NOT hard-coded list?
> >>Some in-source macro-doo-dad-flag-setup-section-list thing?
> >
> >Yeah, I had the same thought.  I'll look a bit more, but this is what
> >libhugetlbfs is using at the moment.  The only other library I'm
> >remotely familiar with that does versioning is glibc.  Maybe they
> >have magic foo I can steal.
> 
> No really awesome magic.  They have a similar mechanism of having
> a hard-coded list.  We could do something like this in the source
> code:

Not to mention that looking at glibc source tends to make one's eyes
bleed.

> #define fdt_func ver_1_2_fdt_func
> int fdt_func(...) {
> 
> and then this in version.lds:
> 
> LIBFDT_1.2 {
> 	global:
> 		ver_1_2*;
> }
> 
> but that seems pretty ugly too...

I concur

> The hard-coded list is pretty simple, at the risk of missing things.

I'm actually not too wirried about missing things.  If we miss
something, it's pretty easy to fix.  It probably would be a good idea
to make the testsuite build against the shared version of the library
to verify that at least the functions exercised there are correctly
exposed.

I'm marginally more worried about an overbroad wildcard including
something we didn't really want exposed.  I think the versioning
script needs a:
	local:
		*
after the global list to to inhibit exposing everything else.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
