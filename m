From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [Qemu-devel] Machine config files
Date: Sat, 15 Nov 2008 17:52:25 +1100
Message-ID: <20081115065225.GF6629@yookeroo.seuss>
References: <200811140332.14093.paul@codesourcery.com>
	<fb412d760811140954j3252216cj226805ecfc002ffd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fb412d760811140954j3252216cj226805ecfc002ffd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Hollis Blanchard <hollis-yUx37fBWTUITNcAmw9vGhQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2008 at 11:54:24AM -0600, Hollis Blanchard wrote:
> On Thu, Nov 13, 2008 at 9:32 PM, Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org> wrote:
> > It's come up in other contexts recently, so I think it's worth mentioning that
> > I am currently working on adding a machine config file support to qemu.
> >
> > I am focusing on the board setup side of things, rather than the user-level
> > config side.  My goal is to come up with a system that will allow e.g. the
> > entirety of realview.c and gumstix.c to be eliminated.  Currently this is
> > based this round Flattened Device Trees (as used by ppc-linux).
> >
> > I have looked at the bits that Fabrice did a while ago. While that contains
> > some good ideas (which I will probably steal!) it is approaching the problem
> > from a somewhat different direction.  FTDs are a much better fit for some of
> > my requirements (e.g. being able to pass the config through to the guest OS).
> >
> > I haven't entirely figured out how this will interact with user config (in
> > particular user-pluggable devices like PCI NICs), but I think I can come up
> > with something fairly sensible.
> 
> Sounds great! For what it's worth, in the PowerPC KVM patches that
> I'll be posting here soon, we also use a flat device tree and pass it
> to the guest. We start with a template .dtb file in pc-bios/, then
> modify things like memory nodes at runtime based on qemu's command
> line options.
> 
> One practical consideration is that libfdt isn't generally available
> as a standalone package. I requested that Debian and Fedora create
> packages for it, and they agreed, but those obviously aren't available
> in older versions or other Linux distributions.

Yeah, I probably should have been a bit more active to try to get dtc
and libfdt packaged for the various distros.  Oh well, they'll get it
eventually.

> In the meantime, we could either include a libfdt snapshot in qemu
> (which is how it was originally intended to be used), or require users
> to build and install the package from source.

Well.. libfdt is designed to be easy to embed in other projects so
that it can be incorporated into things like embedded bootloaders
which will usually have interesting linking requirements.  For a
userspace application like this it would be nicer to use a system
version, still, merging a snapshot is a reasonable approach for the
interim until libfdt is more widely packaged.

It would be good to make sure, though, that you merge it in such a way
that it's easy to update from upstream.  Again, libfdt is laid out so
that this should be easy.

If you want extra things in libfdt that would be convenient for you,
just ask.  The idea is that we build libfdt's features based on what
people want my way of fdt manipulation.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
